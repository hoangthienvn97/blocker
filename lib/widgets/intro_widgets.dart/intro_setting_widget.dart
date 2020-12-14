import 'package:flutter/material.dart';

class IntroSetting extends StatelessWidget {
  final String ordinal_number;
  final String text;
  final String text_2;
  IntroSetting(this.ordinal_number, this.text, this.text_2);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(ordinal_number, style: TextStyle(fontSize: 16 , fontStyle: FontStyle.normal),),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: RichText(
            text: new TextSpan(
              style: new TextStyle(
                fontSize: 16.0,
                fontFamily: "RobotoMono",
                fontStyle: FontStyle.normal,
                letterSpacing: 0.1,
                color: Colors.black,
              ),
              children: <TextSpan>[
                new TextSpan(text: text),
                new TextSpan(
                  text: text_2,
                  style: new TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
