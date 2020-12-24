import 'package:flutter/material.dart';
import 'package:phone_blocker/core/common/navigator_push.dart';
import 'package:phone_blocker/core/common/preferences_keys.dart';
import 'package:phone_blocker/core/common/preferences_util.dart';
import 'package:phone_blocker/screens/home.dart';
import 'package:phone_blocker/screens/intro/intro.dart';
import 'package:phone_blocker/screens/login/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }

  void _navigate() async {
    var isLogged = await readString(PreferencesKeys.AccessToken) != null;
    navigatorPush(context, isLogged ? Home() : IntroBlock());
  }
}
