import 'package:flutter/material.dart';
import 'package:phone_blocker/core/common/commons.dart';
import 'package:phone_blocker/resources/text_styles.dart';
import 'package:phone_blocker/screens/home.dart';
import 'package:phone_blocker/screens/report/report.dart';

class SuccessReport extends StatefulWidget {
  @override
  _SuccessReportState createState() => _SuccessReportState();
}

class _SuccessReportState extends State<SuccessReport> {
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
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(Assets.IMAGE_LOGO_SUCCESS)),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: <InlineSpan>[
                            TextSpan(
                              text: 'Thanks for reporting',
                              style: TextStyles.Body1,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: <InlineSpan>[
                              TextSpan(
                                text: 'a spam phone number',
                                style: TextStyles.Body1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => navigatorPush(context, Report()),
                      child: Image.asset(Assets.IMAGE_REPORT_OTHER_PHONE),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top : 16.0),
                      child: GestureDetector(
                        onTap: () => navigatorPush(context, Home()),
                        child: Image.asset(Assets.IMAGE_BACK_HOME),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
