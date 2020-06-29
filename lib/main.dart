import 'package:cylink/models/Sum.dart';
import 'package:cylink/screens/home/dashboard.dart';
import 'package:cylink/components/login_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Sum(0.0)),
      ],
      child: MaterialApp(
        theme: ThemeData(
          backgroundColor: Colors.black,
          primarySwatch: Colors.lightBlue,
          accentColor: Colors.purple,
          textTheme: TextTheme(
            bodyText1: TextStyle(
                fontSize: 20, fontFamily: 'VT323', color: Colors.purple),
            bodyText2:
                TextStyle(fontSize: 22, fontFamily: 'VT323', color: Colors.black),
            headline1: TextStyle(
                fontSize: 44, fontFamily: 'VT323', color: Colors.indigoAccent),
            headline2: TextStyle(
                fontSize: 44,
                fontFamily: 'VT323',
                color: Colors.purple,
            )
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginScreenPage(),
      ),
    );
  }
}
