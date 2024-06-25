// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_project_template/constants/app_constants.dart';
import 'package:flutter_project_template/helpers/api/api_client_http.dart';

class OrderManagementProvider with ChangeNotifier {
  // Client Order Management
  List<Map<String, dynamic>> client_pending_order = [];
  List<Map<String, dynamic>> clint_order_history = [];
  List<Map<String, dynamic>> client_canceled_order = [];

  List<Map<String, dynamic>> get getClientPendiOrderList => client_pending_order;
  List<Map<String, dynamic>> get getClientOrderHistoryList => clint_order_history;
  List<Map<String, dynamic>> get getClientCanceledOrderList => client_canceled_order;

  // Pharmacy Order Management
  List<Map<String, dynamic>> pharmacist_pending_order = [];
  List<Map<String, dynamic>> pharmacist_order_history = [];
  List<Map<String, dynamic>> pharmacist_canceled_order = [];

  List<Map<String, dynamic>> get getPharmacistPendiOrderList => pharmacist_pending_order;
  List<Map<String, dynamic>> get getPharmacistOrderHistoryList => pharmacist_order_history;
  List<Map<String, dynamic>> get getPharmacistCanceledOrderList => pharmacist_canceled_order;



  Future<bool> clientPendingOrders(clientId) async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).getRequest('${AppConstants.insertGetOrderUrl}?query_type=client_order&client_id=$clientId&order_status=PENDING');
      if (res == null) {
        return false;
      } else {
        var body = res;
        if (body) {
          client_pending_order = body;
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

  Future<bool> clientOrdersHistory(clientId) async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).getRequest('${AppConstants.insertGetOrderUrl}?query_type=client_order&client_id=$clientId&order_status=COMPLETE');
      if (res == null) {
        return false;
      } else {
        var body = res;
        if (body) {
          clint_order_history = body;
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

  Future<bool> clientCanceledOrders(clientId) async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).getRequest('${AppConstants.insertGetOrderUrl}?query_type=client_order&client_id=$clientId&order_status=CANCELED');
      if (res == null) {
        return false;
      } else {
        var body = res;
        if (body) {
          client_canceled_order = body;
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

  Future<bool> pharmacistPendingOrders() async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).getRequest('${AppConstants.insertGetOrderUrl}?query_type=pharmacist_order&order_status=PENDING');
      if (res == null) {
        return false;
      } else {
        var body = res;
        if (body) {
          pharmacist_pending_order = body;
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

  Future<bool> pharmacistOrdersHistory() async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).getRequest('${AppConstants.insertGetOrderUrl}?query_type=pharmacist_order&order_status=COMPLETE');
      if (res == null) {
        return false;
      } else {
        var body = res;
        if (body) {
          pharmacist_order_history = body;
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

  Future<bool> pharmacistCanceledOrders() async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).getRequest('${AppConstants.insertGetOrderUrl}?query_type=pharmacist_order&order_status=CANCELED');
      if (res == null) {
        return false;
      } else {
        var body = res;
        if (body) {
          pharmacist_canceled_order = body;
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

  Future<Map<String, dynamic>> addOrder(data) async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).postRequest(AppConstants.insertGetOrderUrl, data);
      if (res == null) {
        return {"save": false, "message": "Something went wrong"};
      } else {
        var body = res;
        if (body['save']) {
          return body;
        }
        return {"save": false, "message": "Something went wrong"};
      }
    } catch (e) {
      debugPrint(e.toString());
      return {"save": false, "message": "Something went wrong"};
    }
  }

  Future<Map<String, dynamic>> updateOrder(ctx, data) async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).postRequest(AppConstants.deleteUpdateOrderUrl, data);
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

  Future<bool> deleteOrder() async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).getRequest(AppConstants.deleteUpdateOrderUrl);
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
