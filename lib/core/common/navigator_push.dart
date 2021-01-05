import 'package:flutter/material.dart';

navigatorPush(BuildContext context, Widget screen, {bool root = true}) {
  return Navigator.of(context, rootNavigator: root).push(MaterialPageRoute(
    builder: (context) => screen,
    settings: RouteSettings(name: screen.runtimeType.toString()),
  ));
}

popToRootAndPushReplacement(BuildContext context, Widget screen,
    {bool root = true}) {
  Navigator.of(context, rootNavigator: root).popUntil((route) => route.isFirst);
  Navigator.of(context, rootNavigator: root).pushReplacement(MaterialPageRoute(
    builder: (context) => screen,
    settings: RouteSettings(name: screen.toString()),
  ));
}
