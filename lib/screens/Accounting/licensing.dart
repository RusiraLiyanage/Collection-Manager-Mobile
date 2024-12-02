import 'package:flutter/material.dart';
import 'package:project_code_blue/Navigation/appBar.dart';
import 'package:project_code_blue/sidemenu/sidemenu.dart';

class Licensing extends StatelessWidget {
  const Licensing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: MyAppBar(),
      body: const Center(
        child: Text('Licensing Page'),
      ),
    );
  }
}
