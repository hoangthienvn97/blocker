import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phone_blocker/core/common/commons.dart';
import 'package:phone_blocker/resources/app_colors.dart';
import 'package:phone_blocker/resources/localizations.dart';
import 'package:phone_blocker/resources/text_styles.dart';
import 'package:phone_blocker/screens/login/login.dart';
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
    await _unblockAndClearAllNumbers();
  }

  static const platform =
      const MethodChannel('co.vacsolutions.callblocker/callBlocking');

  Future<void> _unblockAndClearAllNumbers() async {
    try {
      final result =
          await platform.invokeMethod('unblockAndClearAllNumbers', {});
      if (result == true) {
        print("Clear and Blocked ");
      } else {
        print(result);
      }
    } on PlatformException catch (e) {
      //batteryLevel = "Failed to get battery level: '${e.message}'.";
    }
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    avatarUrl != null
                        ? Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new NetworkImage(avatarUrl),
                              ),
                            ),
                          )
                        : Icon(Icons.person),
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
            SizedBox(height: 8),
            Expanded(
              flex: 5,
              child: Column(children: [
                // MoreWidget(
                //   image: Image.asset(Assets.ICON_ABOUT_US),
                //   name: Localized.get.moreAboutUs,
                //   onPress: () => null,
                //   //  navigatorPush(context, AboutUs()),
                // ),
                // SizedBox(height: 8),
                MoreWidget(
                  image: Image.asset(
                    Assets.ICON_FEEDBACK,
                    width: 24,
                    height: 24,
                  ),
                  name: Localized.get.moreFeedback,
                  onPress: () => navigatorPush(context, FeedBack()),
                ),
                SizedBox(height: 8),
                MoreWidget(
                  image: Image.asset(Assets.ICON_RATE, width: 24, height: 24),
                  name: Localized.get.moreRateTheApp,
                  onPress: null,
                ),
                SizedBox(height: 8),
                MoreWidget(
                  image: Image.asset(
                    Assets.ICON_LOGOUT,
                    height: 24,
                    width: 24,
                  ),
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
