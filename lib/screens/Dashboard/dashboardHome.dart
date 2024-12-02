import 'package:flutter/material.dart';
import 'package:project_code_blue/sidemenu/sidemenu.dart';
import '../../Navigation/appBar.dart';

class DashboardHome extends StatelessWidget {
  const DashboardHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: MyAppBar(),
      body: const Center(
        child: Text('Dashboard Home Page'),
      ),
    );
  }
}
