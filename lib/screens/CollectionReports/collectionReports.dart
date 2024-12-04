import 'package:flutter/material.dart';
import 'package:project_code_blue/Navigation/appBar.dart';
import 'package:project_code_blue/sidemenu/sidemenu.dart';

class CollectionReports extends StatelessWidget {
  const CollectionReports({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(
        navigationType: "bottomNavigation",
      ),
      appBar: MyAppBar(),
      body: const Center(
        child: Text('Collection Reports Page'),
      ),
    );
  }
}
