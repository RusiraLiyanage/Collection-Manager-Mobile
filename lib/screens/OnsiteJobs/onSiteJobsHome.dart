import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../AppState/appState.dart';
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
    final appState = Provider.of<AppState>(context, listen: false);
    return Scaffold(
        onDrawerChanged: (isOpen) {
          appState.setDrawerState(isOpen); // Update global drawer state
        },
        drawer: SideMenu(
          navigationType: "bottomNavigation",
        ),
        appBar: MyAppBar(),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              color: Color(0xFFD9D9D9),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                        child: Container(
                          color: Color(0xFF56ACB1),
                          width: 168,
                          height: 42,
                          child: Row(
                            children: [
                              Image.asset("assets/images/icons/onSiteJobs.png"),
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 10,
                                ),
                                child: Text(
                                  "On-site Jobs",
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight
                                          .bold // Set the text size in logical pixels
                                      ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: InkWell(
                          onTap: () {
                            print("On tapped");
                          },
                          child: ClipRRect(
                            child: Image.asset(
                                "assets/images/icons/refresh_icon.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 135.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: InkWell(
                            onTap: () {
                              print("On tapped");
                            },
                            child: ClipRRect(
                              child: Image.asset(
                                  "assets/images/icons/newJob_icon.png"),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            print("On tapped");
                          },
                          child: ClipRRect(
                            child: Image.asset(
                                "assets/images/icons/newCallOutJob_icon.png"),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
