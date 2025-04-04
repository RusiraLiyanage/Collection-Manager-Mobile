import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_code_blue/screens/Dashboard/testCollectionSummary.dart';
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
import '../tabs/tabs_page.dart';

class SideMenu extends StatefulWidget {
  String navigationType = "";
  SideMenu({required this.navigationType});

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  bool home = false;
  bool dashboard = false;
  bool dashboardHome = false;
  bool testsProcessed = false;
  bool testSampleResults = false;
  bool onSiteJobs = false;
  bool onSiteApprovals = false;
  bool clientManagement = false;
  bool accounting = false;
  bool accountingDashboard = false;
  bool tests = false;
  bool licensing = false;
  bool itServices = false;
  bool invoices = false;
  bool collectionReports = false;
  bool collectorsCalendar = false;
  bool faq = false;

  void _updateSideBarColor({required String labelType}) {
    if (labelType == "home") {
      setState(() {
        home = true;
        dashboard = false;
        dashboardHome = false;
        testsProcessed = false;
        testSampleResults = false;
        onSiteJobs = false;
        onSiteApprovals = false;
        clientManagement = false;
        accounting = false;
        accountingDashboard = false;
        tests = false;
        licensing = false;
        itServices = false;
        invoices = false;
        collectionReports = false;
        collectorsCalendar = false;
        faq = false;
      });
    } else if (labelType == "dashboardHome") {
      setState(() {
        home = false;
        dashboard = true;
        dashboardHome = true;
        testsProcessed = false;
        testSampleResults = false;
        onSiteJobs = false;
        onSiteApprovals = false;
        clientManagement = false;
        accounting = false;
        accountingDashboard = false;
        tests = false;
        licensing = false;
        itServices = false;
        invoices = false;
        collectionReports = false;
        collectorsCalendar = false;
        faq = false;
      });
    } else if (labelType == "testsProcessed") {
      setState(() {
        home = false;
        dashboard = false;
        dashboardHome = false;
        testsProcessed = true;
        testSampleResults = false;
        onSiteJobs = false;
        onSiteApprovals = false;
        clientManagement = false;
        accounting = false;
        accountingDashboard = false;
        tests = false;
        licensing = false;
        itServices = false;
        invoices = false;
        collectionReports = false;
        collectorsCalendar = false;
        faq = false;
      });
    } else if (labelType == "testSampleResults") {
      setState(() {
        home = false;
        dashboard = false;
        dashboardHome = false;
        testsProcessed = false;
        testSampleResults = true;
        onSiteJobs = false;
        onSiteApprovals = false;
        clientManagement = false;
        accounting = false;
        accountingDashboard = false;
        tests = false;
        licensing = false;
        itServices = false;
        invoices = false;
        collectionReports = false;
        collectorsCalendar = false;
        faq = false;
      });
    } else if (labelType == "onSiteJobs") {
      setState(() {
        home = false;
        dashboard = false;
        dashboardHome = false;
        testsProcessed = false;
        testSampleResults = false;
        onSiteJobs = true;
        onSiteApprovals = false;
        clientManagement = false;
        accounting = false;
        accountingDashboard = false;
        tests = false;
        licensing = false;
        itServices = false;
        invoices = false;
        collectionReports = false;
        collectorsCalendar = false;
        faq = false;
      });
    } else if (labelType == "onSiteApprovals") {
      setState(() {
        home = false;
        dashboard = false;
        dashboardHome = false;
        testsProcessed = false;
        testSampleResults = false;
        onSiteJobs = false;
        onSiteApprovals = true;
        clientManagement = false;
        accounting = false;
        accountingDashboard = false;
        tests = false;
        licensing = false;
        itServices = false;
        invoices = false;
        collectionReports = false;
        collectorsCalendar = false;
        faq = false;
      });
    } else if (labelType == "clientManagement") {
      setState(() {
        home = false;
        dashboard = false;
        dashboardHome = false;
        testsProcessed = false;
        testSampleResults = false;
        onSiteJobs = false;
        onSiteApprovals = false;
        clientManagement = true;
        accounting = false;
        accountingDashboard = false;
        tests = false;
        licensing = false;
        itServices = false;
        invoices = false;
        collectionReports = false;
        collectorsCalendar = false;
        faq = false;
      });
    } else if (labelType == "accountingDashboard") {
      setState(() {
        home = false;
        dashboard = false;
        dashboardHome = false;
        testsProcessed = false;
        testSampleResults = false;
        onSiteJobs = false;
        onSiteApprovals = false;
        clientManagement = false;
        accounting = true;
        accountingDashboard = true;
        tests = false;
        licensing = false;
        itServices = false;
        invoices = false;
        collectionReports = false;
        collectorsCalendar = false;
        faq = false;
      });
    } else if (labelType == "tests") {
      setState(() {
        home = false;
        dashboard = false;
        dashboardHome = false;
        testsProcessed = false;
        testSampleResults = false;
        onSiteJobs = false;
        onSiteApprovals = false;
        clientManagement = false;
        accounting = true;
        accountingDashboard = false;
        tests = true;
        licensing = false;
        itServices = false;
        invoices = false;
        collectionReports = false;
        collectorsCalendar = false;
        faq = false;
      });
    } else if (labelType == "licensing") {
      setState(() {
        home = false;
        dashboard = false;
        dashboardHome = false;
        testsProcessed = false;
        testSampleResults = false;
        onSiteJobs = false;
        onSiteApprovals = false;
        clientManagement = false;
        accounting = true;
        accountingDashboard = false;
        tests = false;
        licensing = true;
        itServices = false;
        invoices = false;
        collectionReports = false;
        collectorsCalendar = false;
        faq = false;
      });
    } else if (labelType == "itServices") {
      setState(() {
        home = false;
        dashboard = false;
        dashboardHome = false;
        testsProcessed = false;
        testSampleResults = false;
        onSiteJobs = false;
        onSiteApprovals = false;
        clientManagement = false;
        accounting = true;
        accountingDashboard = false;
        tests = false;
        licensing = false;
        itServices = true;
        invoices = false;
        collectionReports = false;
        collectorsCalendar = false;
        faq = false;
      });
    } else if (labelType == "invoices") {
      setState(() {
        home = false;
        dashboard = false;
        dashboardHome = false;
        testsProcessed = false;
        testSampleResults = false;
        onSiteJobs = false;
        onSiteApprovals = false;
        clientManagement = false;
        accounting = true;
        accountingDashboard = false;
        tests = false;
        licensing = false;
        itServices = false;
        invoices = true;
        collectionReports = false;
        collectorsCalendar = false;
        faq = false;
      });
    } else if (labelType == "collectionReports") {
      setState(() {
        home = false;
        dashboard = true;
        dashboardHome = false;
        testsProcessed = false;
        testSampleResults = false;
        onSiteJobs = false;
        onSiteApprovals = false;
        clientManagement = false;
        accounting = false;
        accountingDashboard = false;
        tests = false;
        licensing = false;
        itServices = false;
        invoices = false;
        collectionReports = true;
        collectorsCalendar = false;
        faq = false;
      });
    } else if (labelType == "collectorsCalendar") {
      setState(() {
        home = false;
        dashboard = false;
        dashboardHome = false;
        testsProcessed = false;
        testSampleResults = false;
        onSiteJobs = false;
        onSiteApprovals = false;
        clientManagement = false;
        accounting = false;
        accountingDashboard = false;
        tests = false;
        licensing = false;
        itServices = false;
        invoices = false;
        collectionReports = false;
        collectorsCalendar = true;
        faq = false;
      });
    } else if (labelType == "faq") {
      setState(() {
        home = false;
        dashboard = false;
        dashboardHome = false;
        testsProcessed = false;
        testSampleResults = false;
        onSiteJobs = false;
        onSiteApprovals = false;
        clientManagement = false;
        accounting = false;
        accountingDashboard = false;
        tests = false;
        licensing = false;
        itServices = false;
        invoices = false;
        collectionReports = false;
        collectorsCalendar = false;
        faq = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent, // Adjust transparency
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), // Blur effect
        child: Drawer(
          backgroundColor: Color(0xFFE6F7FA).withOpacity(0.65),
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
                      height: widget.navigationType == "bottomNavigation"
                          ? 125
                          : 165,
                      child: DrawerHeader(
                        child: Image(
                          image: AssetImage(
                              'assets/images/collectionManagerLogo.png'),
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
                            color: appState.isHomeOpen
                                ? Color(0xFF01B4D2)
                                : Color(
                                    0xFF1A576F), // Optional: Adjust icon color
                            size: 32, // Optional: Adjust icon size
                          ),
                          title: Align(
                            alignment: Alignment(-1.1, 0),
                            child: Text(
                              'Home',
                              style: TextStyle(
                                  color: appState.isHomeOpen
                                      ? Color(0xFF01B4D2)
                                      : Color(0xFF1A576F),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                          onTap: () => {
                            appState.setDrawerState(false),
                            appState.setHome(true),
                            appState.setDashboard(false),
                            appState.setDashboardHome(false),
                            appState.setTestsProcessed(false),
                            appState.setTestSampleResults(false),
                            appState.setTestCollectionSummary(false),
                            appState.setOnsiteJobs(false),
                            appState.setOnsiteApprovals(false),
                            appState.setClientManagement(false),
                            appState.setCollectionReports(false),
                            appState.setAccounting(false),
                            appState.setAccountingDashboard(false),
                            appState.setTests(false),
                            appState.setLicensing(false),
                            appState.setITServices(false),
                            appState.setInvoices(false),
                            appState.setCollectorsCalendar(false),
                            appState.setFAQ(false),
                            //_updateSideBarColor(labelType: "home"),
                            Navigator.push(
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
                            color:
                                Color.fromRGBO(26, 87, 111, 0.3), // RGBA color
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
                              initiallyExpanded:
                                  appState.isDashboardOpen ? true : false,
                              iconColor: appState.isDashboardOpen
                                  ? Color(0xFF01B4D2)
                                  : Color(0xFF1A576F),
                              collapsedIconColor: appState.isDashboardOpen
                                  ? Color(0xFF01B4D2)
                                  : Color(0xFF1A576F),
                              leading: ImageIcon(
                                AssetImage(
                                    'assets/images/icons/dashboard.png'), // Path to your image asset
                                color: appState.isDashboardOpen
                                    ? const Color(0xFF01B4D2)
                                    : const Color(
                                        0xFF1A576F), // Optional: Adjust icon color
                                size: 32, // Optional: Adjust icon size
                              ),
                              title: Align(
                                alignment: Alignment(-1.1, 0),
                                child: Text(
                                  'Dashboard',
                                  style: TextStyle(
                                      color: appState.isDashboardOpen
                                          ? Color(0xFF01B4D2)
                                          : Color(0xFF1A576F),
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
                                    color: appState.isDashboardHomeOpen
                                        ? const Color(0xFF01B4D2)
                                        : const Color(
                                            0xFF1A576F), // Optional: Adjust icon color
                                    size: 32, // Optional: Adjust icon size
                                  ),
                                  title: Align(
                                    alignment: Alignment(-1.1, 0),
                                    child: Text(
                                      'Dashboard Home',
                                      style: TextStyle(
                                          color: appState.isDashboardHomeOpen
                                              ? Color(0xFF01B4D2)
                                              : Color(0xFF1A576F),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                  onTap: () => {
                                    appState.setDrawerState(false),
                                    appState.setHome(false),
                                    appState.setDashboard(true),
                                    appState.setDashboardHome(true),
                                    appState.setTestsProcessed(false),
                                    appState.setTestSampleResults(false),
                                    appState.setTestCollectionSummary(false),
                                    appState.setOnsiteJobs(false),
                                    appState.setOnsiteApprovals(false),
                                    appState.setClientManagement(false),
                                    appState.setCollectionReports(false),
                                    appState.setAccounting(false),
                                    appState.setAccountingDashboard(false),
                                    appState.setTests(false),
                                    appState.setLicensing(false),
                                    appState.setITServices(false),
                                    appState.setInvoices(false),
                                    appState.setCollectorsCalendar(false),
                                    appState.setFAQ(false),
                                    //_updateSideBarColor(labelType: "dashboardHome"),
                                    Navigator.push(
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
                                    color: appState.isTestsProcessedOpen
                                        ? const Color(0xFF01B4D2)
                                        : const Color(
                                            0xFF1A576F), // Optional: Adjust icon color
                                    size: 32, // Optional: Adjust icon size
                                  ),
                                  title: Align(
                                    alignment: Alignment(-1.1, 0),
                                    child: Text(
                                      'Tests Processed',
                                      style: TextStyle(
                                          color: appState.isTestsProcessedOpen
                                              ? Color(0xFF01B4D2)
                                              : Color(0xFF1A576F),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                  onTap: () => {
                                    appState.setDrawerState(false),
                                    appState.setHome(false),
                                    appState.setDashboard(true),
                                    appState.setDashboardHome(false),
                                    appState.setTestsProcessed(true),
                                    appState.setTestSampleResults(false),
                                    appState.setTestCollectionSummary(false),
                                    appState.setOnsiteJobs(false),
                                    appState.setOnsiteApprovals(false),
                                    appState.setClientManagement(false),
                                    appState.setCollectionReports(false),
                                    appState.setAccounting(false),
                                    appState.setAccountingDashboard(false),
                                    appState.setTests(false),
                                    appState.setLicensing(false),
                                    appState.setITServices(false),
                                    appState.setInvoices(false),
                                    appState.setCollectorsCalendar(false),
                                    appState.setFAQ(false),
                                    Navigator.push(
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
                                    color: appState.isTestSampleResultsOpen
                                        ? const Color(0xFF01B4D2)
                                        : const Color(
                                            0xFF1A576F), // Optional: Adjust icon color
                                    size: 32, // Optional: Adjust icon size
                                  ),
                                  title: Align(
                                    alignment: Alignment(-1.1, 0),
                                    child: Text(
                                      'Test Sample Results',
                                      style: TextStyle(
                                          color:
                                              appState.isTestSampleResultsOpen
                                                  ? Color(0xFF01B4D2)
                                                  : Color(0xFF1A576F),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                  onTap: () => {
                                    appState.setDrawerState(false),
                                    appState.setHome(false),
                                    appState.setDashboard(true),
                                    appState.setDashboardHome(false),
                                    appState.setTestsProcessed(false),
                                    appState.setTestSampleResults(true),
                                    appState.setTestCollectionSummary(false),
                                    appState.setOnsiteJobs(false),
                                    appState.setOnsiteApprovals(false),
                                    appState.setClientManagement(false),
                                    appState.setCollectionReports(false),
                                    appState.setAccounting(false),
                                    appState.setAccountingDashboard(false),
                                    appState.setTests(false),
                                    appState.setLicensing(false),
                                    appState.setITServices(false),
                                    appState.setInvoices(false),
                                    appState.setCollectorsCalendar(false),
                                    appState.setFAQ(false),
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const TestSampleResults()),
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
                                    color: appState.isTestCollectionSummaryOpen
                                        ? const Color(0xFF01B4D2)
                                        : const Color(
                                            0xFF1A576F), // Optional: Adjust icon color
                                    size: 32, // Optional: Adjust icon size
                                  ),
                                  title: Align(
                                    alignment: Alignment(-1.1, 0),
                                    child: Text(
                                      'Test Collection Summary',
                                      style: TextStyle(
                                          color: appState
                                                  .isTestCollectionSummaryOpen
                                              ? Color(0xFF01B4D2)
                                              : Color(0xFF1A576F),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                  onTap: () => {
                                    appState.setDrawerState(false),
                                    appState.setHome(false),
                                    appState.setDashboard(true),
                                    appState.setDashboardHome(false),
                                    appState.setTestsProcessed(false),
                                    appState.setTestSampleResults(false),
                                    appState.setTestCollectionSummary(true),
                                    appState.setOnsiteJobs(false),
                                    appState.setOnsiteApprovals(false),
                                    appState.setClientManagement(false),
                                    appState.setCollectionReports(false),
                                    appState.setAccounting(false),
                                    appState.setAccountingDashboard(false),
                                    appState.setTests(false),
                                    appState.setLicensing(false),
                                    appState.setITServices(false),
                                    appState.setInvoices(false),
                                    appState.setCollectorsCalendar(false),
                                    appState.setFAQ(false),
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const TestCollectionSummary()),
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
                            color:
                                Color.fromRGBO(26, 87, 111, 0.3), // RGBA color
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
                            color: appState.isOnsiteJobsOpen
                                ? const Color(0xFF01B4D2)
                                : const Color(
                                    0xFF1A576F), // Optional: Adjust icon color
                            size: 32, // Optional: Adjust icon size
                          ),
                          title: Align(
                            alignment: Alignment(-1.1, 0),
                            child: Text(
                              'On-Site Jobs',
                              style: TextStyle(
                                  color: appState.isOnsiteJobsOpen
                                      ? Color(0xFF01B4D2)
                                      : Color(0xFF1A576F),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                          onTap: () => {
                            appState.setDrawerState(false),
                            appState.setHome(false),
                            appState.setDashboard(false),
                            appState.setDashboardHome(false),
                            appState.setTestsProcessed(false),
                            appState.setTestSampleResults(false),
                            appState.setTestCollectionSummary(false),
                            appState.setOnsiteJobs(true),
                            appState.setOnsiteApprovals(false),
                            appState.setClientManagement(false),
                            appState.setCollectionReports(false),
                            appState.setAccounting(false),
                            appState.setAccountingDashboard(false),
                            appState.setTests(false),
                            appState.setLicensing(false),
                            appState.setITServices(false),
                            appState.setInvoices(false),
                            appState.setCollectorsCalendar(false),
                            appState.setFAQ(false),
                            Navigator.push(
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
                            color:
                                Color.fromRGBO(26, 87, 111, 0.3), // RGBA color
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
                            color: appState.isOnsiteApprovals
                                ? const Color(0xFF01B4D2)
                                : const Color(
                                    0xFF1A576F), // Optional: Adjust icon color
                            size: 32, // Optional: Adjust icon size
                          ),
                          title: Align(
                            alignment: Alignment(-1.1, 0),
                            child: Text(
                              'On-Site Approvals',
                              style: TextStyle(
                                  color: appState.isOnsiteApprovals
                                      ? Color(0xFF01B4D2)
                                      : Color(0xFF1A576F),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                          onTap: () => {
                            appState.setHome(false),
                            appState.setDashboard(false),
                            appState.setDashboardHome(false),
                            appState.setTestsProcessed(false),
                            appState.setTestSampleResults(false),
                            appState.setTestCollectionSummary(false),
                            appState.setOnsiteJobs(false),
                            appState.setOnsiteApprovals(true),
                            appState.setClientManagement(false),
                            appState.setCollectionReports(false),
                            appState.setAccounting(false),
                            appState.setAccountingDashboard(false),
                            appState.setTests(false),
                            appState.setLicensing(false),
                            appState.setITServices(false),
                            appState.setInvoices(false),
                            appState.setCollectorsCalendar(false),
                            appState.setFAQ(false),
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const OnsiteApprovals()),
                            )
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 25,
                            right: 25,
                          ),
                          child: const Divider(
                            color:
                                Color.fromRGBO(26, 87, 111, 0.3), // RGBA color
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
                            color: appState.isClientManagementOpen
                                ? const Color(0xFF01B4D2)
                                : const Color(
                                    0xFF1A576F), // Optional: Adjust icon color
                            size: 32, // Optional: Adjust icon size
                          ),
                          title: Align(
                            alignment: Alignment(-1.1, 0),
                            child: Text(
                              'Client Management',
                              style: TextStyle(
                                  color: appState.isClientManagementOpen
                                      ? const Color(0xFF01B4D2)
                                      : const Color(0xFF1A576F),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                          onTap: () => {
                            appState.setDrawerState(false),
                            appState.setHome(false),
                            appState.setDashboard(false),
                            appState.setDashboardHome(false),
                            appState.setTestsProcessed(false),
                            appState.setTestSampleResults(false),
                            appState.setTestCollectionSummary(false),
                            appState.setOnsiteJobs(false),
                            appState.setOnsiteApprovals(false),
                            appState.setClientManagement(true),
                            appState.setCollectionReports(false),
                            appState.setAccounting(false),
                            appState.setAccountingDashboard(false),
                            appState.setTests(false),
                            appState.setLicensing(false),
                            appState.setITServices(false),
                            appState.setInvoices(false),
                            appState.setCollectorsCalendar(false),
                            appState.setFAQ(false),
                            Navigator.push(
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
                            color:
                                Color.fromRGBO(26, 87, 111, 0.3), // RGBA color
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
                            initiallyExpanded:
                                appState.isAccountingOpen ? true : false,
                            visualDensity: VisualDensity(vertical: -4),
                            iconColor: appState.isAccountingOpen
                                ? const Color(0xFF01B4D2)
                                : const Color(0xFF1A576F),
                            collapsedIconColor: appState.isAccountingOpen
                                ? Color(0xFF01B4D2)
                                : Color(0xFF1A576F),
                            leading: ImageIcon(
                              AssetImage(
                                  'assets/images/icons/accounting.png'), // Path to your image asset
                              color: appState.isAccountingOpen
                                  ? const Color(0xFF01B4D2)
                                  : const Color(
                                      0xFF1A576F), // Optional: Adjust icon color
                              size: 32, // Optional: Adjust icon size
                            ),
                            title: Align(
                              alignment: Alignment(-1.1, 0),
                              child: Text(
                                'Accounting',
                                style: TextStyle(
                                    color: appState.isAccountingOpen
                                        ? const Color(0xFF01B4D2)
                                        : const Color(0xFF1A576F),
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
                                  color: appState.isAccountingDashboardOpen
                                      ? const Color(0xFF01B4D2)
                                      : const Color(
                                          0xFF1A576F), // Optional: Adjust icon color
                                  size: 32, // Optional: Adjust icon size
                                ),
                                title: Align(
                                  alignment: Alignment(-1.1, 0),
                                  child: Text(
                                    'Accounting Dashboard',
                                    style: TextStyle(
                                        color:
                                            appState.isAccountingDashboardOpen
                                                ? const Color(0xFF01B4D2)
                                                : const Color(0xFF1A576F),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                                onTap: () => {
                                  appState.setDrawerState(false),
                                  appState.setHome(false),
                                  appState.setDashboard(false),
                                  appState.setDashboardHome(false),
                                  appState.setTestsProcessed(false),
                                  appState.setTestSampleResults(false),
                                  appState.setTestCollectionSummary(false),
                                  appState.setOnsiteJobs(false),
                                  appState.setOnsiteApprovals(false),
                                  appState.setClientManagement(false),
                                  appState.setCollectionReports(false),
                                  appState.setAccounting(true),
                                  appState.setAccountingDashboard(true),
                                  appState.setTests(false),
                                  appState.setLicensing(false),
                                  appState.setITServices(false),
                                  appState.setInvoices(false),
                                  appState.setCollectorsCalendar(false),
                                  appState.setFAQ(false),
                                  Navigator.push(
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
                                  color: appState.isTestsOpen
                                      ? const Color(0xFF01B4D2)
                                      : const Color(
                                          0xFF1A576F), // Optional: Adjust icon color
                                  size: 32, // Optional: Adjust icon size
                                ),
                                title: Align(
                                  alignment: Alignment(-1.1, 0),
                                  child: Text(
                                    ' Tests',
                                    style: TextStyle(
                                        color: appState.isTestsOpen
                                            ? const Color(0xFF01B4D2)
                                            : const Color(0xFF1A576F),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                                onTap: () => {
                                  appState.setDrawerState(false),
                                  appState.setHome(false),
                                  appState.setDashboard(false),
                                  appState.setDashboardHome(false),
                                  appState.setTestsProcessed(false),
                                  appState.setTestSampleResults(false),
                                  appState.setTestCollectionSummary(false),
                                  appState.setOnsiteJobs(false),
                                  appState.setOnsiteApprovals(false),
                                  appState.setClientManagement(false),
                                  appState.setCollectionReports(false),
                                  appState.setAccounting(true),
                                  appState.setAccountingDashboard(false),
                                  appState.setTests(true),
                                  appState.setLicensing(false),
                                  appState.setITServices(false),
                                  appState.setInvoices(false),
                                  appState.setCollectorsCalendar(false),
                                  appState.setFAQ(false),
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
                                  color: appState.isLicensingOpen
                                      ? const Color(0xFF01B4D2)
                                      : const Color(
                                          0xFF1A576F), // Optional: Adjust icon color
                                  size: 32, // Optional: Adjust icon size
                                ),
                                title: Align(
                                  alignment: Alignment(-1.1, 0),
                                  child: Text(
                                    ' Licensing',
                                    style: TextStyle(
                                        color: appState.isLicensingOpen
                                            ? const Color(0xFF01B4D2)
                                            : const Color(0xFF1A576F),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                                onTap: () => {
                                  appState.setHome(false),
                                  appState.setDashboard(false),
                                  appState.setDashboardHome(false),
                                  appState.setTestsProcessed(false),
                                  appState.setTestSampleResults(false),
                                  appState.setTestCollectionSummary(false),
                                  appState.setOnsiteJobs(false),
                                  appState.setOnsiteApprovals(false),
                                  appState.setClientManagement(false),
                                  appState.setCollectionReports(false),
                                  appState.setAccounting(true),
                                  appState.setAccountingDashboard(false),
                                  appState.setTests(false),
                                  appState.setLicensing(true),
                                  appState.setITServices(false),
                                  appState.setInvoices(false),
                                  appState.setCollectorsCalendar(false),
                                  appState.setFAQ(false),
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Licensing()),
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
                                  color: itServices
                                      ? const Color(0xFF01B4D2)
                                      : const Color(
                                          0xFF1A576F), // Optional: Adjust icon color
                                  size: 32, // Optional: Adjust icon size
                                ),
                                title: Align(
                                  alignment: Alignment(-1.1, 0),
                                  child: Text(
                                    ' IT Services',
                                    style: TextStyle(
                                        color: appState.isITServicesOpen
                                            ? const Color(0xFF01B4D2)
                                            : const Color(0xFF1A576F),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                                onTap: () => {
                                  appState.setHome(false),
                                  appState.setDashboard(false),
                                  appState.setDashboardHome(false),
                                  appState.setTestsProcessed(false),
                                  appState.setTestSampleResults(false),
                                  appState.setTestCollectionSummary(false),
                                  appState.setOnsiteJobs(false),
                                  appState.setOnsiteApprovals(false),
                                  appState.setClientManagement(false),
                                  appState.setCollectionReports(false),
                                  appState.setAccounting(true),
                                  appState.setAccountingDashboard(false),
                                  appState.setTests(false),
                                  appState.setLicensing(false),
                                  appState.setITServices(true),
                                  appState.setInvoices(false),
                                  appState.setCollectorsCalendar(false),
                                  appState.setFAQ(false),
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ITServices()),
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
                                  color: appState.isInvoicesOpen
                                      ? const Color(0xFF01B4D2)
                                      : const Color(
                                          0xFF1A576F), // Optional: Adjust icon color
                                  size: 32, // Optional: Adjust icon size
                                ),
                                title: Align(
                                  alignment: Alignment(-1.1, 0),
                                  child: Text(
                                    ' Invoices',
                                    style: TextStyle(
                                        color: appState.isInvoicesOpen
                                            ? const Color(0xFF01B4D2)
                                            : const Color(0xFF1A576F),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                                onTap: () => {
                                  appState.setHome(false),
                                  appState.setDashboard(false),
                                  appState.setDashboardHome(false),
                                  appState.setTestsProcessed(false),
                                  appState.setTestSampleResults(false),
                                  appState.setTestCollectionSummary(false),
                                  appState.setOnsiteJobs(false),
                                  appState.setOnsiteApprovals(false),
                                  appState.setClientManagement(false),
                                  appState.setCollectionReports(false),
                                  appState.setAccounting(true),
                                  appState.setAccountingDashboard(false),
                                  appState.setTests(false),
                                  appState.setLicensing(false),
                                  appState.setITServices(false),
                                  appState.setInvoices(true),
                                  appState.setCollectorsCalendar(false),
                                  appState.setFAQ(false),
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
                            color:
                                Color.fromRGBO(26, 87, 111, 0.3), // RGBA color
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
                            color: appState.isCollectionReportsOpen
                                ? const Color(0xFF01B4D2)
                                : const Color(
                                    0xFF1A576F), // Optional: Adjust icon color
                            size: 32, // Optional: Adjust icon size
                          ),
                          title: Align(
                            alignment: Alignment(-1.1, 0),
                            child: Text(
                              'Collection Reports',
                              style: TextStyle(
                                  color: appState.isCollectionReportsOpen
                                      ? const Color(0xFF01B4D2)
                                      : const Color(0xFF1A576F),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                          onTap: () => {
                            appState.setDrawerState(false),
                            appState.setHome(false),
                            appState.setDashboard(false),
                            appState.setDashboardHome(false),
                            appState.setTestsProcessed(false),
                            appState.setTestSampleResults(false),
                            appState.setTestCollectionSummary(false),
                            appState.setOnsiteJobs(false),
                            appState.setOnsiteApprovals(false),
                            appState.setClientManagement(false),
                            appState.setCollectionReports(true),
                            appState.setAccounting(false),
                            appState.setAccountingDashboard(false),
                            appState.setTests(false),
                            appState.setLicensing(false),
                            appState.setITServices(false),
                            appState.setInvoices(false),
                            appState.setCollectorsCalendar(false),
                            appState.setFAQ(false),
                            Navigator.push(
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
                            color:
                                Color.fromRGBO(26, 87, 111, 0.3), // RGBA color
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
                            color: appState.isCollectorsCalendarOpen
                                ? const Color(0xFF01B4D2)
                                : const Color(
                                    0xFF1A576F), // Optional: Adjust icon color
                            size: 32, // Optional: Adjust icon size
                          ),
                          title: Align(
                            alignment: Alignment(-1.1, 0),
                            child: Text(
                              'Collector\'s Calendar',
                              style: TextStyle(
                                  color: appState.isCollectorsCalendarOpen
                                      ? const Color(0xFF01B4D2)
                                      : const Color(0xFF1A576F),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                          onTap: () => {
                            appState.setHome(false),
                            appState.setDashboard(false),
                            appState.setDashboardHome(false),
                            appState.setTestsProcessed(false),
                            appState.setTestSampleResults(false),
                            appState.setTestCollectionSummary(false),
                            appState.setOnsiteJobs(false),
                            appState.setOnsiteApprovals(false),
                            appState.setClientManagement(false),
                            appState.setCollectionReports(false),
                            appState.setAccounting(false),
                            appState.setAccountingDashboard(false),
                            appState.setTests(false),
                            appState.setLicensing(false),
                            appState.setITServices(false),
                            appState.setInvoices(false),
                            appState.setCollectorsCalendar(true),
                            appState.setFAQ(false),
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CollectorsCalendar()),
                            )
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 25,
                            right: 25,
                          ),
                          child: const Divider(
                            color:
                                Color.fromRGBO(26, 87, 111, 0.3), // RGBA color
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
                              color: appState.isFaqOpen
                                  ? const Color(0xFF01B4D2)
                                  : const Color(
                                      0xFF1A576F), // Optional: Adjust icon color
                              size: 22, // Optional: Adjust icon size
                            ),
                          ),
                          title: Align(
                            alignment: Alignment(-1.1, 0),
                            child: Text(
                              '   FAQ',
                              style: TextStyle(
                                  color: appState.isFaqOpen
                                      ? const Color(0xFF01B4D2)
                                      : const Color(0xFF1A576F),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                          onTap: () => {
                            appState.setHome(false),
                            appState.setDashboard(false),
                            appState.setDashboardHome(false),
                            appState.setTestsProcessed(false),
                            appState.setTestSampleResults(false),
                            appState.setTestCollectionSummary(false),
                            appState.setOnsiteJobs(false),
                            appState.setOnsiteApprovals(false),
                            appState.setClientManagement(false),
                            appState.setCollectionReports(false),
                            appState.setAccounting(false),
                            appState.setAccountingDashboard(false),
                            appState.setTests(false),
                            appState.setLicensing(false),
                            appState.setITServices(false),
                            appState.setInvoices(false),
                            appState.setCollectorsCalendar(false),
                            appState.setFAQ(true),
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const FAQ()),
                            )
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 25,
                            right: 25,
                          ),
                          child: const Divider(
                            color:
                                Color.fromRGBO(26, 87, 111, 0.3), // RGBA color
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
        ),
      ),
    );
  }
}
