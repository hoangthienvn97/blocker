import 'package:flutter/material.dart';
import 'package:phone_blocker/screens/login/login.dart';
import 'package:phone_blocker/widgets/intro_widgets.dart/intro_setting_widget.dart';
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
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 84.0),
                    child: TextStyleText("Turn On Spam Protection", 24,
                        FontWeight.w500, 0, ConfigColor.TEXT),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextStyleText(
                        "This will block numbers in your blocking list",
                        14,
                        FontWeight.normal,
                        0.25,
                        Color(0xff484848)),
                  ),
                ),
              ],
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
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IntroSetting("1.", "Open", " iPhone Settings"),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Image.asset(Assets.ICON_SETTING_INTRO),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: Row(
                              children: [
                                IntroSetting("2.", "Tap on", " Phone"),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Image.asset(Assets.ICON_PHONE_INTRO),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: Row(
                              children: [
                                IntroSetting("3.", "Turn on ",
                                    " Call Blocking & Identification"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: Row(
                              children: [
                                IntroSetting(
                                    "4.", "Turn on all", " [App Name] options"),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Image.asset(Assets.ICON_SWITCH_INTRO),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () => navigatorPush(context,Login()),
              child: Image.asset(Assets.IMAGE_OPEN_SETTING_INTRO),
            ),
          ),
        ],
      ),
    );
  }
}
