import 'package:flutter/material.dart';
import 'package:phone_blocker/core/common/commons.dart';
import 'package:phone_blocker/core/models/model_common.dart';
import 'package:phone_blocker/resources/app_colors.dart';
import 'package:phone_blocker/resources/localizations.dart';
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
      popToRootAndPushReplacement(context, Report());
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
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.yellow,
        items: [
          BottomNavigationBarItem(
            icon: (_selectedTabIndex == 0) ? Image.asset(Assets.ICON_COM) : Image.asset(Assets.ICON_COMMUNITY),
            title: Text(
              Localized.get.homeCommunity,
              style: TextStyles.Body2.apply(
                color: (_selectedTabIndex == 0) ? AppColors.PRIMARY : AppColors.BLACK_TEXT
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(Assets.ICON_REPORT),
            title: Text(
              Localized.get.homeReport,
              style: TextStyles.Body2.apply(
                color: (_selectedTabIndex == 1) ? AppColors.PRIMARY : AppColors.BLACK_TEXT
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: (_selectedTabIndex == 2) ? Image.asset(Assets.ICON_LI) : Image.asset(Assets.ICON_LIST),
            title: Text(
              Localized.get.homeMyList,
              style: TextStyles.Body2.apply(
                color: (_selectedTabIndex == 2) ? AppColors.PRIMARY : AppColors.BLACK_TEXT
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: (_selectedTabIndex == 3) ? Image.asset(Assets.ICON_MO) : Image.asset(Assets.ICON_MORE),
            title: Text(
              Localized.get.homeMore,
              style: TextStyles.Body2.apply(
                color: (_selectedTabIndex == 3) ? AppColors.PRIMARY : AppColors.BLACK_TEXT
              ),
            ),
          ),
        ],
      ),
    );
  }
}
