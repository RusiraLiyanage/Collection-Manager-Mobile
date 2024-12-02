import 'package:flutter/material.dart';
import 'package:project_code_blue/tabs/tabs_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white, primaryColor: Colors.white),
      home: TabsPage(selectedIndex: 0),
      debugShowCheckedModeBanner: false,
    );
  }
}
