import 'package:flutter/material.dart';
import 'package:phone_blocker/core/common/commons.dart';
import 'package:phone_blocker/resources/app_colors.dart';
import 'package:phone_blocker/resources/localizations.dart';
import 'package:phone_blocker/resources/text_styles.dart';
import 'package:phone_blocker/screens/login/login.dart';
import 'package:phone_blocker/screens/more/about_us.dart';
import 'package:phone_blocker/screens/more/feed_back.dart';
import 'package:phone_blocker/widgets/more_widgets/more_widget.dart';

class More extends StatefulWidget {
  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  void logoutUser() async {
    await removeKey(PreferencesKeys.AccessToken);
    await popToRootAndPushReplacement(context, Login());
  }

  String name = "";
  String email = "";
  String avatarUrl;

  _getLocalData() async {
    name = await readString(PreferencesKeys.Name) ?? "";
    email = await readString(PreferencesKeys.Email) ?? "";
    avatarUrl = await readString(PreferencesKeys.AvatarUrl);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getLocalData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.GREY_BORDER,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                color: Colors.white,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 90.0),
                        child: avatarUrl != null
                            ? Image.network(avatarUrl)
                            : Image.asset(Assets.IMAGE_AVATAR),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Text(
                          name,
                          style: TextStyles.Headline2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          email,
                          style: TextStyles.Caption,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              flex: 5,
              child: Column(children: [
                MoreWidget(
                  image: Image.asset(Assets.ICON_ABOUT_US),
                  name: Localized.get.moreAboutUs,
                  onPress: () => navigatorPush(context, AboutUs()),
                ),
                SizedBox(height: 8),
                MoreWidget(
                  image: Image.asset(Assets.ICON_FEEDBACK),
                  name: Localized.get.moreFeedback,
                  onPress: () =>
                      navigatorPush(context, FeedBack()),
                ),
                SizedBox(height: 8),
                MoreWidget(
                  image: Image.asset(Assets.ICON_RATE),
                  name: Localized.get.moreRateTheApp,
                  onPress: null,
                ),
                SizedBox(height: 8),
                MoreWidget(
                  image: Image.asset(Assets.ICON_LOGOUT),
                  name: Localized.get.moreLogOut,
                  onPress: () => logoutUser(),
                ),
              ]),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: Column(
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: <InlineSpan>[
                          TextSpan(
                            text: Localized.get.loginDescription3,
                            style: TextStyles.Subtitle1.apply(
                                color: AppColors.PRIMARY),
                          ),
                          TextSpan(
                            text: Localized.get.loginDescription4,
                            style: TextStyles.Subtitle1.apply(
                                color: AppColors.COLOR0),
                          ),
                          TextSpan(
                            text: Localized.get.loginDescription5,
                            style: TextStyles.Subtitle1.apply(
                                color: AppColors.PRIMARY),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        Localized.get.moreVersion,
                        style: TextStyles.Body2.apply(
                            color: AppColors.PLACE_HOLDER),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
