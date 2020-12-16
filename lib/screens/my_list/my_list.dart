import 'package:flutter/material.dart';
import 'package:phone_blocker/resources/app_colors.dart';
import 'package:phone_blocker/resources/text_styles.dart';
import 'package:phone_blocker/widgets/my_list/collections_view.dart';
import 'package:phone_blocker/widgets/my_list/my_collection_view.dart';

class MyList extends StatefulWidget {
  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Align(
          alignment: Alignment.topLeft,
          child: Text(
            "My List (8)",
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
                      hintStyle: TextStyles.Caption.apply(color : AppColors.PLACE_HOLDER)
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top : 8.0),
        child: Column(
          children: [
            MyCollectionView(),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: CollectionsView(),
            ),
          ],
        ),
      ),
    );
  }
}
