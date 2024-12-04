import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../AppState/appState.dart';
import 'package:project_code_blue/screens/Accounting/invoices.dart';
import 'package:project_code_blue/screens/Accounting/itServices.dart';
import 'package:project_code_blue/screens/Accounting/licensing.dart';
import 'package:project_code_blue/screens/Accounting/tests.dart';
import 'package:project_code_blue/screens/CollectorsCalendar/collectorsCalendar.dart';
import 'package:project_code_blue/screens/Dashboard/testSampleResults.dart';
import 'package:project_code_blue/screens/Dashboard/testsProcessed.dart';
import 'package:project_code_blue/screens/FAQ/faq.dart';
import 'package:project_code_blue/screens/OnsiteApprovals/onsiteApprovals.dart';
import 'package:project_code_blue/screens/OnsiteJobs/onSiteJobsHome.dart';
import '../tabs/tabs_page.dart';

class SideMenu extends StatefulWidget {
  String navigationType = "";
  SideMenu({required this.navigationType});

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    return Drawer(
      backgroundColor: Color(0xFFE6F7FA),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero, // Removes rounded corners
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero, // Adjust vertical padding
              children: [
                SizedBox(
                  height:
                      widget.navigationType == "bottomNavigation" ? 125 : 165,
                  child: DrawerHeader(
                    child: Image(
                      image:
                          AssetImage('assets/images/collectionManagerLogo.png'),
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF2C7796),
                    ),
                  ),
                ),
                Column(
                  children: [
                    ListTile(
                      dense:
                          true, // Makes ListTile more compact - less values represents less space
                      visualDensity: VisualDensity(vertical: -4),
                      leading: ImageIcon(
                        AssetImage(
                            'assets/images/icons/home.png'), // Path to your image asset
                        color: Color(0xFF1A576F), // Optional: Adjust icon color
                        size: 32, // Optional: Adjust icon size
                      ),
                      title: Align(
                        alignment: Alignment(-1.1, 0),
                        child: const Text(
                          'Home',
                          style: TextStyle(
                              color: Color(0xFF1A576F),
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      onTap: () => {
                        appState.setDrawerState(false),
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TabsPage(
                                  selectedIndex: 0,
                                  navigationMethod: "sidebar")),
                        )
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 25,
                        right: 25,
                      ),
                      child: const Divider(
                        color: Color.fromRGBO(26, 87, 111, 0.3), // RGBA color
                        thickness: 1.0,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor: Colors.transparent,
                      ),
                      child: ExpansionTile(
                          dense: true, // Makes ListTile more compact
                          visualDensity: VisualDensity(vertical: -4),
                          iconColor: Color(0xFF1A576F),
                          leading: ImageIcon(
                            AssetImage(
                                'assets/images/icons/dashboard.png'), // Path to your image asset
                            color: Color(
                                0xFF1A576F), // Optional: Adjust icon color
                            size: 32, // Optional: Adjust icon size
                          ),
                          title: Align(
                            alignment: Alignment(-1.1, 0),
                            child: const Text(
                              'Dashboard',
                              style: TextStyle(
                                  color: Color(0xFF1A576F),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                          children: <Widget>[
                            ListTile(
                              contentPadding: EdgeInsets.only(left: 20),
                              dense: true, // Makes ListTile more compact
                              visualDensity: VisualDensity(vertical: -4),
                              leading: ImageIcon(
                                AssetImage(
                                    'assets/images/icons/sectionIcon.png'), // Path to your image asset
                                color: Color(
                                    0xFF1A576F), // Optional: Adjust icon color
                                size: 32, // Optional: Adjust icon size
                              ),
                              title: Align(
                                alignment: Alignment(-1.1, 0),
                                child: const Text(
                                  'Dashboard Home',
                                  style: TextStyle(
                                      color: Color(0xFF1A576F),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                              onTap: () => {
                                appState.setDrawerState(false),
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TabsPage(
                                          selectedIndex: 1,
                                          navigationMethod: "sidebar")),
                                ),
                              },
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.only(left: 20),
                              dense: true, // Makes ListTile more compact
                              visualDensity: VisualDensity(vertical: -4),
                              leading: ImageIcon(
                                AssetImage(
                                    'assets/images/icons/sectionIcon.png'), // Path to your image asset
                                color: Color(
                                    0xFF1A576F), // Optional: Adjust icon color
                                size: 32, // Optional: Adjust icon size
                              ),
                              title: Align(
                                alignment: Alignment(-1.1, 0),
                                child: const Text(
                                  'Tests Processed',
                                  style: TextStyle(
                                      color: Color(0xFF1A576F),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                              onTap: () => {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const TestsProcessed()),
                                )
                              },
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.only(left: 20),
                              dense: true, // Makes ListTile more compact
                              visualDensity: VisualDensity(vertical: -4),
                              leading: ImageIcon(
                                AssetImage(
                                    'assets/images/icons/sectionIcon.png'), // Path to your image asset
                                color: Color(
                                    0xFF1A576F), // Optional: Adjust icon color
                                size: 32, // Optional: Adjust icon size
                              ),
                              title: Align(
                                alignment: Alignment(-1.1, 0),
                                child: const Text(
                                  'Test Sample Results',
                                  style: TextStyle(
                                      color: Color(0xFF1A576F),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                              onTap: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const TestSampleResults()),
                                )
                              },
                            ),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 25,
                        right: 25,
                      ),
                      child: const Divider(
                        color: Color.fromRGBO(26, 87, 111, 0.3), // RGBA color
                        thickness: 1.0,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ListTile(
                      dense: true, // Makes ListTile more compact
                      visualDensity: VisualDensity(vertical: -4),
                      leading: ImageIcon(
                        AssetImage(
                            'assets/images/icons/onSiteJobs.png'), // Path to your image asset
                        color: Color(0xFF1A576F), // Optional: Adjust icon color
                        size: 32, // Optional: Adjust icon size
                      ),
                      title: Align(
                        alignment: Alignment(-1.1, 0),
                        child: const Text(
                          'On-Site Jobs',
                          style: TextStyle(
                              color: Color(0xFF1A576F),
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      onTap: () => {
                        appState.setDrawerState(false),
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TabsPage(
                                  selectedIndex: 1,
                                  navigationMethod:
                                      "special_case")), // In here, inside tabs_page it is conditionally monitored
                        ),
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 25,
                        right: 25,
                      ),
                      child: const Divider(
                        color: Color.fromRGBO(26, 87, 111, 0.3), // RGBA color
                        thickness: 1.0,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ListTile(
                      dense: true, // Makes ListTile more compact
                      visualDensity: VisualDensity(vertical: -4),
                      leading: ImageIcon(
                        AssetImage(
                            'assets/images/icons/onSiteApprovals.png'), // Path to your image asset
                        color: Color(0xFF1A576F), // Optional: Adjust icon color
                        size: 32, // Optional: Adjust icon size
                      ),
                      title: Align(
                        alignment: Alignment(-1.1, 0),
                        child: const Text(
                          'On-Site Approvals',
                          style: TextStyle(
                              color: Color(0xFF1A576F),
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      onTap: () => {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OnsiteApprovals()),
                        )
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 25,
                        right: 25,
                      ),
                      child: const Divider(
                        color: Color.fromRGBO(26, 87, 111, 0.3), // RGBA color
                        thickness: 1.0,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ListTile(
                      dense: true, // Makes ListTile more compact
                      visualDensity: VisualDensity(vertical: -4),
                      leading: ImageIcon(
                        AssetImage(
                            'assets/images/icons/clientManagement.png'), // Path to your image asset
                        color: Color(0xFF1A576F), // Optional: Adjust icon color
                        size: 32, // Optional: Adjust icon size
                      ),
                      title: Align(
                        alignment: Alignment(-1.1, 0),
                        child: const Text(
                          'Client Management',
                          style: TextStyle(
                              color: Color(0xFF1A576F),
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      onTap: () => {
                        appState.setDrawerState(false),
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TabsPage(
                                  selectedIndex: 2,
                                  navigationMethod: "sidebar")),
                        ),
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 25,
                        right: 25,
                      ),
                      child: const Divider(
                        color: Color.fromRGBO(26, 87, 111, 0.3), // RGBA color
                        thickness: 1.0,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor: Colors.transparent,
                      ),
                      child: ExpansionTile(
                        dense: true, // Makes ListTile more compact
                        visualDensity: VisualDensity(vertical: -4),
                        iconColor: Color(0xFF1A576F),
                        leading: ImageIcon(
                          AssetImage(
                              'assets/images/icons/accounting.png'), // Path to your image asset
                          color:
                              Color(0xFF1A576F), // Optional: Adjust icon color
                          size: 32, // Optional: Adjust icon size
                        ),
                        title: Align(
                          alignment: Alignment(-1.1, 0),
                          child: const Text(
                            'Accounting',
                            style: TextStyle(
                                color: Color(0xFF1A576F),
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                        children: <Widget>[
                          ListTile(
                            contentPadding: EdgeInsets.only(left: 20),
                            dense: true, // Makes ListTile more compact
                            visualDensity: VisualDensity(vertical: -4),
                            leading: ImageIcon(
                              AssetImage(
                                  'assets/images/icons/sectionIcon.png'), // Path to your image asset
                              color: Color(
                                  0xFF1A576F), // Optional: Adjust icon color
                              size: 32, // Optional: Adjust icon size
                            ),
                            title: Align(
                              alignment: Alignment(-1.1, 0),
                              child: const Text(
                                'Accounting Dashboard',
                                style: TextStyle(
                                    color: Color(0xFF1A576F),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                            onTap: () => {
                              appState.setDrawerState(false),
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TabsPage(
                                        selectedIndex: 4,
                                        navigationMethod: "sidebar")),
                              ),
                            },
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.only(left: 20),
                            dense: true, // Makes ListTile more compact
                            visualDensity: VisualDensity(vertical: -4),
                            leading: ImageIcon(
                              AssetImage(
                                  'assets/images/icons/sectionIcon.png'), // Path to your image asset
                              color: Color(
                                  0xFF1A576F), // Optional: Adjust icon color
                              size: 32, // Optional: Adjust icon size
                            ),
                            title: Align(
                              alignment: Alignment(-1.1, 0),
                              child: const Text(
                                ' Tests',
                                style: TextStyle(
                                    color: Color(0xFF1A576F),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                            onTap: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Tests()),
                              )
                            },
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.only(left: 20),
                            dense: true, // Makes ListTile more compact
                            visualDensity: VisualDensity(vertical: -4),
                            leading: ImageIcon(
                              AssetImage(
                                  'assets/images/icons/sectionIcon.png'), // Path to your image asset
                              color: Color(
                                  0xFF1A576F), // Optional: Adjust icon color
                              size: 32, // Optional: Adjust icon size
                            ),
                            title: Align(
                              alignment: Alignment(-1.1, 0),
                              child: const Text(
                                ' Licensing',
                                style: TextStyle(
                                    color: Color(0xFF1A576F),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                            onTap: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Licensing()),
                              )
                            },
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.only(left: 20),
                            dense: true, // Makes ListTile more compact
                            visualDensity: VisualDensity(vertical: -4),
                            leading: ImageIcon(
                              AssetImage(
                                  'assets/images/icons/sectionIcon.png'), // Path to your image asset
                              color: Color(
                                  0xFF1A576F), // Optional: Adjust icon color
                              size: 32, // Optional: Adjust icon size
                            ),
                            title: Align(
                              alignment: Alignment(-1.1, 0),
                              child: const Text(
                                ' IT Services',
                                style: TextStyle(
                                    color: Color(0xFF1A576F),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                            onTap: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ITServices()),
                              )
                            },
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.only(left: 20),
                            dense: true, // Makes ListTile more compact
                            visualDensity: VisualDensity(vertical: -4),
                            leading: ImageIcon(
                              AssetImage(
                                  'assets/images/icons/sectionIcon.png'), // Path to your image asset
                              color: Color(
                                  0xFF1A576F), // Optional: Adjust icon color
                              size: 32, // Optional: Adjust icon size
                            ),
                            title: Align(
                              alignment: Alignment(-1.1, 0),
                              child: const Text(
                                ' Invoices',
                                style: TextStyle(
                                    color: Color(0xFF1A576F),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                            onTap: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Invoices()),
                              )
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 25,
                        right: 25,
                      ),
                      child: const Divider(
                        color: Color.fromRGBO(26, 87, 111, 0.3), // RGBA color
                        thickness: 1.0,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ListTile(
                      dense: true, // Makes ListTile more compact
                      visualDensity: VisualDensity(vertical: -4),
                      leading: ImageIcon(
                        AssetImage(
                            'assets/images/icons/collectionReports.png'), // Path to your image asset
                        color: Color(0xFF1A576F), // Optional: Adjust icon color
                        size: 32, // Optional: Adjust icon size
                      ),
                      title: Align(
                        alignment: Alignment(-1.1, 0),
                        child: const Text(
                          'Collection Reports',
                          style: TextStyle(
                              color: Color(0xFF1A576F),
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      onTap: () => {
                        appState.setDrawerState(false),
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TabsPage(
                                  selectedIndex: 3,
                                  navigationMethod: "sidebar")),
                        ),
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 25,
                        right: 25,
                      ),
                      child: const Divider(
                        color: Color.fromRGBO(26, 87, 111, 0.3), // RGBA color
                        thickness: 1.0,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ListTile(
                      dense: true, // Makes ListTile more compact
                      visualDensity: VisualDensity(vertical: -4),
                      leading: ImageIcon(
                        AssetImage(
                            'assets/images/icons/calendar.png'), // Path to your image asset
                        color: Color(0xFF1A576F), // Optional: Adjust icon color
                        size: 32, // Optional: Adjust icon size
                      ),
                      title: Align(
                        alignment: Alignment(-1.1, 0),
                        child: const Text(
                          'Collector\'s Calendar',
                          style: TextStyle(
                              color: Color(0xFF1A576F),
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CollectorsCalendar()),
                        )
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 25,
                        right: 25,
                      ),
                      child: const Divider(
                        color: Color.fromRGBO(26, 87, 111, 0.3), // RGBA color
                        thickness: 1.0,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ListTile(
                      dense: true, // Makes ListTile more compact
                      visualDensity: VisualDensity(vertical: -4),
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: ImageIcon(
                          AssetImage(
                            'assets/images/icons/faq.png',
                          ),
                          // Path to your image asset
                          color:
                              Color(0xFF1A576F), // Optional: Adjust icon color
                          size: 22, // Optional: Adjust icon size
                        ),
                      ),
                      title: Align(
                        alignment: Alignment(-1.1, 0),
                        child: const Text(
                          '   FAQ',
                          style: TextStyle(
                              color: Color(0xFF1A576F),
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FAQ()),
                        )
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 25,
                        right: 25,
                      ),
                      child: const Divider(
                        color: Color.fromRGBO(26, 87, 111, 0.3), // RGBA color
                        thickness: 1.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            width: 150, // Set height for the image
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/powered-by.png',
                ), // Replace with your image
              ),
            ),
          ),
        ],
      ),
    );
  }
}
