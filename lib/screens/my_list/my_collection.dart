import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phone_blocker/core/api/api.dart';
import 'package:phone_blocker/core/models/phone_data_detail.dart';
import 'package:phone_blocker/core/models/responses/phone_detail_response.dart';
import 'package:phone_blocker/resources/app_colors.dart';
import 'package:phone_blocker/resources/text_styles.dart';
import 'package:phone_blocker/widgets/my_collection_widgets/my_collection_widget.dart';

class MyCollection extends StatefulWidget {
  @override
  _MyCollectionState createState() => _MyCollectionState();
}

class _MyCollectionState extends State<MyCollection> {
  PhoneDetailResponse phoneDetailResponse;

  TextEditingController searchController = TextEditingController();

  List<PhoneDataDetail> phoneDetail = List();

  @override
  void initState() {
    super.initState();
    Api().getDetails(
        onSuccess: (response) => {
              this.setState(() {
                this.phoneDetailResponse = response;
              })
            },
        onError: (error) => {print(error)});

        _blockedNumbers();
  }

  _unblocked(PhoneDataDetail phoneDataDetail) {
    setState(() {
      phoneDetailResponse.data
          .removeWhere((element) => element.id == phoneDataDetail.id);
    });
  }

  void search(String query) {
    setState(() {
      phoneDetail.clear();
      var x = phoneDetail.where(
          (element) => element.phone.toString().contains(query.toLowerCase()));
      phoneDetail.addAll(x);
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
    var title = phoneDetailResponse != null
        ? "My Collection (${this.phoneDetailResponse.data.length})"
        : "My Collection";
    return Scaffold(
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
                    onChanged: (value) => search(value),
                    controller: searchController,
                    style: new TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.search, color: Colors.black38),
                        hintText: "Enter phone or name",
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
        itemCount:
            phoneDetailResponse != null ? phoneDetailResponse.data.length : 0,
        itemBuilder: (context, index) =>
            MyCollectionWidget(phoneDetailResponse.data[index], _unblocked),
      ),
    );
  }
}
