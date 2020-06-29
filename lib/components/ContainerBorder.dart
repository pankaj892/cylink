import 'package:flutter/material.dart';

class ContainerBorder extends StatelessWidget {
  VoidCallback callback;
  String title;

  ContainerBorder({this.callback, this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        height: 50,
        width: 200,
        decoration:
            BoxDecoration(border: Border.all(color: Colors.indigoAccent)),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
    );
  }
}
