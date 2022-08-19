// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:planture_app/pages/plant_profile.dart';
import 'package:planture_app/pages/welcome/splashScreen.dart';
import 'package:planture_app/provider/fav_status.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(  
        create: (context) => Fav(),
      ),
    ], child: MyApp()));

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{'/profile': (context) => Profile()},
      title: 'Planture',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          color: Colors.greenAccent,
        ),
        primarySwatch: Colors.green,
        accentColor: Colors.greenAccent,
      ),
      home: Splash(),
    );
  }
}
