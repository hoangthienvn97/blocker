import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:phone_blocker/resources/app_colors.dart';

import 'assets.dart';

class Utils {
  static showToast(BuildContext context, String message) {
    FToast fToast = FToast();
    fToast.init(context);
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: AppColors.TOAST,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(Assets.ICON_TICK_BLACK, color: AppColors.PLACE_HOLDER),
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
