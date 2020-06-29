import 'package:cylink/models/Userdata.dart';
import 'package:cylink/screens/loading/loading_screen.dart';
import 'package:cylink/screens/user/user_knowledge_learning.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'knowledge_chart.dart';

class UserKnowledge extends StatefulWidget {
  @override
  _UserKnowledgeState createState() => _UserKnowledgeState();
}

class _UserKnowledgeState extends State<UserKnowledge> {
  UserData user = UserData(
      userName: "Hello X Æ A-12", currentStorage: 3.75, maxStorage: 10.0);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              backgroundColor: Theme.of(context).backgroundColor,
              body: Padding(
                padding: EdgeInsets.all(32),
                child: ListView(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          user.userName,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                           width: 70,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.indigoAccent)),
                            child: Text(
                              "Logout",
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "Device Storage",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                    CircularPercentIndicator(
                      radius: MediaQuery.of(context).size.width / 1.5,
                      lineWidth: 10.0,
                      animation: true,
                      animationDuration: 1000,
                      percent: user.currentStorage / user.maxStorage,
                      backgroundColor: Colors.grey.withAlpha(50),
                      center: new Text(
                          "${user.currentStorage} TB / ${user.maxStorage} TB",
                          style: Theme.of(context).textTheme.bodyText1),
                      progressColor: Colors.indigoAccent,
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "Intelligence",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                    IntelligenceChart(),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "Neurons",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                    UserKnowledgeBoot()
                  ],
                ),
              ),
            );
          }
          if (snapshot.hasError) {
            return Text("");
          } else if (snapshot.hasData) {
            return Text("");
          } else {
            return LoadingScreen("Try to Connect");
          }
        });
  }

  Future<UserData> getUserData() {
    return Future.delayed(Duration(seconds: 2));
  }
}
