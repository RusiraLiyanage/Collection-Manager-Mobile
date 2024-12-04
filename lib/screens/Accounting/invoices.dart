import 'package:flutter/material.dart';
import 'package:project_code_blue/Navigation/appBar.dart';
import 'package:project_code_blue/Navigation/appBarGoBack.dart';
import 'package:project_code_blue/sidemenu/sidemenu.dart';

class Invoices extends StatelessWidget {
  const Invoices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(
        navigationType: "subPartNavigation",
      ),
      appBar: AppBarGoBack(),
      body: const Center(
        child: Text('Invoices Page'),
      ),
    );
  }
}
