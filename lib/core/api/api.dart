import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:phone_blocker/core/common/preferences_keys.dart';
import 'package:phone_blocker/core/common/preferences_util.dart';
import 'package:phone_blocker/core/models/responses/auth_response.dart';
import 'package:phone_blocker/core/models/responses/collection_response.dart';
import 'package:phone_blocker/core/models/responses/collections_response.dart';
import 'package:phone_blocker/core/models/responses/error_response.dart';
import 'package:phone_blocker/core/models/responses/number_response.dart';

class Api {
  var client = http.Client();
  void close() => client.close();
  openClient() => client = http.Client();

  static const String BaseApiUrl = "https://5f54120e1704.ngrok.io/api/v1";

  static final Api _instacne = Api._internal();
  Api._internal() {
    client = http.Client();
  }

  factory Api() => _instacne;
  Map<String, String> headers = {"Content-Type": "application/json"};

  Future<void> login(String googleIdToken,
      {Function(AuthResponse) onSuccess,
      Function(ErrorResponse) onError}) async {
    Map<String, dynamic> body = {"tokenId": googleIdToken};
    var url = "$BaseApiUrl/auth/login/google";
    var response =
        await client.post(url, headers: headers, body: jsonEncode(body));
    var json = jsonDecode(response.body);
    if (response.statusCode == 201) {
      onSuccess.call(AuthResponse.fromJson(json));
    } else {
      onError.call(ErrorResponse.fromJson(json));
    }
  }

  Future<void> getCollections(
      {Function(CollectionsResponse) onSuccess,
      Function(ErrorResponse) onError}) async {
    var url = "$BaseApiUrl/client/collections";
    headers["authorization"] =
        "Bearer ${await readString(PreferencesKeys.AccessToken)}";
    var response = await client.get(url, headers: headers);
    var json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      onSuccess.call(CollectionsResponse.fromJson(json));
    } else {
      onError.call(ErrorResponse.fromJson(json));
    }
  }

  Future<void> postFavorite(int id,
      {Function(CollectionResponse) onSuccess,
      Function(ErrorResponse) onError}) async {
    var url = "$BaseApiUrl/client/collections/${id}/favorite";
    headers["authorization"] =
        "Bearer ${await readString(PreferencesKeys.AccessToken)}";
    var response = await client.post(url, headers: headers);
    var json = jsonDecode(response.body);
    if (response.statusCode == 201) {
      onSuccess.call(CollectionResponse.fromJson(json));
    } else {
      onError.call(ErrorResponse.fromJson(json));
    }
  }

  Future<void> deleteFavorite(int id,
      {Function(CollectionResponse) onSuccess,
      Function(ErrorResponse) onError}) async {
    var url = "$BaseApiUrl/client/collections/${id}/favorite";
    headers["authorization"] =
        "Bearer ${await readString(PreferencesKeys.AccessToken)}";
    var response = await client.delete(url, headers: headers);
    var json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      if (onSuccess != null) {
        onSuccess.call(CollectionResponse.fromJson(json));
      }
    } else {
      onError.call(ErrorResponse.fromJson(json));
    }
  }

  Future<void> postCollected(int id,
      {Function(CollectionResponse) onSuccess,
      Function(ErrorResponse) onError}) async {
    var url = "$BaseApiUrl/client/collections/${id}/collected";
    headers["authorization"] =
        "Bearer ${await readString(PreferencesKeys.AccessToken)}";
    var response = await client.post(url, headers: headers);
    var json = jsonDecode(response.body);
    if (response.statusCode == 201) {
      if (onSuccess != null) {
        onSuccess.call(CollectionResponse.fromJson(json));
      }
    } else {
      onError.call(ErrorResponse.fromJson(json));
    }
  }

  Future<void> getPhoneNumber(String phone,
      {Function(NumberResponse) onSuccess,
      Function(ErrorResponse) onError}) async {
    var url = "$BaseApiUrl/spam-numbers/phone/$phone";
    headers["authorization"] =
        "Bearer ${await readString(PreferencesKeys.AccessToken)}";
    var response = await client.get(url, headers: headers);
    var json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      onSuccess.call(NumberResponse.fromJson(json));
    } else {
      onError.call(ErrorResponse.fromJson(json));
    }
  }

  Future<void> postReport(String phone, String description, int collectionId,
      {Function(NumberResponse) onSuccess,
      Function(ErrorResponse) onError}) async {
    Map<String, dynamic> body = {
      "phone": phone,
      "description": description,
      "collectionId": collectionId
    };
    var url = "$BaseApiUrl/spam-numbers/report";
    headers["authorization"] =
        "Bearer ${await readString(PreferencesKeys.AccessToken)}";
    var response =
        await client.post(url, headers: headers, body: jsonEncode(body));
    var json = jsonDecode(response.body);
    if (response.statusCode == 201) {
      onSuccess.call(NumberResponse.fromJson(json));
    } else {
      onError.call(ErrorResponse.fromJson(json));
    }
  }
}
