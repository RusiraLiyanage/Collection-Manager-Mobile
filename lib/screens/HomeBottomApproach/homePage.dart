import 'package:flutter/material.dart';
import 'package:project_code_blue/AppState/appState.dart';
import 'package:project_code_blue/Navigation/appBar.dart';
import 'package:project_code_blue/screens/CollectorsCalendar/collectorsCalendar.dart';
import 'package:project_code_blue/screens/FAQ/faq.dart';
import 'package:project_code_blue/screens/OnsiteApprovals/onsiteApprovals.dart';
import 'package:project_code_blue/sidemenu/sidemenu.dart';
import 'package:project_code_blue/tabs/tabs_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    return Scaffold(
      extendBodyBehindAppBar: true,
      onDrawerChanged: (isOpen) {
        appState.setDrawerState(isOpen); // Update global drawer state
      },
      drawer: SideMenu(
        navigationType: "bottomNavigation",
      ),
      appBar: const MyAppBar(),
      body: Stack(
        children: [
          Container(
            color: Color(0xFF2C7796),
            width: double.infinity,
            height: 165,
            child: Padding(
              padding: const EdgeInsets.only(top: 68, bottom: 10),
              child: Image.asset(
                'assets/images/collectionManagerLogo.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 165),
            child: Image.asset(
              'assets/images/backgrounds/home-page-background.jpg',
              width: double.infinity,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.62,
            minChildSize: 0.62,
            maxChildSize: 0.8,
            builder: (BuildContext context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: CustomScrollView(
                        controller: scrollController,
                        slivers: [
                          // Header with Welcome Back and vertical line
                          SliverToBoxAdapter(
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(height: 8),
                                  Text(
                                    "Welcome Back",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SliverToBoxAdapter(
                            child: SizedBox(height: 20),
                          ),
                          // Content list
                          SliverList(
                            delegate: SliverChildListDelegate([
                              _buildMenuItem(
                                iconPath:
                                    'assets/images/welcomeBackIcons/welcomeBack_dashboard.png',
                                title: 'Dashboard',
                              ),
                              _buildDivider(),
                              _buildMenuItem(
                                iconPath:
                                    'assets/images/welcomeBackIcons/welcomeBack_onSiteJobs.png',
                                title: 'On-site Jobs',
                              ),
                              _buildDivider(),
                              _buildMenuItem(
                                iconPath:
                                    'assets/images/welcomeBackIcons/welcomeBack_onSiteApprovals.png',
                                title: 'On-site Approvals',
                              ),
                              _buildDivider(),
                              _buildMenuItem(
                                iconPath:
                                    'assets/images/welcomeBackIcons/welcomeBack_clientManagement.png',
                                title: 'Client Management',
                              ),
                              _buildDivider(),
                              _buildMenuItem(
                                iconPath:
                                    'assets/images/welcomeBackIcons/welcomeBack_accounting.png',
                                title: 'Accounting',
                              ),
                              _buildDivider(),
                              _buildMenuItem(
                                iconPath:
                                    'assets/images/welcomeBackIcons/welcomeBack_collectionReports.png',
                                title: 'Collection Reports',
                              ),
                              _buildDivider(),
                              _buildMenuItem(
                                iconPath:
                                    'assets/images/welcomeBackIcons/welcomeBack_collectorsCalendar.png',
                                title: 'Collector’s Calendar',
                              ),
                              _buildDivider(),
                              _buildMenuItem(
                                iconPath:
                                    'assets/images/welcomeBackIcons/welcomeBack_faq.png',
                                title: 'FAQ',
                              ),
                              const SizedBox(height: 12),
                            ]),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Image.asset(
                          'assets/images/icons/Powered by 2.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({required String iconPath, required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 50),
      child: Row(
        children: [
          Image.asset(
            iconPath,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 16),
          GestureDetector(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFF1A576F),
              ),
            ),
            onTap: () {
              if (title == "Dashboard") {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        TabsPage(selectedIndex: 1, navigationMethod: "sidebar"),
                  ),
                );
              } else if (title == "On-site Jobs") {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TabsPage(
                          selectedIndex: 1,
                          navigationMethod:
                              "special_case")), // In here, inside tabs_page it is conditionally monitored
                );
              } else if (title == "On-site Approvals") {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OnsiteApprovals(),
                  ),
                );
              } else if (title == "Client Management") {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TabsPage(
                          selectedIndex: 2, navigationMethod: "sidebar")),
                );
              } else if (title == "Accounting") {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TabsPage(
                          selectedIndex: 4, navigationMethod: "sidebar")),
                );
              } else if (title == "Collection Reports") {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TabsPage(
                          selectedIndex: 3, navigationMethod: "sidebar")),
                );
              } else if (title == "Collector’s Calendar") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CollectorsCalendar()),
                );
              } else if (title == "FAQ") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FAQ(),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 17,
      color: Color(0xFF1A576F).withOpacity(0.3),
      indent: 50,
      endIndent: 40,
    );
  }
}
