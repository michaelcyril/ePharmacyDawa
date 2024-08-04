// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_project_template/constants/app_constants.dart';
import 'package:flutter_project_template/helpers/api/api_client_dio.dart';
import 'package:flutter_project_template/helpers/api/api_client_http.dart';

class PrescriptionManagementProvider with ChangeNotifier {
  // Client Prescription Management
  var client_pending_prescription = [];
  var clint_prescription_history = [];
  var client_canceled_prescription = [];

  get getClientPendiPrescriptionList => client_pending_prescription;
  get getClientPrescriptionHistoryList => clint_prescription_history;
  get getClientCanceledPrescriptionList => client_canceled_prescription;

  // Pharmacy Prescription Management
  var pharmacist_pending_prescription = [];
  var pharmacist_prescription_history = [];
  var pharmacist_canceled_prescription = [];

  get getPharmacistPendiPrescriptionList => pharmacist_pending_prescription;
  get getPharmacistPrescriptionHistoryList => pharmacist_prescription_history;
  get getPharmacistCanceledPrescriptionList => pharmacist_canceled_prescription;

  Future<bool> clientPendingPrescriptions(clientId) async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).getRequest(
          '${AppConstants.insertGetPrescriptionUrl}?query_type=client_prescription&client_id=$clientId&prescription_status=PENDING');
      if (res == null) {
        return false;
      } else {
        var body = res;
        client_pending_prescription = body;
        notifyListeners();
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<bool> clientPrescriptionsHistory(clientId) async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).getRequest(
          '${AppConstants.insertGetPrescriptionUrl}?query_type=client_prescription&client_id=$clientId&prescription_status=COMPLETE');
      if (res == null) {
        return false;
      } else {
        var body = res;
        clint_prescription_history = body;
        notifyListeners();
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<bool> clientCanceledPrescriptions(clientId) async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).getRequest(
          '${AppConstants.insertGetPrescriptionUrl}?query_type=client_prescription&client_id=$clientId&prescription_status=CANCELED');
      if (res == null) {
        return false;
      } else {
        var body = res;
        client_canceled_prescription = body;
        notifyListeners();
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<bool> pharmacistPendingPrescriptions() async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).getRequest(
          '${AppConstants.insertGetPrescriptionUrl}?query_type=pharmacist_prescription&prescription_status=PENDING');
      if (res == null) {
        return false;
      } else {
        var body = res;
        pharmacist_pending_prescription = body;
        notifyListeners();
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<bool> pharmacistPrescriptionsHistory() async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).getRequest(
          '${AppConstants.insertGetPrescriptionUrl}?query_type=pharmacist_prescription&prescription_status=COMPLETE');
      if (res == null) {
        return false;
      } else {
        var body = res;
        pharmacist_prescription_history = body;
        notifyListeners();
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<bool> pharmacistCanceledPrescriptions() async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).getRequest(
          '${AppConstants.insertGetPrescriptionUrl}?query_type=pharmacist_prescription&prescription_status=CANCELED');
      if (res == null) {
        return false;
      } else {
        var body = res;
        pharmacist_canceled_prescription = body;
        notifyListeners();
        return true;
      }
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
          pharmacistPendingPrescriptions();
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

  Future<bool> acceptPrescription(orderId) async {
    try {
      var data = {
        'id': orderId,
        'status_to': 'COMPLETE',
      };
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).postRequest(AppConstants.changePrescriptionStatusUrl, data);
      if (res == null) {
        return false;
      } else {
        var body = res;
        if (body['change']) {
          pharmacistPendingPrescriptions();
          pharmacistPrescriptionsHistory();
          return true;
        }
      }
      return false;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<bool> cancelPrescription(orderId) async {
    try {
      var data = {
        'id': orderId,
        'status_to': 'CANCELED',
      };
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).postRequest(AppConstants.changePrescriptionStatusUrl, data);
      if (res == null) {
        return false;
      } else {
        var body = res;
        if (body['change']) {
          return true;
        }
      }
      return false;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<bool> proceedPrescription(orderId) async {
    try {
      var data = {
        'id': orderId,
        'status_to': 'PROCEED',
      };
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).postRequest(AppConstants.changePrescriptionStatusUrl, data);
      if (res == null) {
        return false;
      } else {
        var body = res;
        if (body['change']) {
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
