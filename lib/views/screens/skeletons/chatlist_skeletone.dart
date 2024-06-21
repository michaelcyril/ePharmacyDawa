import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_template/constants/images.dart';

class ChatlistSkeletone extends StatelessWidget {
  const ChatlistSkeletone({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top:20.0, left: 10, right: 20),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 35.0,
                  backgroundImage: AssetImage(Images.noImageProfile),
                ),
                title: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          CardLoading(
                            height: 12,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            margin: EdgeInsets.only(bottom: 10),
                          ),
                          CardLoading(
                            height: 12,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            margin: EdgeInsets.only(bottom: 10),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.only(top:20.0, left: 10, right: 20),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 35.0,
                  backgroundImage: AssetImage(Images.noImageProfile),
                ),
                title: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          CardLoading(
                            height: 12,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            margin: EdgeInsets.only(bottom: 10),
                          ),
                          CardLoading(
                            height: 12,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            margin: EdgeInsets.only(bottom: 10),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.only(top:20.0, left: 10, right: 20),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 35.0,
                  backgroundImage: AssetImage(Images.noImageProfile),
                ),
                title: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          CardLoading(
                            height: 12,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            margin: EdgeInsets.only(bottom: 10),
                          ),
                          CardLoading(
                            height: 12,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            margin: EdgeInsets.only(bottom: 10),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.only(top:20.0, left: 10, right: 20),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 35.0,
                  backgroundImage: AssetImage(Images.noImageProfile),
                ),
                title: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          CardLoading(
                            height: 12,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            margin: EdgeInsets.only(bottom: 10),
                          ),
                          CardLoading(
                            height: 12,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            margin: EdgeInsets.only(bottom: 10),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.only(top:20.0, left: 10, right: 20),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 35.0,
                  backgroundImage: AssetImage(Images.noImageProfile),
                ),
                title: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          CardLoading(
                            height: 12,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            margin: EdgeInsets.only(bottom: 10),
                          ),
                          CardLoading(
                            height: 12,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            margin: EdgeInsets.only(bottom: 10),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
