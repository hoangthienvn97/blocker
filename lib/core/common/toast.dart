import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'assets.dart';

class Utils {
  static showToast(BuildContext context, String message) {
    FToast fToast = FToast();
    fToast.init(context);
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Color(0xffFFECD6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(Assets.ICON_TICK_BLACK, color: Color(0xff828282)),
          SizedBox(
            width: 14.0,
          ),
          Text(message),
        ],
      ),
    );
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 1),
    );
  }
}
