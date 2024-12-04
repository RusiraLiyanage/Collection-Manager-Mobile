import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../AppState/appState.dart';
import 'package:project_code_blue/sidemenu/sidemenu.dart';
import '../Navigation/appBar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    return Scaffold(
      onDrawerChanged: (isOpen) {
        appState.setDrawerState(isOpen); // Update global drawer state
      },
      drawer: SideMenu(
        navigationType: "bottomNavigation",
      ),
      appBar: const MyAppBar(),
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}
