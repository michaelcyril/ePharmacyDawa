// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_project_template/constants/app_constants.dart';
import 'package:flutter_project_template/helpers/api/api_client_dio.dart';
import 'package:flutter_project_template/helpers/api/api_client_http.dart';

class PrescriptionManagementProvider with ChangeNotifier {
  // Client Prescription Management
  List<Map<String, dynamic>> client_pending_prescription = [];
  List<Map<String, dynamic>> clint_prescription_history = [];
  List<Map<String, dynamic>> client_canceled_prescription = [];

  List<Map<String, dynamic>> get getClientPendiPrescriptionList => client_pending_prescription;
  List<Map<String, dynamic>> get getClientPrescriptionHistoryList => clint_prescription_history;
  List<Map<String, dynamic>> get getClientCanceledPrescriptionList => client_canceled_prescription;

  // Pharmacy Prescription Management
  List<Map<String, dynamic>> pharmacist_pending_prescription = [];
  List<Map<String, dynamic>> pharmacist_prescription_history = [];
  List<Map<String, dynamic>> pharmacist_canceled_prescription = [];

  List<Map<String, dynamic>> get getPharmacistPendiPrescriptionList => pharmacist_pending_prescription;
  List<Map<String, dynamic>> get getPharmacistPrescriptionHistoryList => pharmacist_prescription_history;
  List<Map<String, dynamic>> get getPharmacistCanceledPrescriptionList => pharmacist_canceled_prescription;



  Future<bool> clientPendingPrescriptions(clientId) async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).getRequest('${AppConstants.insertGetPrescriptionUrl}?query_type=pharmacist_prescription&client_id=$clientId&prescription_status=PENDING');
      if (res == null) {
        return false;
      } else {
        var body = res;
        if (body) {
          client_pending_prescription = body;
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

  Future<bool> clientPrescriptionsHistory(clientId) async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).getRequest('${AppConstants.insertGetPrescriptionUrl}?query_type=pharmacist_prescription&client_id=$clientId&prescription_status=COMPLETE');
      if (res == null) {
        return false;
      } else {
        var body = res;
        if (body) {
          clint_prescription_history = body;
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

  Future<bool> clientCanceledPrescriptions(clientId) async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).getRequest('${AppConstants.insertGetPrescriptionUrl}?query_type=pharmacist_prescription&client_id=$clientId&prescription_status=CANCELED');
      if (res == null) {
        return false;
      } else {
        var body = res;
        if (body) {
          client_canceled_prescription = body;
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

  Future<bool> pharmacistPendingPrescriptions() async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).getRequest('${AppConstants.insertGetPrescriptionUrl}?query_type=pharmacist_prescription&prescription_status=PENDING');
      if (res == null) {
        return false;
      } else {
        var body = res;
        if (body) {
          pharmacist_pending_prescription = body;
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

  Future<bool> pharmacistPrescriptionsHistory() async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).getRequest('${AppConstants.insertGetPrescriptionUrl}?query_type=pharmacist_prescription&prescription_status=COMPLETE');
      if (res == null) {
        return false;
      } else {
        var body = res;
        if (body) {
          pharmacist_prescription_history = body;
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

  Future<bool> pharmacistCanceledPrescriptions() async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).getRequest('${AppConstants.insertGetPrescriptionUrl}?query_type=pharmacist_prescription&prescription_status=CANCELED');
      if (res == null) {
        return false;
      } else {
        var body = res;
        if (body) {
          pharmacist_canceled_prescription = body;
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
        AppConstants.insertGetPrescriptionUrl,
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
          .getRequest("${AppConstants.deleteUpdatePrescriptionUrl}?id=$id");

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
      }).postRequest(AppConstants.deleteUpdatePrescriptionUrl, data);
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
      }).postRequest(AppConstants.changePrescriptionStatusUrl, data);
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
