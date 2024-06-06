// import 'dart:convert';

// ignore_for_file: prefer_typing_uninitialized_variables, duplicate_import, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_project_template/constants/app_constants.dart';
import 'package:flutter_project_template/helpers/api/api_client_http.dart';
import 'package:flutter_project_template/shared-preference-manager/preference-manager.dart';

class UserManagementProvider with ChangeNotifier {
  var _userData;
  var _userList;

  get getUserData => _userData;
  get getUserList => _userList;

  Future<bool> setUserData() async {
    var sharedPref = SharedPreferencesManager();
    _userData = jsonDecode(await sharedPref.getString(AppConstants.user));
    notifyListeners();
    return true;
  }

  Future<Map<String, dynamic>> verifyPhone(ctx, data) async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).postRequest(AppConstants.verifyPhoneUrl, data);
      if (res == null) {
        return {};
      } else {
        var body = res;
        print(body);
        if (body.containsKey('customer')) {
          // var sharedPref = SharedPreferencesManager();
          // sharedPref.saveString(
          //     AppConstants.customer, json.encode(body['customer']));
          return body;
        }
        return {};
      }
    } catch (e) {
      debugPrint(e.toString());
      return {};
    }
  }

  Future<bool> verifyOtp(ctx, data) async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).postRequest(AppConstants.verifyOtpUrl, data);
      if (res == null) {
        return false;
      } else {
        var body = res;
        print(body.containsKey('success'));
        if (body.containsKey('success')) {
          var sharedPref = SharedPreferencesManager();
          sharedPref.saveString(AppConstants.user, json.encode(body['user']));
          sharedPref.saveString(AppConstants.token, json.encode(body['token']));
          setUserData();
          return true;
        }
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

}
