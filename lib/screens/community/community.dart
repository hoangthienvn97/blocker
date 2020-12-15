import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/api/api.dart';
import '../../core/models/model_common.dart';
import '../../screens/report/report.dart';
import '../../widgets/community_widgets/communities_widget.dart';
import '../../core/common/commons.dart';

class Community extends StatefulWidget {
  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  bool isLoading = false;

  CollectionsResponse collectionsResponse;

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
        onSuccess: (collectionsResponse) => {
              this.setState(() {
                this.collectionsResponse = collectionsResponse;
                isLoading = false;
              })
            },
        onError: (errorResponse) => {
              // Todo show error toast
              print(errorResponse.data.message)
            });
  }

  int _selectedTabIndex = 0;
  _changeIndex(int index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Report(),
        ),
      );
    } else {
      setState(
        () {
          _selectedTabIndex = index;
        },
      );
    }
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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        brightness: Brightness.light,
        backgroundColor: ConfigColor.APPBAR,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(32),
          ),
        ),
        title: Align(
          alignment: Alignment.centerLeft,
          child: TextStyleText("Search".toUpperCase(), 24.0, FontWeight.w500, 2,
              ConfigColor.TEXT),
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
                    onSubmitted: (value) {},
                    style: new TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: Icon(Icons.search, color: Colors.black38),
                      hintText: "Enter phone or name",
                      hintStyle: new TextStyle(
                        color: Color(0xff828282),
                        fontFamily: 'RobotoMono',
                        fontSize: 12,
                        fontStyle: FontStyle.normal,
                        letterSpacing: 0.4,
                      ),
                    ),
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
                itemCount: collectionsResponse.data.length,
                itemBuilder: (context, index) {
                  PostCommunity item =
                      PostCommunity(collectionsResponse.data[index]);
                  item.onBlockClick = () async => {
                        if (!collectionsResponse.data[index].collected)
                          {
                            Api().postCollected(
                                collectionsResponse.data[index].id,
                                onSuccess: (collectionResponse) => {
                                      // show toast
                                      _getCollections()
                                    },
                                onError: (errorResponse) => {
                                      // show toast error
                                    })
                          }
                      };
                  item.onLikeClick = () async => {
                        if (!collectionsResponse.data[index].favorited)
                          {
                            await Api().postFavorite(
                                collectionsResponse.data[index].id,
                                onSuccess: (_) => {_getCollections()},
                                onError: (_) => {})
                          }
                        else
                          {
                            await Api().deleteFavorite(
                                collectionsResponse.data[index].id,
                                onSuccess: (_) => {_getCollections()},
                                onError: (_) => {})
                          },
                      };
                  return item;
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTabIndex,
        onTap: _changeIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(Assets.ICON_COMMUNITY, color: ConfigColor.TEXT),
            title: TextStyleText(
                "Community", 14, FontWeight.normal, 0.25, ConfigColor.TEXT),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(Assets.ICON_REPORT, color: Color(0xff828282)),
            title: TextStyleText(
                "Report", 14, FontWeight.normal, 0.25, Color(0xff828282)),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(Assets.ICON_LIST, color: Color(0xff828282)),
            title: TextStyleText(
                "My list", 14, FontWeight.normal, 0.25, Color(0xff828282)),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(Assets.ICON_MORE, color: Color(0xff828282)),
            title: TextStyleText(
                "More", 14, FontWeight.normal, 0.25, Color(0xff828282)),
          ),
        ],
      ),
    );
  }
}
