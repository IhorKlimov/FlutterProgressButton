import 'package:flutter/material.dart';
import 'package:progress_button/navigation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp() {
    Navigation.initPaths();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Progress Button',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: Navigation.router.generator,
    );
  }
}
