import 'package:flutter/material.dart';
import 'package:phone_blocker/core/api/api.dart';
import 'package:phone_blocker/core/common/commons.dart';
import 'package:phone_blocker/core/models/responses/collections_response.dart';
import 'package:phone_blocker/core/models/responses/collections_without_pagination_response.dart';
import 'package:phone_blocker/core/models/responses/reported_phone_numbers_response.dart';
import 'package:phone_blocker/resources/app_colors.dart';
import 'package:phone_blocker/resources/localizations.dart';
import 'package:phone_blocker/resources/text_styles.dart';
import 'package:phone_blocker/screens/home.dart';
import 'package:phone_blocker/screens/my_list/my_collection.dart';
import 'package:phone_blocker/widgets/button.dart/button.dart';
import 'package:phone_blocker/widgets/my_list/collections_view.dart';
import 'package:phone_blocker/widgets/my_list/my_collection_view.dart';

import '../../core/models/collections_with_pagination.dart';
import '../../core/models/model_common.dart';

class MyList extends StatefulWidget {
  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  ReportedPhoneNumbersResponse reportedPhoneNumbersResponse;

  CollectionsWithoutPaginationResponse collectedCollections;
  bool isLoading = true;

  TextEditingController searchController = TextEditingController();
  List<Collection> collections = List();
  @override
  void initState() {
    super.initState();
    _refresh();
  }

  void _refresh() {
    setState(() {
      isLoading = true;
    });
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
        isLoading = false;
        reportedPhoneNumbersResponse = reportedPhoneNumbers;
      });
    } catch (exception) {}
  }

  _onGetCollectedCollectionSuccess(
      CollectionsWithoutPaginationResponse collectionsResponse) {
    try {
      this.setState(() {
        collectedCollections = collectionsResponse;
        this.collections.clear();
        this.collections.addAll(collectionsResponse.data);
      });
    } catch (exception) {}
  }

  bool _hasMyCollection() {
    return reportedPhoneNumbersResponse != null &&
        reportedPhoneNumbersResponse.data.isNotEmpty;
  }

  void _getCollectedCollections() {
    Api().getCollectedCollections(
        onSuccess: _onGetCollectedCollectionSuccess,
        onError: (errorResponse) => {print(errorResponse)});
  }

  DateTime _lastUpdateTime() {
    if (_hasMyCollection()) {
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

  void search(String query) {
    setState(() {
      collections.clear();
      var x = collectedCollections.data.where((element) =>
          element.name.toLowerCase().contains(query.toLowerCase()));
      collections.addAll(x);
    });
  }

  @override
  Widget build(BuildContext context) {
    var title = collectedCollections != null
        ? "${Localized.get.mylistTitle} (${this.collectedCollections.data.length})"
        : Localized.get.mylistTitle;
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
                      controller: searchController,
                      onChanged: (value) => search(value),
                      style: new TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          suffixIcon: Icon(Icons.search, color: Colors.black38),
                          hintText: Localized.get.mylistSearch,
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
                    flex: 2,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 64.0),
                            child: Image.asset(Assets.IMAGE_CHECK_LIST),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 24.0),
                            child: Text(
                              Localized.get.mylistNoItems,
                              style:
                                  TextStyles.Body1,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40.0, right: 20 , left: 20),
                        child: ButtonSecondary(
                          onTap: () => navigatorPush(context, Home()),
                          background: AppColors.PRIMARY,
                          label: Localized.get.browser,
                          textColor: Colors.white,
                          borderColor: AppColors.PRIMARY,
                        ),
                      ),
                    ),
                  ),
                ]),
              )
            : Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _hasMyCollection()
                          ? MyCollectionView(
                              lastUpdateTime: _lastUpdateTime(),
                              onViewDetailsClick: () => {
                                Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MyCollection()))
                                    .then((value) => {_refresh()})
                              },
                            )
                          : null,
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: CollectionsView(
                          CollectionsResponse(
                            success: true,
                            data: CollectionWithPagination(items: collections),
                          ),
                          onItemCountChanged: () => {this.setState(() {})},
                          onCollectionUnBlocked: (index) => {
                            this.setState(() {
                              collectedCollections.data.removeAt(index);
                            })
                          },
                        ),
                      )
                    ].where((element) => element != null).toList(),
                  ),
                ),
              ),
      ),
    );
  }
}
