import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_code_blue/ColorSchemas/AppColors.dart';
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

  @override
  void initState() {
    super.initState();
    if (widget.selectedIndex == 0) {
      widget.firstInstance = true;
    } else {
      _onItemTapped(widget.selectedIndex);
    }
  }

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
            _updateState(index: 5, selectedIndex: 1);
          }
          break;
        case 2:
          _updateState(index: 7, selectedIndex: 2);
          break;
        case 3:
          _updateState(index: 13, selectedIndex: 3);
          break;
        case 4:
          _updateState(index: 8, selectedIndex: 4);
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

  /// This method now dynamically creates the page fresh based on selectedIndex
  Widget _getPage(int index) {
    return TabNavigationItem.items[index].page;
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(5),
        child: AppBar(
          backgroundColor: const Color(0xFF00004C),
        ),
      ),
      extendBody: true,
      body: Scaffold(
        body: _getPage(_selectedIndex), // <- Here: Dynamic page generation
      ),
      bottomNavigationBar: appState.isDrawerOpen || widget.selectedIndex == 0
          ? null
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 1,
                  bottom: 2,
                  left: 10,
                  right: 10,
                ),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.bottomNavigationBorder.withOpacity(0.52),
                      width: 2.0,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(16),
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: BackdropFilter(
                            filter:
                                ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                            child: Container(
                              color: Colors.white.withOpacity(0.2),
                            ),
                          ),
                        ),
                        BottomNavigationBar(
                          landscapeLayout:
                              BottomNavigationBarLandscapeLayout.spread,
                          elevation: 1,
                          type: BottomNavigationBarType.fixed,
                          backgroundColor:
                              const Color(0xFFFFFFFF).withOpacity(0.5),
                          items: <BottomNavigationBarItem>[
                            BottomNavigationBarItem(
                              icon: Image.asset(
                                _selectedIndex == 0 &&
                                        widget.firstInstance == false
                                    ? 'assets/images/bottomNavigationIcons/selectedIcons/dashboardTrueColor.png'
                                    : 'assets/images/bottomNavigationIcons/unselectedIcons/dashboard_unselected.png',
                                height: 24,
                                fit: BoxFit.contain,
                              ),
                              label: '',
                            ),
                            BottomNavigationBarItem(
                              icon: Image.asset(
                                _selectedIndex == 1 &&
                                        widget.firstInstance == false
                                    ? 'assets/images/bottomNavigationIcons/selectedIcons/jobsTrueColor.png'
                                    : 'assets/images/bottomNavigationIcons/unselectedIcons/onsiteJobs_unselected.png',
                                height: 28,
                                fit: BoxFit.contain,
                              ),
                              label: '',
                            ),
                            BottomNavigationBarItem(
                              icon: Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Image.asset(
                                  _selectedIndex == 2 &&
                                          widget.firstInstance == false
                                      ? 'assets/images/bottomNavigationIcons/selectedIcons/cmTrueColor.png'
                                      : 'assets/images/bottomNavigationIcons/unselectedIcons/clientManagement_unselected.png',
                                  height: 28,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              label: '',
                            ),
                            BottomNavigationBarItem(
                              icon: Image.asset(
                                _selectedIndex == 3 &&
                                        widget.firstInstance == false
                                    ? 'assets/images/bottomNavigationIcons/selectedIcons/reportsTrueColor.png'
                                    : 'assets/images/bottomNavigationIcons/unselectedIcons/collectionReports_unselected.png',
                                height: 28,
                                fit: BoxFit.contain,
                              ),
                              label: '',
                            ),
                            BottomNavigationBarItem(
                              icon: Image.asset(
                                _selectedIndex == 4 &&
                                        widget.firstInstance == false
                                    ? 'assets/images/bottomNavigationIcons/selectedIcons/accountingTrueColor.png'
                                    : 'assets/images/bottomNavigationIcons/unselectedIcons/accounting_unselected.png',
                                height: 28,
                                fit: BoxFit.contain,
                              ),
                              label: '',
                            ),
                          ],
                          currentIndex: _selectedIndex,
                          selectedItemColor: AppColors.bottomNavigationBorder,
                          unselectedItemColor: AppColors.bottomNavigationBorder,
                          selectedLabelStyle: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                          unselectedLabelStyle: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                          showSelectedLabels: false,
                          showUnselectedLabels: false,
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
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
