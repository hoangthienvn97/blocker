import 'package:flutter/material.dart';
import 'package:phone_blocker/resources/app_colors.dart';
import 'package:phone_blocker/resources/localizations.dart';
import 'package:phone_blocker/resources/text_styles.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black, size: 14),
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        title: Align(
            alignment: Alignment.topLeft,
            child: Text(
              Localized.get.feedbackBack,
              style: TextStyles.Subtitle2,
            )),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    Localized.get.moreAboutUs,
                    style: TextStyles.Headline2.apply(color: AppColors.PRIMARY),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
