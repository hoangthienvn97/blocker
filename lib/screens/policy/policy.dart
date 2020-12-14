import 'package:flutter/material.dart';
import 'package:phone_blocker/core/common/colors.dart';
import 'package:phone_blocker/core/common/commons.dart';
import 'package:phone_blocker/screens/login/login.dart';

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
          child: TextStyleText(
              "Term of Services", 24, FontWeight.w500, 0.18, ConfigColor.TEXT),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: Container(
              margin: new EdgeInsets.only(left: 16 , right: 16 , top: 16),
              child: SingleChildScrollView(
                              child: Column(
                  children: [
                    TextStyleText(
                      "Nisi minim aliqua eiusmod sit laboris officia velit dolore culpa sit. Occaecat proident consequat id ex est nisi ullamco Lorem et ullamco occaecat in veniam do. Excepteur deserunt sint laboris qui. Mollit enim veniam ullamco enim voluptate excepteur quis in eu ullamco tempor eiusmod minim. Ut aliquip labore consequat voluptate sit amet laboris in aliqua do nostrud. Labore cupidatat consequat ipsum proident veniam ad labore. Duis et qui pariatur consectetur amet amet sunt excepteur tempor commodo irure. Qui quis dolor Lorem mollit sint excepteur nisi duis cillum officia elit cillum. Amet ipsum aute aliquip laborum cupidatat ut. Nulla do magna esse nostrud nostrud aliqua proident magna occaecat. In tempor sint velit duis ex enim. Culpa cupidatat non do veniam ut culpa non laborum tempor pariatur aliqua veniam occaecat in. Ex laboris sit do non anim fugiat pariatur tempor quis tempor. Mollit ut deserunt incididunt ad sunt ut proident anim minim. Sint est et nostrud elit nulla eu.",
                      14,
                      FontWeight.normal,
                      0.25,
                      Color(0xff484848),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top : 16.0),
                      child: TextStyleText(
                        "Nisi minim aliqua eiusmod dsasd KSHDajshdkjahDKASHD KAhdk ahskd Haks dhaksj dhajshDK JASHDK HAsk jdhaksJ DHKAsdk jahsDK Jahsdk jahskd jhaskDJ Haksjh kasHDK Asjhdsit laboris officia velit dolore culpa sit. Occaecat proident consequat id ex est nisi ullamco Lorem et ullamco occaecat in veniam do. Excepteur deserunt sint laboris qui. Mollit enim veniam ullamco enim voluptate excepteur quis in eu ullamco tempor eiusmod minim. Ut aliquip labore consequat voluptate sit amet laboris in aliqua do nostrud. Labore cupidatat consequat ipsum proident veniam ad labore. Duis et qui pariatur consectetur amet amet sunt excepteur tempor commodo irure. Qui quis dolor Lorem mollit sint excepteur nisi duis cillum officia elit cillum. Amet ipsum aute aliquip laborum cupidatat ut. Nulla do magna esse nostrud nostrud aliqua proident magna occaecat. In tempor sint velit duis ex enim. Culpa cupidatat non do veniam ut culpa non laborum tempor pariatur aliqua veniam occaecat in. Ex laboris sit do non anim fugiat pariatur tempor quis tempor. Mollit ut deserunt incididunt ad sunt ut proident anim minim. Sint est et nostrud elit nulla eu.",
                        14,
                        FontWeight.normal,
                        0.25,
                        Color(0xff484848),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () => navigatorPush(context,Login()),
              child: Image.asset(Assets.IMAGE_GOTIT),
            ),
          ),
        ],
      ),
    );
  }
}
