import 'package:shared_preferences/shared_preferences.dart';

Future<bool> saveString({String key, String value}) async {
  SharedPreferences _shareP = await SharedPreferences.getInstance();
  return await _shareP.setString(key, value);
}

Future<String> readString(String key) async {
  SharedPreferences _shareP = await SharedPreferences.getInstance();
  return _shareP.getString(key);
}

Future<void> removeKey(String key) async {
  SharedPreferences _shareP = await SharedPreferences.getInstance();
  return _shareP.remove(key);
}
