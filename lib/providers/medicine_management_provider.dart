// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_project_template/constants/app_constants.dart';
import 'package:flutter_project_template/helpers/api/api_client_dio.dart';
import 'package:flutter_project_template/helpers/api/api_client_http.dart';

class MedicineManagementProvider with ChangeNotifier {
  var medicine_list = [];
  var otc_medicine_list = [];
  var all_prescription_medicine = [];
  var disease_medicine = [];

  get getMedicineList => medicine_list;
  get getOtcMedicineList => otc_medicine_list;
  get getAllPrescriptionMedicineList => all_prescription_medicine;
  get getDiseaseMedicineList => disease_medicine;

  Future<bool> getMedicines() async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).getRequest('${AppConstants.insertGetMedicineUrl}?query_type=all');
      if (res == null) {
        return false;
      } else {
        var body = res;
        medicine_list = body;
        notifyListeners();
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<bool> getOtcMedicines() async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).getRequest('${AppConstants.insertGetMedicineUrl}?query_type=otc');
      if (res == null) {
        return false;
      } else {
        var body = res;
        print(body);
        otc_medicine_list = body;
        notifyListeners();
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<bool> getPrescriptionMedicines(deseaseId) async {
    try {
      disease_medicine = [];
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).getRequest(
          "${AppConstants.insertGetMedicineUrl}?query_type=disease&disease_id=$deseaseId");
      if (res == null) {
        return false;
      } else {
        var body = res;
        disease_medicine = body;
        notifyListeners();
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<bool> getAllPrescriptionMedicines() async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).getRequest(
          '${AppConstants.insertGetMedicineUrl}?query_type=all_disease');
      if (res == null) {
        return false;
      } else {
        var body = res;
        all_prescription_medicine = body;
        notifyListeners();
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<Map<String, dynamic>> addMedicine(data) async {
    try {
      var res = await ApiClientDio().postRequest(
        AppConstants.insertGetMedicineUrl,
        data,
      );
      if (res == null) {
        return {"save": false, "message": "Something went wrong"};
      } else {
        var body = res;
        if (body['save']) {
          getOtcMedicines();
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
      }).postRequest(AppConstants.deleteUpdateMedicineUrl, data);
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
      }).getRequest(AppConstants.deleteUpdateMedicineUrl);
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
