// ignore_for_file: prefer_const_constructors, dead_code, prefer_typing_uninitialized_variables, sized_box_for_whitespace, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_project_template/constants/app_constants.dart';
import 'package:flutter_project_template/providers/chat_management_provider.dart';
import 'package:flutter_project_template/shared-preference-manager/preference-manager.dart';
import 'package:flutter_project_template/views/screens/chat/single_chat_screen.dart';
import 'package:flutter_project_template/views/screens/skeletons/chatlist_skeletone.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class RecentChats extends StatefulWidget {
  const RecentChats({super.key});

  @override
  State<RecentChats> createState() => _RecentChatsState();
}

class _RecentChatsState extends State<RecentChats> {
  var user;
  var account;
  @override
  void initState() {
    super.initState();
    getUserData();
    Provider.of<ChatManagementProvider>(context, listen: false).getAllChats();

    // Provider.of<UserManagementProvider>(context, listen: false)
    //     .allUsersAccounts;
    // getUnseenChatCount();
  }

  String formatDjangoDateTime(String djangoDateTime) {
    DateTime parsedDateTime = DateTime.parse(djangoDateTime);
    String formattedDate = DateFormat.yMMMd().format(parsedDateTime);
    return formattedDate;
  }

  // int getUnseenChatCount() {
  //   final provider =
  //       Provider.of<ChatManagementProvider>(context, listen: false);
  //   if (provider.getChats == null) {
  //     return 0; // Handle case when chats haven't been loaded yet
  //   }
  //   var total =
  //       provider.getChats.where((chat) => chat['is_seen'] == false).length;
  //   print("UNSEEN CHATS :: ${total}");
  //   return total;
  // }

  getUserData() async {
    var new_user = jsonDecode(
        await SharedPreferencesManager().getString(AppConstants.user));
    setState(() {
      user = new_user;
    });
  }

  String formatChatTime(DateTime timestamp) {
    DateTime now = DateTime.now();
    Duration difference = now.difference(timestamp);
    if (difference.inSeconds < 60) {
      return 'Just now';
    }
    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    }
    if (timestamp.day == now.day &&
        timestamp.month == now.month &&
        timestamp.year == now.year) {
      return DateFormat('HH:mm').format(timestamp);
    }
    if (timestamp.day == now.day - 1 &&
        timestamp.month == now.month &&
        timestamp.year == now.year) {
      return 'Yesterday';
    }
    return DateFormat('dd/MM/yyyy').format(timestamp);
  }

  @override
  Widget build(BuildContext context) {
    // double heightT = MediaQuery.of(context).size.height;
    // double widthT = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Chat List",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
              splashRadius: 22,
              onPressed: () async {
                var data = {'initiator': user['id']};
                Provider.of<ChatManagementProvider>(context, listen: false)
                    .createChat(data);
              },
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              )),
        ],
        centerTitle: true,
        elevation: 5,
        toolbarHeight: 60,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.indigo.withOpacity(0.3),
                Colors.white.withOpacity(0.3),
                Colors.indigo.withOpacity(0.3),
              ],
            ),
          ),
        ),
      ),
      body: Consumer<ChatManagementProvider>(
        builder: (context, recordProvider, child) {
          return recordProvider.getChats == null ||
                  recordProvider.getChats!.isEmpty ||
                  user == null
              ? const ChatlistSkeletone()
              : ListView.builder(
                  itemCount: recordProvider.getChats.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        // if (user['role'] == "NORMAL" &&
                        //     recordProvider.getChats[index]
                        //             ['last_message_user'] !=
                        //         user['id']) {
                        //   recordProvider.conversationToSeen(
                        //       recordProvider.getChats[index]['id']);
                        // }
                        if (user['role'] == "ADMIN") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ChatScreen(
                                name: recordProvider.getChats[index]
                                    ['initiator']['username'],
                                userId: "ADMIN",
                                conv_id: recordProvider.getChats[index]['id'],
                              ),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ChatScreen(
                                name: "ADMIN",
                                userId: "ADMIN",
                                conv_id: recordProvider.getChats[index]['id'],
                              ),
                            ),
                          );
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 10.0,
                        ),
                        decoration: BoxDecoration(
                            // color: recordProvider.getChats[index]['is_seen'] ==
                            //             false &&
                            //         user['id'] !=
                            //             recordProvider.getChats[index]
                            //                 ['last_message_user']
                            //     ? const Color(0xFFFFEFEE)
                            //     : Colors.white,
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
                            )),
                        child: ListTile(
                          leading: user['role'] == "ADMIN"
                              ? CircleAvatar(
                                  child: Text(
                                    "A",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24),
                                  ),
                                )
                              : CircleAvatar(
                                  child: Text(
                                      "A",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24))),
                          title: user['role'] == "ADMIN"
                              ? Text(
                                  recordProvider.getChats[index]['initiator']
                                      ['username'],
                                  style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                )
                              : Text(
                                  "ADMIN",
                                  style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                          trailing: Column(
                            children: [
                              Text(
                                formatDjangoDateTime(recordProvider
                                    .getChats[index]['start_time']),
                                style: const TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 8.0,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              // recordProvider.getChats[index]['is_seen'] ==
                              //             false &&
                              //         user['id'] !=
                              //             recordProvider.getChats[index]
                              //                 ['last_message_user']
                              //     ? Container(
                              //         width: 40.0,
                              //         height: 20.0,
                              //         decoration: BoxDecoration(
                              //           color: Theme.of(context).primaryColor,
                              //           borderRadius:
                              //               BorderRadius.circular(30.0),
                              //         ),
                              //         alignment: Alignment.center,
                              //         child: const Text(
                              //           'NEW',
                              //           style: TextStyle(
                              //             color: Colors.white,
                              //             fontWeight: FontWeight.bold,
                              //             fontSize: 12.0,
                              //           ),
                              //         ),
                              //       )
                              //     : Container(
                              //         width: 40,
                              //         height: 20,
                              //       )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
