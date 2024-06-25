// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names, unused_import

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_project_template/constants/app_constants.dart';
import 'package:flutter_project_template/helpers/api/api_client_http.dart';
import 'package:flutter_project_template/shared-preference-manager/preference-manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatManagementProvider extends ChangeNotifier {
  List<dynamic>? _chatsMessages;
  var _chats;
  var _returned_conv_id;
  List<dynamic>? _my_likes_accounts;

  get getChatsMessages => _chatsMessages;
  get getChats => _chats;
  get getReturnedConvId => _returned_conv_id;
  List<dynamic>? get myLikesAccounts => _my_likes_accounts;

  Future<bool> createChat(var data) async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).postRequest(AppConstants.conversationListViewUrl, data);
      _returned_conv_id = null;
      if (res == null) {
        return false;
      } else {
        var body = res;
        if (body['save'] == true || body['save'] == false) {
          _returned_conv_id = body["conv_id"];
          notifyListeners();
          return true;
        } else {
          return false;
        }
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<void> getAllChats() async {
    try {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      var user = localStorage.getString("user");
      var user_type;
      if (jsonDecode(user!)['role'] == "ADMIN") {
        user_type = "admin";
      } else {
        user_type = "normal";
      }
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).getRequest(
          '${AppConstants.conversationListViewUrl}?user_id=${jsonDecode(user)['id']}&user_type=$user_type');
      if (res == null) {
      } else {
        var body = res;
        _chats = body;
      }
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> getChatMessages(conv_id) async {
    try {
      _chatsMessages = null;
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).getRequest('${AppConstants.messageViewUrl}?conv_id=$conv_id');
      if (res == null) {
      } else {
        var body = res;
        _chatsMessages = body;
        notifyListeners();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> postChatMessage(data, ctx) async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).postRequest(AppConstants.messageViewUrl, data);
      if (res == null) {
      } else {
        var body = res;
        if (body['send']) {
          getAllChats();
        }
      }
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> conversationToSeen(convId) async {
    try {
      var data = {"conversation_id": convId};
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).postRequest(AppConstants.conversationToSeenViewUrl, data);
      if (res == null) {
      } else {
        var body = res;
        if (body['updated']) {
          getAllChats();
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  String utf8convert(String text) {
    List<int> bytes = text.toString().codeUnits;
    return utf8.decode(bytes);
  }

  setMessage(conv_id, ctx) {
    getChatMessages(conv_id);
    notifyListeners();
  }
}
