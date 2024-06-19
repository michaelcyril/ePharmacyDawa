// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_project_template/constants/app_constants.dart';
import 'package:flutter_project_template/helpers/api/api_client_http.dart';

class MedicineManagementProvider with ChangeNotifier {
  List<Map<String, dynamic>> medicine_list = [];
  List<Map<String, dynamic>> otc_medicine_list = [];
  List<Map<String, dynamic>> all_prescription_medicine = [];
  List<Map<String, dynamic>> disease_medicine = [];

  List<Map<String, dynamic>> get getMedicineList => medicine_list;
  List<Map<String, dynamic>> get getOtcMedicineList => otc_medicine_list;
  List<Map<String, dynamic>> get getAllPrescriptionMedicineList => all_prescription_medicine;
  List<Map<String, dynamic>> get getDiseaseMedicineList => disease_medicine;

  Future<bool> getMedicines() async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).getRequest(AppConstants.addDiseaseUrl);
      if (res == null) {
        return false;
      } else {
        var body = res;
        if (body) {
          medicine_list = body;
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

  Future<bool> getOtcMedicines() async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).getRequest(AppConstants.addDiseaseUrl);
      if (res == null) {
        return false;
      } else {
        var body = res;
        if (body) {
          otc_medicine_list = body;
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

  Future<bool> getPrescriptionMedicines(deseaseId) async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).getRequest("${AppConstants.addDiseaseUrl}?id=$deseaseId");
      if (res == null) {
        return false;
      } else {
        var body = res;
        if (body) {
          disease_medicine = body;
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

  Future<bool> getAllPrescriptionMedicines() async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).getRequest(AppConstants.addDiseaseUrl);
      if (res == null) {
        return false;
      } else {
        var body = res;
        if (body) {
          medicine_list = body;
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

  Future<Map<String, dynamic>> addMedicine(data) async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).postRequest(AppConstants.addDiseaseUrl, data);
      if (res == null) {
        return {"save": false, "message": "Something went wrong"};
      } else {
        var body = res;
        if (body('save')) {
          return body;
        }
        return {"save": false, "message": "Something went wrong"};
      }
    } catch (e) {
      debugPrint(e.toString());
      return {"save": false, "message": "Something went wrong"};
    }
  }

  Future<Map<String, dynamic>> updateMedicine(ctx, data) async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).postRequest(AppConstants.addDiseaseUrl, data);
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

  Future<bool> deleteMedicine() async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).getRequest(AppConstants.addDiseaseUrl);
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
