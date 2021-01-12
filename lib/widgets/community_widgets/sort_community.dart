import 'package:flutter/material.dart';
import 'package:phone_blocker/resources/app_colors.dart';
import 'package:phone_blocker/resources/localizations.dart';
import 'package:phone_blocker/resources/text_styles.dart';
import '../../core/common/commons.dart';

class SortCommunity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  Localized.get.communityCommunityTitle,
                  style: TextStyles.Headline3.apply(color: AppColors.PRIMARY),
                )),
          ),
          Expanded(
            flex: 1,
            child: FlatButton(
              onPressed: () async => {},
              child: Image.asset(Assets.ICON_SORT,
                  color: Colors.black, height: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
