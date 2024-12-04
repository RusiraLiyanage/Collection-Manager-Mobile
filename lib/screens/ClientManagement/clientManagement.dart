import 'package:flutter/material.dart';
import 'package:project_code_blue/Navigation/appBar.dart';
import 'package:project_code_blue/sidemenu/sidemenu.dart';

class ClientManagement extends StatelessWidget {
  const ClientManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(
        navigationType: "bottomNavigation",
      ),
      appBar: MyAppBar(),
      body: const Center(
        child: Text('Client Management Page'),
      ),
    );
  }
}
