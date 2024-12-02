import 'package:flutter/material.dart';
import 'package:project_code_blue/Navigation/appBar.dart';
import 'package:project_code_blue/Navigation/appBarGoBack.dart';
import 'package:project_code_blue/sidemenu/sidemenu.dart';

class OnsiteApprovals extends StatelessWidget {
  const OnsiteApprovals({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarGoBack(),
      body: const Center(
        child: Text('Onsite Approvals Page'),
      ),
    );
  }
}
