import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './AppState/appState.dart';
import 'package:project_code_blue/tabs/tabs_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white, primaryColor: Colors.white),
      home: TabsPage(
        selectedIndex: 0,
        navigationMethod: "app_startup",
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
