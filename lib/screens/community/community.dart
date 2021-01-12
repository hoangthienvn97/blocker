import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phone_blocker/resources/app_colors.dart';
import 'package:phone_blocker/resources/text_styles.dart';
import '../../core/api/api.dart';
import '../../core/models/model_common.dart';
import '../../widgets/community_widgets/communities_widget.dart';

class Community extends StatefulWidget {
  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  bool isLoading = false;

  TextEditingController searchController = TextEditingController();

  CollectionsResponse collectionsResponse;

  List<Collection> collections = List();
  @override
  void initState() {
    super.initState();
    _getCollections();
  }

  _getCollections() {
    setState(() {
      isLoading = true;
    });

    Api().getCollections(
      onSuccess: _onGetColletionsSuccess,
      onError: (errorResponse) => {},
    );
  }

  _onGetColletionsSuccess(CollectionsResponse response) {
    try {
      this.setState(
        () {
          this.collectionsResponse = response;
          this.collections.clear();
          this.collections.addAll(response.data.items);
          isLoading = false;
        },
      );
    } catch (exception) {}
  }

  void search(String query) {
    setState(() {
      collections.clear();
      var x = collectionsResponse.data.items.where((element) =>
          element.name.toLowerCase().contains(query.toLowerCase()));
      collections.addAll(x);
    });
  }

  @override
  Widget build(BuildContext context) {
    var progressWidget = new Container(
      child: Center(
        child: CircularProgressIndicator(strokeWidth: 5),
      ),
    );

    if (isLoading) {
      return progressWidget;
    }
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          brightness: Brightness.light,
          backgroundColor: AppColors.PRIMARY_LIGHT,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(32),
            ),
          ),
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Search".toUpperCase(),
              style: TextStyles.Headline2.apply(color: AppColors.PRIMARY),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(70.0),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 15.0),
              child: Center(
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: new BorderRadius.all(
                      Radius.circular(32),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextField(
                      onTap: () {
                        FocusScopeNode currentFocus = FocusScope.of(context);

                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                      },
                      controller: searchController,
                      onChanged: (value) => search(value),
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
        body: Column(
          children: [
            SortCommunity(),
            Expanded(
              child: Scrollbar(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: collections.length,
                  itemBuilder: (context, index) =>
                      PostCommunity(collections[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
