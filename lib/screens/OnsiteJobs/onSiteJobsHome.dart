import 'package:flutter/material.dart';
import 'package:project_code_blue/sidemenu/sidemenu.dart';
import '../../Navigation/appBar.dart';

class OnsiteJobsHome extends StatefulWidget {
  const OnsiteJobsHome({super.key});

  @override
  State<OnsiteJobsHome> createState() => _onSiteJobsHomeState();
}

class _onSiteJobsHomeState extends State<OnsiteJobsHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: MyAppBar(),
      body: Center(
        child: Text('Onsite Jobs Home Page'),
      ),
    );
  }
}
