import 'package:flutter/material.dart';
import 'package:phone_blocker/core/common/commons.dart';
import 'package:phone_blocker/resources/app_colors.dart';
import 'package:phone_blocker/resources/text_styles.dart';
import 'package:phone_blocker/screens/login/login.dart';
import 'package:phone_blocker/widgets/button.dart/button.dart';

class Policy extends StatefulWidget {
  @override
  _PolicyState createState() => _PolicyState();
}

class _PolicyState extends State<Policy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Term of Services",
            style: TextStyles.Headline2.apply(color: AppColors.PRIMARY),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: Container(
              margin: new EdgeInsets.only(left: 16, right: 16, top: 16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "Nisi minim aliqua eiusmod sit laboris officia velit dolore culpa sit. Occaecat proident consequat id ex est nisi ullamco Lorem et ullamco occaecat in veniam do. Excepteur deserunt sint laboris qui. Mollit enim veniam ullamco enim voluptate excepteur quis in eu ullamco tempor eiusmod minim. Ut aliquip labore consequat voluptate sit amet laboris in aliqua do nostrud. Labore cupidatat consequat ipsum proident veniam ad labore. Duis et qui pariatur consectetur amet amet sunt excepteur tempor commodo irure. Qui quis dolor Lorem mollit sint excepteur nisi duis cillum officia elit cillum. Amet ipsum aute aliquip laborum cupidatat ut. Nulla do magna esse nostrud nostrud aliqua proident magna occaecat. In tempor sint velit duis ex enim. Culpa cupidatat non do veniam ut culpa non laborum tempor pariatur aliqua veniam occaecat in. Ex laboris sit do non anim fugiat pariatur tempor quis tempor. Mollit ut deserunt incididunt ad sunt ut proident anim minim. Sint est et nostrud elit nulla eu.",
                      style: TextStyles.Body2,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        "Nisi minim aliqua eiusmod sit laboris officia velit dolore culpa sit. Occaecat proident consequat id ex est nisi ullamco Lorem et ullamco occaecat in veniam do. Excepteur deserunt sint laboris qui. Mollit enim veniam ullamco enim voluptate excepteur quis in eu ullamco tempor eiusmod minim. Ut aliquip labore consequat voluptate sit amet laboris in aliqua do nostrud. Labore cupidatat consequat ipsum proident veniam ad labore. Duis et qui pariatur consectetur amet amet sunt excepteur tempor commodo irure. Qui quis dolor Lorem mollit sint excepteur nisi duis cillum officia elit cillum. Amet ipsum aute aliquip laborum cupidatat ut. Nulla do magna esse nostrud nostrud aliqua proident magna occaecat. In tempor sint velit duis ex enim. Culpa cupidatat non do veniam ut culpa non laborum tempor pariatur aliqua veniam occaecat in. Ex laboris sit do non anim fugiat pariatur tempor quis tempor. Mollit ut deserunt incididunt ad sunt ut proident anim minim. Sint est et nostrud elit nulla eu.",
                        style: TextStyles.Body2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom : 16.0),
            child: ButtonSecondary(
              onTap: () => navigatorPush(context, Login()),
              background: AppColors.PRIMARY,
              label: "GOT IT",
              textColor: Colors.white,
              borderColor: AppColors.PRIMARY
            ),
          )
        ],
      ),
    );
  }
}
