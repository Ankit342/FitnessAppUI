import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final title = 'Fitness App UI';
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: HomePage(),
        title: title,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
      );
}
