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

  Future<bool> verifyPhone(ctx, data) async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).postRequest(AppConstants.verifyPhoneUrl, data);
      if (res == null) {
        return false;
      } else {
        var body = res;
        print(body);
        if (body['request']) {
          return true;
        }
        return false;
      }
    } catch (e) {
      print("----------");
      debugPrint(e.toString());
      return false;
    }
  }

  Future<Map<String, dynamic>> verifyOtp(ctx, data) async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).postRequest(AppConstants.verifyOtpUrl, data);
      if (res == null) {
        return {'success': false, 'message': 'Something went wrong'};
      } else {
        var body = res;
        print("---------------");
        print(body);
        if (body['success']) {
          var sharedPref = SharedPreferencesManager();
          await sharedPref.saveString(AppConstants.user, json.encode(body['user']));
          await sharedPref.saveString(AppConstants.token, json.encode(body['token']));
          setUserData();
          return body;
        }
        return {'success': false, 'message': 'Something went wrong'};
      }
    } catch (e) {
      debugPrint(e.toString());
      return {'success': false, 'message': 'Something went wrong'};
    }
  }

  Future<Map<String, dynamic>> completeProfifile(ctx, data) async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).postRequest(AppConstants.cmpleteProfileUrl, data);
      if (res == null) {
        return {'update': false, 'message': 'Something went wrong'};
      } else {
        var body = res;
        print("-------------");
        print(body);
        if (body['update']) {
          var sharedPref = SharedPreferencesManager();
          sharedPref.saveString(AppConstants.user, json.encode(body['user']));
          sharedPref.saveString(AppConstants.token, json.encode(body['token']));
          setUserData();
          return body;
        }
        return {'update': false, 'message': 'Something went wrong'};
      }
    } catch (e) {
      debugPrint(e.toString());
      return {'update': false, 'message': 'Something went wrong'};
    }
  }

  Future<Map<String, dynamic>> registerUser(ctx, data) async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).postRequest(AppConstants.registerUserUrl, data);
      if (res == null) {
        return {'save': false, 'message': 'Something went wrong'};
      } else {
        var body = res;
        if (body['save']) {
          return body;
        }
        return {'save': false, 'message': 'Something went wrong'};
      }
    } catch (e) {
      debugPrint(e.toString());
      return {'save': false, 'message': 'Something went wrong'};
    }
  }

  Future<bool> getUsersList() async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).getRequest(AppConstants.cmpleteProfileUrl);
      if (res == null) {
        return false;
      } else {
        var body = res;
        if (body) {
          _userList = body;
          notifyListeners();
          return true;
        }
      }
      return false;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

}
