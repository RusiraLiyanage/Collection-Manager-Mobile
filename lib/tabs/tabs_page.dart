import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../AppState/appState.dart';
import '../tabs/bottom_tabs.dart';

class TabsPage extends StatefulWidget {
  int selectedIndex = 0;
  String navigationMethod = "";
  bool firstInstance = true;

  TabsPage({required this.selectedIndex, required this.navigationMethod});

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _selectedIndex = 0;
  bool _isDrawerOpen = false; // Track drawer state
  void _onItemTapped(int index, {bool fromBottomNavigation = false}) {
    setState(() {
      widget.firstInstance = false;
      switch (index) {
        case 0:
          _updateState(index: 1, selectedIndex: 0);
          break;

        case 1:
          if (widget.navigationMethod == "sidebar" && !fromBottomNavigation) {
            _updateState(index: 1, selectedIndex: 0);
            widget.navigationMethod = "app_startup";
          } else {
            _updateState(index: 4, selectedIndex: 1);
          }
          break;

        case 2:
          _updateState(index: 6, selectedIndex: 2);
          break;

        case 3:
          _updateState(index: 12, selectedIndex: 3);
          break;

        case 4:
          _updateState(index: 7, selectedIndex: 4);
          break;

        default:
          _updateState(index: index, selectedIndex: index);
          break;
      }
      print(_selectedIndex);
    });
  }

  void _updateState({required int index, required int selectedIndex}) {
    widget.selectedIndex = index;
    _selectedIndex = selectedIndex;
  }

  @override
  void initState() {
    if (widget.selectedIndex == 0) {
      widget.firstInstance = true;
    } else {
      _onItemTapped(widget.selectedIndex);
      super.initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(5),
        child: AppBar(
          backgroundColor: Color(0xFF00004C),
          // Fixed custom color
        ),
      ),
      extendBody: true, // Allow the body to extend behind the bottom bar
      body: Scaffold(
        body: IndexedStack(
          index: widget.selectedIndex,
          children: [
            for (final tabItem in TabNavigationItem.items) tabItem.page,
          ],
        ),
      ),
      bottomNavigationBar: appState.isDrawerOpen || widget.selectedIndex == 0
          ? null
          : Padding(
              padding: const EdgeInsets.only(
                top: 1,
                bottom: 16,
                left: 10,
                right: 10,
              ), // Add padding for scaling
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFF01B4D2)
                        .withOpacity(0.52), // Set the border color here
                    width: 2.0, // Set the border width
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16), // Set the border radius here
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16),
                  ),
                  child: Stack(children: [
                    // Blurry Background Effect
                    Positioned.fill(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                            sigmaX: 10.0, sigmaY: 10.0), // Blur effect
                        child: Container(
                          color: Colors.white
                              .withOpacity(0.2), // Adjust transparency
                        ),
                      ),
                    ),
                    BottomNavigationBar(
                        landscapeLayout:
                            BottomNavigationBarLandscapeLayout.spread,
                        elevation: 1,
                        type: BottomNavigationBarType.fixed,
                        backgroundColor: const Color(0xFFFFFFFF)
                            .withOpacity(0.5), // Background with transparency
                        items: <BottomNavigationBarItem>[
                          BottomNavigationBarItem(
                            icon: Image.asset(
                              _selectedIndex == 0 &&
                                      widget.firstInstance == false
                                  ? 'assets/images/bottomNavigationIcons/selectedIcons/dashboard_selected.png' // Selected image
                                  : 'assets/images/bottomNavigationIcons/unselectedIcons/dashboard_unselected.png', // Unselected image
                              height: 24, // Increase height
                              fit: BoxFit
                                  .contain, // Ensures the image fits within the specified size
                            ),
                            label: '',
                          ),
                          BottomNavigationBarItem(
                            icon: Image.asset(
                              _selectedIndex == 1 &&
                                      widget.firstInstance == false
                                  ? 'assets/images/bottomNavigationIcons/selectedIcons/onsiteJobs_selected.png' // Selected image
                                  : 'assets/images/bottomNavigationIcons/unselectedIcons/onsiteJobs_unselected.png', // Unselected image
                              height: 28, // Increase height
                              fit: BoxFit
                                  .contain, // Ensures the image fits within the specified size
                            ),
                            label: '',
                          ),
                          BottomNavigationBarItem(
                            icon: Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Image.asset(
                                _selectedIndex == 2 &&
                                        widget.firstInstance == false
                                    ? 'assets/images/bottomNavigationIcons/selectedIcons/clientManagement_selected.png' // Selected image
                                    : 'assets/images/bottomNavigationIcons/unselectedIcons/clientManagement_unselected.png', // Unselected image
                                height: 28, // Increase height
                                fit: BoxFit
                                    .contain, // Ensures the image fits within the specified size
                              ),
                            ),
                            label: '',
                          ),
                          BottomNavigationBarItem(
                            icon: Image.asset(
                              _selectedIndex == 3 &&
                                      widget.firstInstance == false
                                  ? 'assets/images/bottomNavigationIcons/selectedIcons/collectionReports_selected.png' // Selected image
                                  : 'assets/images/bottomNavigationIcons/unselectedIcons/collectionReports_unselected.png', // Unselected image
                              height: 28, // Increase height
                              fit: BoxFit
                                  .contain, // Ensures the image fits within the specified size
                            ),
                            label: '',
                          ),
                          BottomNavigationBarItem(
                            icon: Image.asset(
                              _selectedIndex == 4 &&
                                      widget.firstInstance == false
                                  ? 'assets/images/bottomNavigationIcons/selectedIcons/accounting_selected.png' // Selected image
                                  : 'assets/images/bottomNavigationIcons/unselectedIcons/accounting_unselected.png', // Unselected image
                              height: 28, // Increase height
                              fit: BoxFit
                                  .contain, // Ensures the image fits within the specified size
                            ),
                            label: '',
                          ),
                        ],
                        currentIndex: _selectedIndex,
                        selectedItemColor: widget.firstInstance
                            ? Color(0xFF01B4D2)
                            : const Color(0xFF01B4D2),
                        unselectedItemColor: const Color(0xFF01B4D2),
                        selectedLabelStyle: const TextStyle(
                          fontSize: 13, // Increase font size for selected label
                          fontWeight:
                              FontWeight.bold, // Make it bold (optional)
                        ),
                        unselectedLabelStyle: const TextStyle(
                          fontSize: 13, // Increase font size for selected label
                          fontWeight:
                              FontWeight.bold, // Make it bold (optional)
                        ),
                        showSelectedLabels: false, // Hide selected labels
                        showUnselectedLabels: false, // Hide unselected labels
                        onTap: (index) {
                          _onItemTapped(index, fromBottomNavigation: true);
                          if (index == 0) {
                            appState.setHome(false);
                            appState.setDashboard(true);
                            appState.setDashboardHome(true);
                            appState.setTestsProcessed(false);
                            appState.setTestSampleResults(false);
                            appState.setOnsiteJobs(false);
                            appState.setOnsiteApprovals(false);
                            appState.setClientManagement(false);
                            appState.setCollectionReports(false);
                            appState.setAccounting(false);
                            appState.setAccountingDashboard(false);
                            appState.setTests(false);
                            appState.setLicensing(false);
                            appState.setITServices(false);
                            appState.setInvoices(false);
                            appState.setCollectorsCalendar(false);
                            appState.setFAQ(false);
                          } else if (index == 1) {
                            appState.setHome(false);
                            appState.setDashboard(false);
                            appState.setDashboardHome(false);
                            appState.setTestsProcessed(false);
                            appState.setTestSampleResults(false);
                            appState.setOnsiteJobs(true);
                            appState.setOnsiteApprovals(false);
                            appState.setClientManagement(false);
                            appState.setCollectionReports(false);
                            appState.setAccounting(false);
                            appState.setAccountingDashboard(false);
                            appState.setTests(false);
                            appState.setLicensing(false);
                            appState.setITServices(false);
                            appState.setInvoices(false);
                            appState.setCollectorsCalendar(false);
                            appState.setFAQ(false);
                          } else if (index == 2) {
                            appState.setHome(false);
                            appState.setDashboard(false);
                            appState.setDashboardHome(false);
                            appState.setTestsProcessed(false);
                            appState.setTestSampleResults(false);
                            appState.setOnsiteJobs(false);
                            appState.setOnsiteApprovals(false);
                            appState.setClientManagement(true);
                            appState.setCollectionReports(false);
                            appState.setAccounting(false);
                            appState.setAccountingDashboard(false);
                            appState.setTests(false);
                            appState.setLicensing(false);
                            appState.setITServices(false);
                            appState.setInvoices(false);
                            appState.setCollectorsCalendar(false);
                            appState.setFAQ(false);
                          } else if (index == 3) {
                            appState.setHome(false);
                            appState.setDashboard(false);
                            appState.setDashboardHome(false);
                            appState.setTestsProcessed(false);
                            appState.setTestSampleResults(false);
                            appState.setOnsiteJobs(false);
                            appState.setOnsiteApprovals(false);
                            appState.setClientManagement(false);
                            appState.setCollectionReports(true);
                            appState.setAccounting(false);
                            appState.setAccountingDashboard(false);
                            appState.setTests(false);
                            appState.setLicensing(false);
                            appState.setITServices(false);
                            appState.setInvoices(false);
                            appState.setCollectorsCalendar(false);
                            appState.setFAQ(false);
                          } else if (index == 4) {
                            appState.setHome(false);
                            appState.setDashboard(false);
                            appState.setDashboardHome(false);
                            appState.setTestsProcessed(false);
                            appState.setTestSampleResults(false);
                            appState.setOnsiteJobs(false);
                            appState.setOnsiteApprovals(false);
                            appState.setClientManagement(false);
                            appState.setCollectionReports(false);
                            appState.setAccounting(true);
                            appState.setAccountingDashboard(true);
                            appState.setTests(false);
                            appState.setLicensing(false);
                            appState.setITServices(false);
                            appState.setInvoices(false);
                            appState.setCollectorsCalendar(false);
                            appState.setFAQ(false);
                          }
                        }),
                  ]),
                ),
              ),
            ),
    );
  }
}
