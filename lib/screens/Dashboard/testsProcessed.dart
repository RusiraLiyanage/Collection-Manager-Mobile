import 'package:flutter/material.dart';
import 'package:project_code_blue/Navigation/appBar.dart';
import 'package:project_code_blue/sidemenu/sidemenu.dart';

class TestsProcessed extends StatelessWidget {
  const TestsProcessed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: MyAppBar(),
      body: const Center(
        child: Text('Tests Processed Page'),
      ),
    );
  }
}
