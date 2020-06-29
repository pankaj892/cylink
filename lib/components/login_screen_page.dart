import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cylink/screens/login/chip_id_login.dart';
import 'package:flutter/material.dart';

class LoginScreenPage extends StatefulWidget {
  @override
  _LoginScreenPageState createState() => _LoginScreenPageState();
}

class _LoginScreenPageState extends State<LoginScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            child: TyperAnimatedTextKit(
              speed: Duration(milliseconds: 100),
              pause: Duration(seconds: 5),
              onTap: () {
                print("Tap Event");
              },
              text: ["Welcome to Cyberlink"],
              textStyle: Theme.of(context).textTheme.headline1,
            ),
          ),
          ChipIdLogin(),
          SizedBox(
            height: 0,
          )
        ],
      ),
    );
  }
}
