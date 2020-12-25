import 'package:flutter/material.dart';
import 'package:phone_blocker/resources/app_colors.dart';
import 'package:phone_blocker/resources/text_styles.dart';

class FeedBack extends StatefulWidget {
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
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
              "back",
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
                  "Feedback",
                  style: TextStyles.Headline2.apply(color: AppColors.PRIMARY),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  flex: 9,
                  child: Column(
                    children: [
                      Text(
                        "By collecting your feedback, we can keep improving our app.",
                        style: TextStyles.Body2,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 17.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: RichText(
                                text: new TextSpan(
                                  style: new TextStyle(
                                    fontSize: 14.0,
                                    fontFamily: "RobotoMono",
                                    fontStyle: FontStyle.normal,
                                    letterSpacing: 0.1,
                                    color: Colors.black,
                                  ),
                                  children: <TextSpan>[
                                    new TextSpan(
                                      text: 'Email ',
                                      style: new TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    new TextSpan(text: '(required)'),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 17.0),
                              child: TextField(
                                autocorrect: true,
                                decoration: InputDecoration(
                                  hintText: 'Enter Your Email ',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.white70,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 17.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: RichText(
                                  text: new TextSpan(
                                    style: new TextStyle(
                                      fontSize: 14.0,
                                      fontFamily: "RobotoMono",
                                      fontStyle: FontStyle.normal,
                                      letterSpacing: 0.1,
                                      color: Colors.black,
                                    ),
                                    children: <TextSpan>[
                                      new TextSpan(
                                        text: 'Feedback ',
                                        style: new TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                      new TextSpan(text: '(required)'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 17.0),
                        child: TextField(
                          maxLines: 13,
                          autocorrect: true,
                          decoration: InputDecoration(
                            hintText: 'Type to add feedback',
                            hintStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white70,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.PRIMARY,
                                style: BorderStyle.solid,
                                width: 1.0,
                              ),
                              color: AppColors.PRIMARY,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Center(
                                  child: Text(
                                    "Send Feedback".toUpperCase(),
                                    style: TextStyles.Button.apply(color: Colors.white)
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
