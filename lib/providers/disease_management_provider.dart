// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_project_template/constants/app_constants.dart';
import 'package:flutter_project_template/helpers/api/api_client_http.dart';

class DiseaseManagementProvider with ChangeNotifier {
  var disease_list = [];

  get getDiseaseList => disease_list;

  Future<bool> getDiseases() async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).getRequest(AppConstants.insertGetDiseaseUrl);
      if (res == null) {
        return false;
      } else {
        var body = res;
        disease_list = body;
        notifyListeners();
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<Map<String, dynamic>> addDisease(data) async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).postRequest(AppConstants.insertGetDiseaseUrl, data);
      if (res == null) {
        return {"save": false, "message": "Something went wrong"};
      } else {
        var body = res;
        if (body['save']) {
          getDiseases();
          return body;
        }
        return {"save": false, "message": "Something went wrong"};
      }
    } catch (e) {
      debugPrint(e.toString());
      return {"save": false, "message": "Something went wrong"};
    }
  }

  Future<Map<String, dynamic>> updateDisease(ctx, data) async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).postRequest(AppConstants.deleteUpdateDiseaseUrl, data);
      if (res == null) {
        return {"update": false, "message": "Something went wrong"};
      } else {
        var body = res;
        if (body('update')) {
          return body;
        }
        return {"update": false, "message": "Something went wrong"};
      }
    } catch (e) {
      debugPrint(e.toString());
      return {"update": false, "message": "Something went wrong"};
    }
  }

  Future<bool> deleteDiseases() async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).getRequest(AppConstants.deleteUpdateDiseaseUrl);
      if (res == null) {
        return false;
      } else {
        var body = res;
        if (body['delete']) {
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
