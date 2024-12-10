import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../AppState/appState.dart';
import 'package:project_code_blue/sidemenu/sidemenu.dart';
import '../Navigation/appBar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        extendBodyBehindAppBar: true,
        onDrawerChanged: (isOpen) {
          appState.setDrawerState(isOpen); // Update global drawer state
        },
        drawer: SideMenu(
          navigationType: "bottomNavigation",
        ),
        appBar: const MyAppBar(),
        body: Container(
          width: double.infinity,
          margin: EdgeInsets.only(
            top: 0,
          ), // use the topPadd here
          child: Column(
            children: [
              Container(
                color: Color(0xFF2C7796),
                width: double.infinity,
                height: 165,
                child: Padding(
                  padding: const EdgeInsets.only(top: 68, bottom: 10),
                  child: Image.asset(
                    'assets/images/collectionManagerLogo.png', // Path to your local image
                    fit: BoxFit
                        .contain, // Adjusts how the image fits inside the container
                  ),
                ),
              ),
              Expanded(
                child: Stack(clipBehavior: Clip.none, children: [
                  Positioned(
                    child: Image.asset(
                      'assets/images/backgrounds/home-page-background.jpg',
                      width: double.infinity,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 140,
                    left: 0,
                    right: 0,
                    child: Card(
                      surfaceTintColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      margin: EdgeInsets.zero,
                      elevation: 0,
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height - 345,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    "Welcome Back",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        fontFamily: ''),
                                  ),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 15.0,
                                    right: 100.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 60,
                                        ),
                                        child: Image.asset(
                                          'assets/images/welcomeBackIcons/welcomeBack_dashboard.png', // Path to your local image
                                          // Adjusts how the image fits inside the container
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Dashboard",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              fontFamily: '',
                                              color: Color(0xFF1A576F),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 5.0,
                                  ),
                                  child: Divider(
                                    height: 17,
                                    color: Color(0xFF1A576F).withOpacity(0.3),
                                    indent: 50,
                                    endIndent: 40,
                                  ),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 2.0,
                                    right: 100.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 60,
                                        ),
                                        child: Image.asset(
                                          'assets/images/welcomeBackIcons/welcomeBack_dashboard.png', // Path to your local image
                                          // Adjusts how the image fits inside the container
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "On-site Jobs",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              fontFamily: '',
                                              color: Color(0xFF1A576F),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 5.0,
                                  ),
                                  child: Divider(
                                    height: 17,
                                    color: Color(0xFF1A576F).withOpacity(0.3),
                                    indent: 50,
                                    endIndent: 40,
                                  ),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 2.0,
                                    right: 100.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 60,
                                        ),
                                        child: Image.asset(
                                          'assets/images/welcomeBackIcons/welcomeBack_dashboard.png', // Path to your local image
                                          // Adjusts how the image fits inside the container
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "On-Site Approvals",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              fontFamily: '',
                                              color: Color(0xFF1A576F),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 5.0,
                                  ),
                                  child: Divider(
                                    height: 17,
                                    color: Color(0xFF1A576F).withOpacity(0.3),
                                    indent: 50,
                                    endIndent: 40,
                                  ),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 2.0,
                                    right: 100.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 60,
                                        ),
                                        child: Image.asset(
                                          'assets/images/welcomeBackIcons/welcomeBack_dashboard.png', // Path to your local image
                                          // Adjusts how the image fits inside the container
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Client Management",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              fontFamily: '',
                                              color: Color(0xFF1A576F),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 5.0,
                                  ),
                                  child: Divider(
                                    height: 17,
                                    color: Color(0xFF1A576F).withOpacity(0.3),
                                    indent: 50,
                                    endIndent: 40,
                                  ),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 2.0,
                                    right: 100.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 60,
                                        ),
                                        child: Image.asset(
                                          'assets/images/welcomeBackIcons/welcomeBack_dashboard.png', // Path to your local image
                                          // Adjusts how the image fits inside the container
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Accounting",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              fontFamily: '',
                                              color: Color(0xFF1A576F),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 5.0,
                                  ),
                                  child: Divider(
                                    height: 17,
                                    color: Color(0xFF1A576F).withOpacity(0.3),
                                    indent: 50,
                                    endIndent: 40,
                                  ),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 2.0,
                                    right: 100.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 60,
                                        ),
                                        child: Image.asset(
                                          'assets/images/welcomeBackIcons/welcomeBack_dashboard.png', // Path to your local image
                                          // Adjusts how the image fits inside the container
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Collection Reports",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              fontFamily: '',
                                              color: Color(0xFF1A576F),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 5.0,
                                  ),
                                  child: Divider(
                                    height: 17,
                                    color: Color(0xFF1A576F).withOpacity(0.3),
                                    indent: 50,
                                    endIndent: 40,
                                  ),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 2.0,
                                    right: 100.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 60,
                                        ),
                                        child: Image.asset(
                                          'assets/images/welcomeBackIcons/welcomeBack_dashboard.png', // Path to your local image
                                          // Adjusts how the image fits inside the container
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Collector’s Calendar",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              fontFamily: '',
                                              color: Color(0xFF1A576F),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 5.0,
                                  ),
                                  child: Divider(
                                    height: 17,
                                    color: Color(0xFF1A576F).withOpacity(0.3),
                                    indent: 50,
                                    endIndent: 40,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 6,
                                  ),
                                  child: Image.asset(
                                    'assets/images/icons/Powered by 2.png', // Path to your local image
                                    fit: BoxFit
                                        .contain, // Adjusts how the image fits inside the container
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  // Stacked card
                ]),
              ),
            ],
          ),
        ));
  }
}
