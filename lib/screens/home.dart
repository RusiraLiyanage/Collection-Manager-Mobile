import 'package:flutter/material.dart';
import 'package:project_code_blue/sidemenu/sidemenu.dart';
import '../Navigation/appBar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isDrawerOpen = false; // Track drawer state
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      onDrawerChanged: (isOpen) {
        setState(() {
          _isDrawerOpen = isOpen; // Update drawer state
          print(isOpen);
        });
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
