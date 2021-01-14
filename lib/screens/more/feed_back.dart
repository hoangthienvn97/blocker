import 'package:flutter/material.dart';
import 'package:phone_blocker/core/api/api.dart';
import 'package:phone_blocker/core/common/assets.dart';
import 'package:phone_blocker/core/common/navigator_push.dart';
import 'package:phone_blocker/core/common/toast.dart';
import 'package:phone_blocker/core/models/responses/feedback_response.dart';
import 'package:phone_blocker/resources/app_colors.dart';
import 'package:phone_blocker/resources/localizations.dart';
import 'package:phone_blocker/resources/text_styles.dart';
import 'package:phone_blocker/widgets/button.dart/button.dart';

import '../home.dart';

class FeedBack extends StatefulWidget {
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  FeedbackResponse feedbackResponse;

  bool isEmailValid = false;

  bool isContentValid = false;

  String email = "";

  String content = "";

  @override
  void initState() {
    super.initState();
    _feedback();
  }

  _isAllValid() {
    return isEmailValid && isContentValid;
  }

  _feedback() {
    Api().postFeedBack(email, content,
        onSuccess: (feedbackResponse) => {
              Utils.showToast(context,
                  "Thanks a lot for feedback! We will be in touch shortly"),
              Navigator.pop(context)
            },
        onError: (errorResponse) => {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: Transform.translate(
            offset: Offset(-5, 0),
            child: IconButton(
                icon: Image.asset(Assets.ICON_DISCARD,
                    color: AppColors.PLACE_HOLDER),
                onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          backgroundColor: Colors.white,
                          title: Align(
                              alignment: Alignment.center,
                              child: Text(
                                Localized.get.reportDialogTitle,
                                style: TextStyles.Subtitle1,
                              )),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                Localized.get.reportDialogStay,
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 15),
                              ),
                            ),
                            FlatButton(
                              onPressed: () {
                                popToRootAndPushReplacement(context, Home());
                              },
                              child: Text(
                                Localized.get.reportDialogLeave,
                                style:
                                    TextStyle(color: Colors.red, fontSize: 15),
                              ),
                            ),
                          ]);
                    })),
          ),
          titleSpacing: -10,
          centerTitle: false,
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
                    Localized.get.feedbackTitle,
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
                    flex: 11,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            Localized.get.feedbackText,
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
                                        new TextSpan(
                                            text:
                                                '(${Localized.get.feedbackRequied})'),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 17.0),
                                  child: TextField(
                                    onChanged: (text) => {
                                      this.setState(() {
                                        email = text;
                                        isEmailValid = text.isNotEmpty;
                                      })
                                    },
                                    autocorrect: true,
                                    decoration: InputDecoration(
                                      hintText:
                                          Localized.get.feedbackEnterEmail,
                                      hintStyle: TextStyle(color: Colors.grey),
                                      filled: true,
                                      fillColor: Colors.white70,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.0)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.0)),
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
                                            text:
                                                '${Localized.get.feedbackTitle} ',
                                            style: new TextStyle(
                                                fontWeight: FontWeight.w500),
                                          ),
                                          new TextSpan(
                                              text:
                                                  '(${Localized.get.feedbackRequied})'),
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
                              maxLines: 10,
                              autocorrect: true,
                              onChanged: (text) => {
                                this.setState(() {
                                  content = text;
                                  isContentValid = content.isNotEmpty;
                                })
                              },
                              decoration: InputDecoration(
                                hintText: Localized.get.feedbackEnterFeedback,
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
                  ),
                  ButtonSecondary(
                    onTap: () => _isAllValid() ? _feedback() : null,
                    background: _isAllValid()
                        ? AppColors.PRIMARY
                        : AppColors.LIGHT_BLUE,
                    label: "send feedback",
                    textColor: Colors.white,
                    borderColor: _isAllValid()
                        ? AppColors.PRIMARY
                        : AppColors.LIGHT_BLUE,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
