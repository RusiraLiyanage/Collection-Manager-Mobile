import 'package:flutter/material.dart';
import 'package:project_code_blue/screens/OnsiteApprovals/onsiteApprovals.dart';
import 'package:project_code_blue/screens/OnsiteJobs/onSiteJobsHome.dart';
import '../tabs/tabs_page.dart';

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
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
                  height: 125,
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
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TabsPage(selectedIndex: 0)),
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
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TabsPage(selectedIndex: 1)),
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
                                          TabsPage(selectedIndex: 2)),
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
                                  'Test Sample Results',
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
                                          TabsPage(selectedIndex: 3)),
                                ),
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
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TabsPage(selectedIndex: 2)),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OnsiteApprovals()),
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
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TabsPage(selectedIndex: 3)),
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
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TabsPage(selectedIndex: 5)),
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
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TabsPage(selectedIndex: 6)),
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
                                ' Licensing',
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
                                        TabsPage(selectedIndex: 7)),
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
                                ' IT Services',
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
                                        TabsPage(selectedIndex: 8)),
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
                                ' Invoices',
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
                                        TabsPage(selectedIndex: 9)),
                              ),
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
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TabsPage(selectedIndex: 4)),
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
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  TabsPage(selectedIndex: 11)),
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
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  TabsPage(selectedIndex: 12)),
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
