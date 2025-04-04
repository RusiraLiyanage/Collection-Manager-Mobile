import 'package:flutter/material.dart';
import 'package:project_code_blue/screens/Accounting/accountingDashboard.dart';
import 'package:project_code_blue/screens/Accounting/invoices.dart';
import 'package:project_code_blue/screens/Accounting/itServices.dart';
import 'package:project_code_blue/screens/Accounting/licensing.dart';
import 'package:project_code_blue/screens/Accounting/tests.dart';
import 'package:project_code_blue/screens/ClientManagement/clientManagement.dart';
import 'package:project_code_blue/screens/CollectionReports/collectionReports.dart';
import 'package:project_code_blue/screens/CollectorsCalendar/collectorsCalendar.dart';
import 'package:project_code_blue/screens/Dashboard/testCollectionSummary.dart';
import 'package:project_code_blue/screens/Dashboard/testSampleResults.dart';
import 'package:project_code_blue/screens/Dashboard/testsProcessed.dart';
import 'package:project_code_blue/screens/HomeBottomApproach/homePage.dart';
import 'package:project_code_blue/screens/OnsiteApprovals/onsiteApprovals.dart';
import 'package:project_code_blue/screens/OnsiteJobs/onSiteJobsHome.dart';
import '../screens/Dashboard/DashboardHome.dart';

class TabNavigationItem {
  final Widget page;
  final Widget title;
  final Icon icon;

  TabNavigationItem(
      {required this.page, required this.title, required this.icon});

  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: const HomePage(),
          icon: Icon(Icons.home),
          title: Text("Home"),
        ),
        TabNavigationItem(
          page: const DashboardHome(),
          icon: Icon(Icons.dashboard),
          title: Text("Dashboard Home"),
        ),
        TabNavigationItem(
          page: const TestsProcessed(),
          icon: Icon(Icons.dashboard),
          title: Text("Tests Processed"),
        ),
        TabNavigationItem(
          page: const TestSampleResults(),
          icon: Icon(Icons.dashboard),
          title: Text("Test Sample Results"),
        ),
        TabNavigationItem(
          page: const TestCollectionSummary(),
          icon: Icon(Icons.dashboard),
          title: Text("Test Collection Summary"),
        ),
        TabNavigationItem(
          page: const OnsiteJobsHome(),
          icon: Icon(Icons.home),
          title: Text("Onsite Jobs"),
        ),
        TabNavigationItem(
          page: const OnsiteApprovals(),
          icon: Icon(Icons.home),
          title: Text("Onsite Approvals"),
        ),
        TabNavigationItem(
          page: const ClientManagement(),
          icon: Icon(Icons.home),
          title: Text("Client Management"),
        ),
        TabNavigationItem(
          page: const AccountingDashboard(),
          icon: Icon(Icons.home),
          title: Text("Accounting Dashboard"),
        ),
        TabNavigationItem(
          page: const Tests(),
          icon: Icon(Icons.home),
          title: Text("Tests"),
        ),
        TabNavigationItem(
          page: const Licensing(),
          icon: Icon(Icons.home),
          title: Text("Licensing"),
        ),
        TabNavigationItem(
          page: const ITServices(),
          icon: Icon(Icons.home),
          title: Text("IT Services"),
        ),
        TabNavigationItem(
          page: const Invoices(),
          icon: Icon(Icons.home),
          title: Text("Invoices"),
        ),
        TabNavigationItem(
          page: const CollectionReports(),
          icon: Icon(Icons.home),
          title: Text("Collection Reports"),
        ),
        TabNavigationItem(
          page: const CollectorsCalendar(),
          icon: Icon(Icons.home),
          title: Text("Collector's Calendar"),
        ),
        TabNavigationItem(
          page: const CollectorsCalendar(),
          icon: Icon(Icons.home),
          title: Text("FAQ"),
        ),
      ];
}
