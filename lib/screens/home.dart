import 'package:flutter/material.dart';
import 'package:phone_blocker/core/common/commons.dart';
import 'package:phone_blocker/core/models/model_common.dart';
import 'package:phone_blocker/resources/app_colors.dart';
import 'package:phone_blocker/resources/text_styles.dart';
import 'package:phone_blocker/screens/community/community.dart';
import 'package:phone_blocker/screens/more/more_screen.dart';
import 'package:phone_blocker/screens/my_list/my_list.dart';

import 'report/report.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var tabs = [Community(), Container(), MyList(), More()];

  bool isLoading = false;

  CollectionsResponse collectionsResponse;

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
    return Scaffold(
      body: tabs[_selectedTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTabIndex,
        onTap: _changeIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.PRIMARY,
        unselectedItemColor: AppColors.PLACE_HOLDER,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(Assets.ICON_COMMUNITY),
            title: Text(
              "Community",
              style: TextStyles.Body2,
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(Assets.ICON_REPORT),
            title: Text(
              "Report",
              style: TextStyles.Body2,
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(Assets.ICON_LIST),
            title: Text(
              "My List",
              style: TextStyles.Body2,
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(Assets.ICON_MORE),
            title: Text(
              "More",
              style: TextStyles.Body2,
            ),
          ),
        ],
      ),
    );
  }
}
