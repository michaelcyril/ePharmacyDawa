// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_project_template/constants/app_constants.dart';
import 'package:flutter_project_template/helpers/api/api_client_dio.dart';
import 'package:flutter_project_template/helpers/api/api_client_http.dart';

class PrescriptionManagementProvider with ChangeNotifier {
  List<Map<String, dynamic>> prescription_list = [];
  List<Map<String, dynamic>> individual_prescription_list = [];

  get getPrescriptionList => prescription_list;
  get getIndividualPrescriptionList => individual_prescription_list;

  Future<bool> getPrescription() async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).getRequest(AppConstants.addDiseaseUrl);
      if (res == null) {
        return false;
      } else {
        var body = res;
        if (body) {
          prescription_list = body;
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

  Future<bool> getIndividualPrescription() async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).getRequest(AppConstants.addDiseaseUrl);
      if (res == null) {
        return false;
      } else {
        var body = res;
        if (body) {
          individual_prescription_list = body;
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

  Future<Map<String, dynamic>> addPrescription(data) async {
    try {
      var res = await ApiClientDio().postRequest(
        AppConstants.addDiseaseUrl,
        data,
      );
      if (res == null) {
        return {'save': false, 'message': 'Something went wrong'};
      } else {
        var body = res;
        if (body['save']) {
          notifyListeners();
          return body;
        } else {
          return {'save': false, 'message': 'Something went wrong'};
        }
      }
    } catch (e) {
      debugPrint(e.toString());
      return {'save': false, 'message': 'Something went wrong'};
    }
  }

  Future<Map<String, dynamic>> deletePrescription(ctx, id) async {
    try {
      var res = await ApiClientHttp(
              headers: <String, String>{'Content-type': 'application/json'})
          .getRequest("${AppConstants.addDiseaseUrl}?id=$id");

      if (res == null) {
        return {'delete': false, 'message': 'Something went wrong'};
      } else {
        Map<String, dynamic> body = res;
        if (body['delete'] == true) {
          notifyListeners();
          return body;
        }
        return {'delete': false, 'message': 'Something went wrong'};
      }
    } catch (e) {
      return {'delete': false, 'message': 'Something went wrong'};
    }
  }

  Future<Map<String, dynamic>> updatePrescription(ctx, data) async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).postRequest(AppConstants.cmpleteProfileUrl, data);
      if (res == null) {
        return {'update': false, 'message': 'Something went wrong'};
      } else {
        var body = res;
        if (body['update']) {
          return body;
        }
        return {'update': false, 'message': 'Something went wrong'};
      }
    } catch (e) {
      debugPrint(e.toString());
      return {'update': false, 'message': 'Something went wrong'};
    }
  }

  Future<Map<String, dynamic>> changePrescriptionStatus(ctx, data) async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).postRequest(AppConstants.cmpleteProfileUrl, data);
      if (res == null) {
        return {'chenge': false, 'message': 'Something went wrong'};
      } else {
        var body = res;
        if (body['chenge']) {
          return body;
        }
        return {'chenge': false, 'message': 'Something went wrong'};
      }
    } catch (e) {
      debugPrint(e.toString());
      return {'chenge': false, 'message': 'Something went wrong'};
    }
  }
}
