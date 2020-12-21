import 'package:flutter/material.dart';
import 'package:phone_blocker/core/api/api.dart';
import 'package:phone_blocker/core/common/commons.dart';
import 'package:phone_blocker/core/models/responses/collections_response.dart';
import 'package:phone_blocker/core/models/responses/reported_phone_numbers_response.dart';
import 'package:phone_blocker/resources/app_colors.dart';
import 'package:phone_blocker/resources/text_styles.dart';
import 'package:phone_blocker/screens/home.dart';
import 'package:phone_blocker/widgets/my_list/collections_view.dart';
import 'package:phone_blocker/widgets/my_list/my_collection_view.dart';

class MyList extends StatefulWidget {
  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  ReportedPhoneNumbersResponse reportedPhoneNumbersResponse;

  CollectionsResponse collectedCollections;

  @override
  void initState() {
    super.initState();
    _getCollectedCollections();
    _getMyCollection();
  }

  void _getMyCollection() {
    Api().getMyCollection(
        onSuccess: _onGetMyCollectionSuccess,
        onError: (errorResponse) => {print(errorResponse)});
  }

  _onGetMyCollectionSuccess(ReportedPhoneNumbersResponse reportedPhoneNumbers) {
    try {
      this.setState(() {
        reportedPhoneNumbersResponse = reportedPhoneNumbers;
      });
    } catch (exception) {}
  }

  _onGetCollectedCollectionSuccess(CollectionsResponse collectionsResponse) {
    try {
      this.setState(() {
        collectedCollections = collectionsResponse;
      });
    } catch (exception) {}
  }

  void _getCollectedCollections() {
    Api().getCollectedCollections(
        onSuccess: _onGetCollectedCollectionSuccess,
        onError: (errorResponse) => {print(errorResponse)});
  }

  DateTime _lastUpdateTime() {
    if (reportedPhoneNumbersResponse != null) {
      return reportedPhoneNumbersResponse.data.last.updatedAt;
    }

    return null;
  }

  bool _isNothingToShow() {
    return (collectedCollections == null ||
            collectedCollections.data.length == 0) &&
        (reportedPhoneNumbersResponse == null ||
            reportedPhoneNumbersResponse.data.length == 0);
  }

  @override
  Widget build(BuildContext context) {
    var title = collectedCollections != null
        ? "My List (${this.collectedCollections.data.length})"
        : "My List";
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        automaticallyImplyLeading: false,
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
                    onSubmitted: (value) {},
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
      body: _isNothingToShow()
          ? Container(
              child: Column(children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 64.0),
                        child: Image.asset(Assets.IMAGE_CHECK_LIST),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: Text(
                          "You don't have any collection in list",
                          style: TextStyles.Body1,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: GestureDetector(
                        onTap: () => navigatorPush(context, Home()),
                        child: Image.asset(Assets.IMAGE_BROWSER),
                      ),
                    ),
                  ),
                ),
              ]),
            )
          : Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: [
                  MyCollectionView(
                    lastUpdateTime: _lastUpdateTime(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: CollectionsView(
                      collectedCollections,
                      onItemCountChanged: () => {this.setState(() {})},
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
