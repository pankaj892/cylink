import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cylink/screens/loading/brain_pulse_animation.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  String text;

  LoadingScreen(this.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                text,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              TyperAnimatedTextKit(
                speed: Duration(milliseconds: 200),
                pause: Duration(seconds: 2),
                text: ["..."],
                textStyle: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: 40,
              ),
              BrainLoading()
            ],
          ),
        ),
      ),
    );
  }
}
