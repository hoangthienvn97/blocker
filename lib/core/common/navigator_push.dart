import 'package:flutter/material.dart';

navigatorPush(BuildContext context, Widget screen, {bool root = true}) {
  return Navigator.of(context, rootNavigator: root).push(MaterialPageRoute(
    builder: (context) => screen,
    settings: RouteSettings(name: screen.runtimeType.toString()),
  ));
}