import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:phone_blocker/resources/app_colors.dart';
import 'package:phone_blocker/resources/localizations.dart';
import 'package:phone_blocker/resources/text_styles.dart';
import 'package:phone_blocker/screens/login/login.dart';
import 'package:phone_blocker/widgets/button.dart/button.dart';
import 'package:phone_blocker/widgets/intro_widgets/intro_setting_widget.dart';
import '../../core/common/commons.dart';

class IntroBlock extends StatefulWidget {
  @override
  _IntroBlockState createState() => _IntroBlockState();
}

class _IntroBlockState extends State<IntroBlock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    Localized.get.introTitle,
                    style: TextStyles.Headline2.apply(color: AppColors.PRIMARY),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        Localized.get.introText,
                        style: TextStyles.Body2,
                      )),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Align(
                      alignment: Alignment.center,
                      child: Image.asset(Assets.IMAGE_UNDRAW)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Container(
                    alignment: Alignment.center,
                    child: Container(
                      width: 400,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                IntroSetting(
                                    "1.",
                                    Localized.get.introSetupStep11,
                                    Localized.get.introSetupStep12),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Image.asset(Assets.ICON_SETTING_INTRO, height: 24 , width: 24),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: Row(
                                children: [
                                  IntroSetting(
                                      "2.",
                                      Localized.get.introSetupStep21,
                                      Localized.get.introSetupStep22),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Image.asset(Assets.ICON_PHONE_INTRO , height: 24 , width: 24,),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: Row(
                                children: [
                                  IntroSetting(
                                      "3.",
                                      Localized.get.introSetupStep31,
                                      Localized.get.introSetupStep32),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: Row(
                                children: [
                                  IntroSetting(
                                      "4.",
                                      Localized.get.introSetupStep41,
                                      Localized.get.introSetupStep42),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child:
                                        Image.asset(Assets.ICON_SWITCH_INTRO,height: 24 , width: 24),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: ButtonSecondary(
              onTap: () => {
                popToRootAndPushReplacement(context, Login()),
                AppSettings.openLocationSettings()
              },
              background: AppColors.PRIMARY,
              label: Localized.get.introOpenSetting,
              textColor: Colors.white,
              borderColor: AppColors.PRIMARY,
            ),
          )
        ],
      ),
    );
  }
}
