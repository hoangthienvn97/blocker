import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phone_blocker/core/api/api.dart';
import 'package:phone_blocker/core/models/phone_data_detail.dart';
import 'package:phone_blocker/core/models/responses/phone_detail_response.dart';
import 'package:phone_blocker/resources/app_colors.dart';
import 'package:phone_blocker/resources/localizations.dart';
import 'package:phone_blocker/resources/text_styles.dart';
import 'package:phone_blocker/widgets/my_collection_widgets/my_collection_widget.dart';

class MyCollection extends StatefulWidget {
  @override
  _MyCollectionState createState() => _MyCollectionState();
}

class _MyCollectionState extends State<MyCollection> {
  PhoneDetailResponse phoneDetailResponse;

  TextEditingController searchController = TextEditingController();

  List<PhoneDataDetail> phoneDetails = List();

  @override
  void initState() {
    super.initState();
    Api().getDetails(
        onSuccess: (response) => {
              this.setState(() {
                this.phoneDetailResponse = response;
                phoneDetails.clear();
                phoneDetails.addAll(phoneDetailResponse.data);
              })
            },
        onError: (error) => {print(error)});

    _blockedNumbers();
  }

  _unblocked(PhoneDataDetail phoneDataDetail) {
    setState(() {
      phoneDetails.removeWhere((element) => element.id == phoneDataDetail.id);
    });
  }

  void search(String query) {
    setState(() {
      phoneDetails.clear();
      var x = phoneDetailResponse.data.where((element) =>
          element.phone.phone.toString().contains(query.toLowerCase()));
      phoneDetails.addAll(x);
    });
  }

  static const platform =
      const MethodChannel('co.vacsolutions.secretbox/callBlocking');
  Future<void> _blockedNumbers() async {
    try {
      final result = await platform.invokeMethod('blockedNumbers');
      print(result.toString());
    } on PlatformException catch (e) {
      //batteryLevel = "Failed to get battery level: '${e.message}'.";
    }
  }

  @override
  Widget build(BuildContext context) {
    var title = phoneDetails.length > 0
        ? "${Localized.get.myCollectionMyCollection} (${this.phoneDetails.length})"
        : "${Localized.get.myCollectionMyCollection}";
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: Align(
            alignment: Alignment.topLeft,
            child: Text(
              title,
              style: TextStyles.Headline2.apply(color: AppColors.PRIMARY),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(70.0),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 15.0),
              child: Center(
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.PLACE_HOLDER),
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: new BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      onChanged: (value) => search(value),
                      controller: searchController,
                      style: new TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          suffixIcon: Icon(Icons.search, color: Colors.black38),
                          hintText: Localized.get.communitySearchTitle,
                          hintStyle: TextStyles.Caption.apply(
                              color: AppColors.PLACE_HOLDER)),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: phoneDetails.length,
          itemBuilder: (context, index) =>
              MyCollectionWidget(phoneDetails[index], _unblocked),
        ),
      ),
    );
  }
}
