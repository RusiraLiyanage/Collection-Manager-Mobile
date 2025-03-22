import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project_code_blue/screens/ClientManagement/achievedClientCard.dart';
import 'package:project_code_blue/screens/ClientManagement/clientManagementCard.dart';
import 'package:project_code_blue/screens/ClientManagement/newClient.dart';
import 'package:provider/provider.dart';
import '../../AppState/appState.dart';
import 'package:project_code_blue/Navigation/appBar.dart';
import 'package:project_code_blue/sidemenu/sidemenu.dart';

class ClientManagement extends StatefulWidget {
  const ClientManagement({super.key});

  @override
  State<ClientManagement> createState() => _ClientManagementState();
}

class _ClientManagementState extends State<ClientManagement> {
  String? _selectedShow;

  bool showMainClients = true;

  int currentPage = 1; // Tracks the current page
  int itemsPerPage = 5; // Default items per page

  int currentPageAchieved = 1; // Tracks the current page
  int itemsPerPageAchieved = 5; // Default items per page

  String get displayRange {
    int start = ((currentPage - 1) * itemsPerPage) + 1;
    int end = currentPage * itemsPerPage;
    end = end > clientData.length ? clientData.length : end;
    return "$start - $end";
  }

  String get displayRangeAchieved {
    int start = ((currentPageAchieved - 1) * itemsPerPageAchieved) + 1;
    int end = currentPageAchieved * itemsPerPageAchieved;
    end = end > clientDataAchieved.length ? clientDataAchieved.length : end;
    return "$start - $end";
  }

  final List<String> showValues = [
    "All",
    "Specific",
  ];

  int get totalPages => (clientData.length / itemsPerPage).ceil();

  final List<String> status = ["Show", "Hide"];
  final List<String> filteringAmounts = ["5", "10", "15"];
  final List<String> filteringAmountsArchieved = ["5", "10", "15"];

  final List<Map<String, String>> clientData = [
    {
      "clientNumber": "1",
      "clientName": "New Castle City Council",
      "clientReference": "abc12345678",
      "authorizedRep": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
      "callout": "Yes",
    },
    {
      "clientNumber": "2",
      "clientName": "New Castle City Council",
      "clientReference": "abc12345678",
      "authorizedRep": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
      "callout": "Yes",
    },
    {
      "clientNumber": "3",
      "clientName": "New Castle City Council",
      "clientReference": "abc12345678",
      "authorizedRep": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
      "callout": "Yes",
    },
    {
      "clientNumber": "4",
      "clientName": "New Castle City Council",
      "clientReference": "abc12345678",
      "authorizedRep": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
      "callout": "Yes",
    },
    {
      "clientNumber": "5",
      "clientName": "New Castle City Council",
      "clientReference": "abc12345678",
      "authorizedRep": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
      "callout": "Yes",
    },
    {
      "clientNumber": "6",
      "clientName": "New Castle City Council",
      "clientReference": "abc12345678",
      "authorizedRep": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
      "callout": "Yes",
    },
    {
      "clientNumber": "7",
      "clientName": "New Castle City Council",
      "clientReference": "abc12345678",
      "authorizedRep": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
      "callout": "Yes",
    },
    {
      "clientNumber": "8",
      "clientName": "New Castle City Council",
      "clientReference": "abc12345678",
      "authorizedRep": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
      "callout": "Yes",
    },
    {
      "clientNumber": "9",
      "clientName": "New Castle City Council",
      "clientReference": "abc12345678",
      "authorizedRep": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
      "callout": "Yes",
    },
    {
      "clientNumber": "10",
      "clientName": "New Castle City Council",
      "clientReference": "abc12345678",
      "authorizedRep": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
      "callout": "Yes",
    },
    {
      "clientNumber": "11",
      "clientName": "New Castle City Council",
      "clientReference": "abc12345678",
      "authorizedRep": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
      "callout": "Yes",
    },
    {
      "clientNumber": "12",
      "clientName": "New Castle City Council",
      "clientReference": "abc12345678",
      "authorizedRep": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
      "callout": "Yes",
    },
    {
      "clientNumber": "13",
      "clientName": "New Castle City Council",
      "clientReference": "abc12345678",
      "authorizedRep": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
      "callout": "Yes",
    },
    {
      "clientNumber": "14",
      "clientName": "New Castle City Council",
      "clientReference": "abc12345678",
      "authorizedRep": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
      "callout": "Yes",
    },
    {
      "clientNumber": "15",
      "clientName": "New Castle City Council",
      "clientReference": "abc12345678",
      "authorizedRep": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
      "callout": "Yes",
    },
    {
      "clientNumber": "16",
      "clientName": "New Castle City Council",
      "clientReference": "abc12345678",
      "authorizedRep": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
      "callout": "Yes",
    },
    {
      "clientNumber": "17",
      "clientName": "New Castle City Council",
      "clientReference": "abc12345678",
      "authorizedRep": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
      "callout": "Yes",
    },
    {
      "clientNumber": "18",
      "clientName": "New Castle City Council",
      "clientReference": "abc12345678",
      "authorizedRep": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
      "callout": "Yes",
    },
    {
      "clientNumber": "19",
      "clientName": "New Castle City Council",
      "clientReference": "abc12345678",
      "authorizedRep": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
      "callout": "Yes",
    },
    {
      "clientNumber": "20",
      "clientName": "New Castle City Council",
      "clientReference": "abc12345678",
      "authorizedRep": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
      "callout": "Yes",
    },
  ];

  int get totalPagesAchieved =>
      (clientDataAchieved.length / itemsPerPageAchieved).ceil();

  final List<Map<String, String>> clientDataAchieved = [
    {
      "clientNumber": "1",
      "clientName": "New Castle City Council",
      "clientReference": "abc12345678",
      "authorizedRep": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
      "callout": "Yes",
    },
    {
      "clientNumber": "2",
      "clientName": "New Castle City Council",
      "clientReference": "abc12345678",
      "authorizedRep": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
      "callout": "Yes",
    },
    {
      "clientNumber": "3",
      "clientName": "New Castle City Council",
      "clientReference": "abc12345678",
      "authorizedRep": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
      "callout": "Yes",
    },
    {
      "clientNumber": "4",
      "clientName": "New Castle City Council",
      "clientReference": "abc12345678",
      "authorizedRep": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
      "callout": "Yes",
    },
    {
      "clientNumber": "5",
      "clientName": "New Castle City Council",
      "clientReference": "abc12345678",
      "authorizedRep": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
      "callout": "Yes",
    },
    {
      "clientNumber": "6",
      "clientName": "New Castle City Council",
      "clientReference": "abc12345678",
      "authorizedRep": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
      "callout": "Yes",
    },
    {
      "clientNumber": "7",
      "clientName": "New Castle City Council",
      "clientReference": "abc12345678",
      "authorizedRep": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
      "callout": "Yes",
    },
    {
      "clientNumber": "8",
      "clientName": "New Castle City Council",
      "clientReference": "abc12345678",
      "authorizedRep": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
      "callout": "Yes",
    },
    {
      "clientNumber": "9",
      "clientName": "New Castle City Council",
      "clientReference": "abc12345678",
      "authorizedRep": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
      "callout": "Yes",
    },
    {
      "clientNumber": "10",
      "clientName": "New Castle City Council",
      "clientReference": "abc12345678",
      "authorizedRep": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
      "callout": "Yes",
    },
    {
      "clientNumber": "11",
      "clientName": "New Castle City Council",
      "clientReference": "abc12345678",
      "authorizedRep": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
      "callout": "Yes",
    },
    {
      "clientNumber": "12",
      "clientName": "New Castle City Council",
      "clientReference": "abc12345678",
      "authorizedRep": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
      "callout": "Yes",
    },
    {
      "clientNumber": "13",
      "clientName": "New Castle City Council",
      "clientReference": "abc12345678",
      "authorizedRep": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
      "callout": "Yes",
    },
    {
      "clientNumber": "14",
      "clientName": "New Castle City Council",
      "clientReference": "abc12345678",
      "authorizedRep": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
      "callout": "Yes",
    },
    {
      "clientNumber": "15",
      "clientName": "New Castle City Council",
      "clientReference": "abc12345678",
      "authorizedRep": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
      "callout": "Yes",
    },
    {
      "clientNumber": "16",
      "clientName": "New Castle City Council",
      "clientReference": "abc12345678",
      "authorizedRep": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
      "callout": "Yes",
    },
    {
      "clientNumber": "17",
      "clientName": "New Castle City Council",
      "clientReference": "abc12345678",
      "authorizedRep": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
      "callout": "Yes",
    },
    {
      "clientNumber": "18",
      "clientName": "New Castle City Council",
      "clientReference": "abc12345678",
      "authorizedRep": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
      "callout": "Yes",
    },
    {
      "clientNumber": "19",
      "clientName": "New Castle City Council",
      "clientReference": "abc12345678",
      "authorizedRep": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
      "callout": "Yes",
    },
    {
      "clientNumber": "20",
      "clientName": "New Castle City Council",
      "clientReference": "abc12345678",
      "authorizedRep": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
      "callout": "Yes",
    },
  ];

  // Filtered jobs to display based on pagination
  List<Map<String, String>> get paginatedClientData {
    int startIndex = (currentPage - 1) * itemsPerPage;
    int endIndex = startIndex + itemsPerPage;
    endIndex = endIndex > clientData.length ? clientData.length : endIndex;
    return clientData.sublist(startIndex, endIndex);
  }

  // Filtered achieved jobs to display based on pagination
  List<Map<String, String>> get paginatedClientDataAchieved {
    int startIndexAchieved = (currentPageAchieved - 1) * itemsPerPageAchieved;
    int endIndexAchieved = startIndexAchieved + itemsPerPageAchieved;
    endIndexAchieved = endIndexAchieved > clientDataAchieved.length
        ? clientDataAchieved.length
        : endIndexAchieved;
    return clientData.sublist(startIndexAchieved, endIndexAchieved);
  }

  bool isAtBottom = false; // Track whether the scroll is at the bottom
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _clientSearchController = TextEditingController();

  String? _selectedFilteringValue; // State variable for selected value

  String? _selectedFilteringValueAchieved; // State variable for selected value

  bool achieveClientsOpened = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _selectedShow = showValues.first;

    _selectedFilteringValue = filteringAmounts.first;
    _selectedFilteringValueAchieved = filteringAmountsArchieved.first;

    // Initialize selected value

    // Add listener to monitor scroll changes
    _scrollController.addListener(() {
      // Check if the scroll position is at the bottom
      bool atBottom = _scrollController.position.atEdge &&
          _scrollController.position.pixels > 0;

      if (atBottom != isAtBottom) {
        setState(() {
          isAtBottom = atBottom;
        });
      }
    });

    _scrollController.addListener(() {
      if (_scrollController.position.pixels < 680) {
        setState(() {
          showMainClients = true;
          achieveClientsOpened = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _clientSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      extendBodyBehindAppBar: true, // Extends body behind the AppBar
      onDrawerChanged: (isOpen) {
        appState.setDrawerState(isOpen); // Update global drawer state
      },
      drawer: SideMenu(
        navigationType: "bottomNavigation",
      ),
      appBar: MyAppBar(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          bottom: 110.0,
          left: 3.0,
        ),
        child: Container(
          height: 40.0,
          width: 40.0,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {
                if (isAtBottom) {
                  // Scroll to the top
                  _scrollController.animateTo(
                    0,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeOut,
                  );
                } else {
                  // Scroll to the bottom
                  _scrollController.animateTo(
                    _scrollController.position.maxScrollExtent,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeOut,
                  );
                }
              },
              tooltip: isAtBottom ? "Scroll to Top" : "Scroll to Bottom",
              child: Icon(
                isAtBottom ? Icons.arrow_upward : Icons.arrow_downward,
                size: 40,
              ),
            ),
          ),
        ),
      ),
      body: Stack(children: [
        Scrollbar(
          thumbVisibility: true,
          interactive: true,
          trackVisibility: true,
          controller: _scrollController,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                SizedBox(
                  height:
                      kToolbarHeight + MediaQuery.of(context).padding.top + 11,
                ), // Ensures initial content starts below AppBar
                Container(
                  width: double.infinity,
                  height: 120,
                  color: Color(0xFFD9D9D9),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              "Home / Client Management",
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 16.0,
                              top: 8.0,
                            ),
                            child: InkWell(
                              onTap: () {
                                print("On tapped");
                              },
                              child: ClipRRect(
                                child: Image.asset(
                                  "assets/images/icons/refreshIcon.png",
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                          right: 10.0,
                          bottom: 10.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Client Management",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: InkWell(
                                onTap: () {
                                  if (Platform.isAndroid) {
                                    showModalBottomSheet<void>(
                                      isScrollControlled:
                                          true, // Allows controlling the height
                                      isDismissible: false,
                                      enableDrag: false,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return DraggableScrollableSheet(
                                          expand: false,
                                          initialChildSize:
                                              1, // Initial height of the sheet (93% of the screen)
                                          minChildSize:
                                              1, // Allow shrinking to 50% of the screen
                                          maxChildSize:
                                              1, // Prevent expansion above 93% of the screen
                                          builder: (BuildContext context,
                                              ScrollController
                                                  scrollController) {
                                            return Container(
                                              width: double.infinity,
                                              decoration: const BoxDecoration(
                                                color: Color(
                                                    0xFFEDEEF0), // Background color of the bottom sheet
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                  top: Radius.circular(
                                                      0), // Rounded top corners
                                                ),
                                              ),
                                              child: NewClient(
                                                  scrollController:
                                                      scrollController),
                                            );
                                          },
                                        );
                                      },
                                    );
                                  } else if (Platform.isIOS) {
                                    showModalBottomSheet<void>(
                                      isScrollControlled:
                                          true, // Allows controlling the height
                                      isDismissible: false,
                                      enableDrag: false,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return DraggableScrollableSheet(
                                          expand: false,
                                          initialChildSize:
                                              1, // Initial height of the sheet (93% of the screen)
                                          minChildSize:
                                              1, // Allow shrinking to 50% of the screen
                                          maxChildSize:
                                              1, // Prevent expansion above 93% of the screen
                                          builder: (BuildContext context,
                                              ScrollController
                                                  scrollController) {
                                            return Container(
                                              width: double.infinity,
                                              decoration: const BoxDecoration(
                                                color: Color(
                                                    0xFFEDEEF0), // Background color of the bottom sheet
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                  top: Radius.circular(
                                                      0), // Rounded top corners
                                                ),
                                              ),
                                              child: NewClient(
                                                  scrollController:
                                                      scrollController),
                                            );
                                          },
                                        );
                                      },
                                    );
                                    /* showCupertinoModalBottomSheet(
                                      transitionBackgroundColor:
                                          Colors.transparent,
                                      enableDrag: false,
                                      isDismissible: false,
                                      expand: true,
                                      context: context,
                                      backgroundColor: Colors.transparent,
                                      builder: (context) =>
                                          DraggableScrollableSheet(
                                        initialChildSize:
                                            1, // Sets the initial size to 100% of the screen
                                        minChildSize:
                                            1, // Minimum size (100% of the screen)
                                        maxChildSize:
                                            1, // Maximum size (100% of the screen)
                                        builder: (context, scrollController) {
                                          return Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                top: Radius.circular(40),
                                              ),
                                            ),
                                            child: Container(
                                              child: NewJobAndroidEdited(
                                                scrollController:
                                                    scrollController,
                                              ),

                                              // const NewJob(),
                                            ),
                                          );
                                        },
                                      ),
                                    ); */
                                  }
                                },
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: ClipRRect(
                                    child: Image.asset(
                                      "assets/images/icons/newJobOpen.png",
                                      width: 24,
                                      height: 24,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 100,
                  color: Color(0xFFF2F2F2).withOpacity(1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 10,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 48.0),
                              child: Text(
                                "Show",
                                style: TextStyle(
                                  color: Color(0xFF005277),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              width: 169,
                              height: 28,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(
                                        0.2), // Shadow color with opacity
                                    spreadRadius:
                                        1, // How much the shadow spreads
                                    blurRadius: 1, // How blurry the shadow is
                                    offset: Offset(0,
                                        0), // Offset for shadow position (x, y)
                                  ),
                                ],
                              ),
                              child: DropdownButtonFormField<String>(
                                value: _selectedShow,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        color: Colors.transparent, width: 2),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 2), // Border colo
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 2), // Border color when focused
                                  ),
                                  fillColor: Colors
                                      .white, // Set the background color to white
                                  filled: true,
                                ),
                                icon: Icon(
                                  Icons.arrow_drop_down_outlined,
                                  color: Color(
                                    0xFF71717A,
                                  ),
                                ),
                                items: showValues
                                    .map((item) => DropdownMenuItem(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xFF007AFF),
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedShow = value;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 38.0),
                              child: Text(
                                "Search",
                                style: TextStyle(
                                  color: Color(0xFF005277),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              width: 200,
                              height: 28,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(
                                        0.2), // Shadow color with opacity
                                    spreadRadius:
                                        1, // How much the shadow spreads
                                    blurRadius: 1, // How blurry the shadow is
                                    offset: Offset(0,
                                        0), // Offset for shadow position (x, y)
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                controller: _clientSearchController,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width:
                                            2), // Default border with thickness
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 3), // Border color when enabled
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 3), // Border color when focused
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: 'Search', // Placeholder text
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.all(
                                        8.0), // Adjust the padding as needed
                                    child: Image.asset(
                                      "assets/images/icons/searchIcon.png", // Replace with your image path
                                      width:
                                          15, // Adjust the width of the image
                                      height:
                                          15, // Adjust the height of the image
                                    ),
                                  ),
                                  hintStyle: TextStyle(
                                    color: Color(0xFF007AFF),
                                  ), // Style for the hint text
                                ),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF007AFF),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _clientSearchController.text = value;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                      padding: const EdgeInsets.only(
                        right: 18.0,
                        bottom: 5.0,
                      ),
                      child: showMainClients
                          ? Text(
                              "$displayRange out of ${clientData.length} records",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : null),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 70.0),
                  child: Column(
                    children: [
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: paginatedClientData.length,
                        itemBuilder: (context, index) {
                          final client = paginatedClientData[index];
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 16.0,
                                right: 16.0,
                                bottom: 10.0,
                              ),
                              child: ClientManagementCard(client: client),
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10.0,
                          right: 70,
                        ),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 30.0),
                                child: Text(
                                  "Show",
                                  style: TextStyle(
                                    color: Color(0xFF005277),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 28,
                                child: DropdownButtonFormField<String>(
                                  focusColor: Colors.white,
                                  value: _selectedFilteringValue,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(0),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(0),
                                      borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 2), // Border colo
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(0),
                                      borderSide: BorderSide(
                                          color: Colors.grey,
                                          width:
                                              2), // Border color when focused
                                    ),
                                    fillColor: Colors
                                        .white, // Set the background color to white
                                    filled: true,
                                    // Enable the fill color
                                  ),
                                  icon: Icon(Icons.arrow_drop_down,
                                      color: Colors.black),
                                  items: filteringAmounts
                                      .map((item) => DropdownMenuItem(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFF007AFF),
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedFilteringValue = value;
                                      itemsPerPage = int.parse(value!);
                                      currentPage = 1; // Reset to first page
                                      _scrollController.animateTo(
                                        0,
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.easeOut,
                                      );
                                    });
                                  },
                                ),
                              ),
                              const Spacer(),
                              Container(
                                width: 65,
                                height: 20,
                                child: Text(
                                  "Navigate",
                                  style: TextStyle(
                                    color: Color(0xFF005277),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              // Left Arrow
                              GestureDetector(
                                onTap: () {
                                  // Handle left arrow click (e.g., navigate left)
                                  if (currentPage > 1) {
                                    setState(() {
                                      currentPage--;
                                    });
                                    _scrollController.animateTo(
                                      0,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeOut,
                                    );
                                  }
                                },
                                child: Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey, width: 2),
                                    color: Colors.white,
                                  ),
                                  child: Icon(
                                    Icons.arrow_left,
                                    color: Color(0xFF005277),
                                    size: 20,
                                  ),
                                ),
                              ),

                              // Right Arrow
                              GestureDetector(
                                onTap: () {
                                  // Handle right arrow click (e.g., navigate right)
                                  if (currentPage < totalPages) {
                                    setState(() {
                                      currentPage++;
                                    });
                                    _scrollController.animateTo(
                                      0,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeOut,
                                    );
                                  }
                                },
                                child: Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey, width: 2),
                                    color: Colors.white,
                                  ),
                                  child: Icon(
                                    Icons.arrow_right,
                                    color: Color(0xFF005277),
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  achieveClientsOpened = !achieveClientsOpened;
                                  if (!achieveClientsOpened) {
                                    showMainClients = true;
                                  } else {
                                    showMainClients = false;
                                  }
                                  if (achieveClientsOpened) {
                                    if (_selectedFilteringValue != "5") {
                                      String? theSelected =
                                          _selectedFilteringValue;
                                      setState(() {
                                        _selectedFilteringValue =
                                            filteringAmounts.first;
                                        itemsPerPage = 5;
                                      });
                                      // Calculate the target offset (80% of the scrollable extent)
                                      print(theSelected);
                                      if (theSelected == "10") {
                                        final double targetOffset =
                                            _scrollController
                                                    .position.maxScrollExtent *
                                                0.5;
                                        _scrollController.animateTo(
                                          targetOffset,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.easeOut,
                                        );
                                      } else if (theSelected == "15") {
                                        final double targetOffset =
                                            _scrollController
                                                    .position.maxScrollExtent *
                                                0.35;
                                        _scrollController.animateTo(
                                          targetOffset,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.easeOut,
                                        );
                                      }
                                    } else {
                                      _scrollController.animateTo(
                                        _scrollController.position.pixels +
                                            100, // Adjust this value to scroll further down
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.easeOut,
                                      );
                                    }
                                  }
                                });
                              },
                              child: !achieveClientsOpened
                                  ? FittedBox(
                                      child: Image.asset(
                                        "assets/images/icons/showAchieve.png",
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : FittedBox(
                                      child: Image.asset(
                                        "assets/images/icons/hideArchieve.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                            ),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      achieveClientsOpened
                          ? Container(
                              width: double.infinity,
                              color: const Color(0xFF01B4D2).withOpacity(0.2),
                              child: Column(
                                children: [
                                  Divider(
                                    thickness: 2.0,
                                    indent: 10,
                                    endIndent: 10,
                                    color: Color(0xFF0047B3),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        right: 10.0,
                                      ),
                                      child: Text(
                                        "$displayRangeAchieved out of ${clientDataAchieved.length} achieved records",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  achieveClientsOpened
                                      ? Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 35.0,
                                          ),
                                          child: Column(
                                            children: [
                                              ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap:
                                                    true, // Allow ListView to adapt to its content
                                                physics:
                                                    ClampingScrollPhysics(),
                                                itemCount:
                                                    paginatedClientDataAchieved
                                                        .length,
                                                itemBuilder: (context, index) {
                                                  final clientAchieved =
                                                      paginatedClientDataAchieved[
                                                          index];
                                                  return Center(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        left: 16.0,
                                                        right: 16.0,
                                                        bottom: 10.0,
                                                      ),
                                                      child: AchievedClientCard(
                                                          client:
                                                              clientAchieved),
                                                    ),
                                                  );
                                                },
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 10.0,
                                                  right: 70,
                                                ),
                                                child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 30.0),
                                                        child: Text(
                                                          "Show",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF005277),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 100,
                                                        height: 28,
                                                        child:
                                                            DropdownButtonFormField<
                                                                String>(
                                                          focusColor:
                                                              Colors.white,
                                                          value:
                                                              _selectedFilteringValueAchieved,
                                                          decoration:
                                                              InputDecoration(
                                                            contentPadding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        8,
                                                                    vertical:
                                                                        4),
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0),
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .grey,
                                                                      width: 2),
                                                            ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0),
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .grey,
                                                                  width:
                                                                      2), // Border colo
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0),
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .grey,
                                                                  width:
                                                                      2), // Border color when focused
                                                            ),
                                                            fillColor: Colors
                                                                .white, // Set the background color to white
                                                            filled: true,
                                                            // Enable the fill color
                                                          ),
                                                          icon: Icon(
                                                              Icons
                                                                  .arrow_drop_down,
                                                              color:
                                                                  Colors.black),
                                                          items:
                                                              filteringAmountsArchieved
                                                                  .map((item) =>
                                                                      DropdownMenuItem(
                                                                        value:
                                                                            item,
                                                                        child:
                                                                            Text(
                                                                          item,
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                            color:
                                                                                Color(0xFF007AFF),
                                                                          ),
                                                                        ),
                                                                      ))
                                                                  .toList(),
                                                          onChanged: (value) {
                                                            setState(() {
                                                              _selectedFilteringValueAchieved =
                                                                  value;

                                                              itemsPerPageAchieved =
                                                                  int.parse(
                                                                      value!);
                                                              currentPageAchieved =
                                                                  1; // Reset to first page
                                                              if (_selectedFilteringValueAchieved ==
                                                                  "5") {
                                                                final double
                                                                    maxScrollExtent =
                                                                    _scrollController
                                                                        .position
                                                                        .maxScrollExtent;
                                                                final double
                                                                    targetOffset =
                                                                    maxScrollExtent *
                                                                        0.5; // Slightly more than half (60%).
                                                                // Use animateTo to smoothly scroll to the desired position.
                                                                _scrollController
                                                                    .animateTo(
                                                                  targetOffset,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          500),
                                                                  curve: Curves
                                                                      .easeInOut,
                                                                );
                                                              } else if (_selectedFilteringValueAchieved ==
                                                                  "10") {
                                                                print(
                                                                    "10 is here");
                                                                final double
                                                                    maxScrollExtent =
                                                                    _scrollController
                                                                        .position
                                                                        .maxScrollExtent;
                                                                final double
                                                                    targetOffset =
                                                                    maxScrollExtent *
                                                                        0.5; // Slightly more than half (60%).
                                                                // Use animateTo to smoothly scroll to the desired position.
                                                                _scrollController
                                                                    .animateTo(
                                                                  targetOffset,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          500),
                                                                  curve: Curves
                                                                      .easeInOut,
                                                                );
                                                              } else if (_selectedFilteringValueAchieved ==
                                                                  "15") {
                                                                final double
                                                                    maxScrollExtent =
                                                                    _scrollController
                                                                        .position
                                                                        .maxScrollExtent;
                                                                final double
                                                                    targetOffset =
                                                                    maxScrollExtent *
                                                                        0.55; // Slightly more than half (60%).
                                                                // Use animateTo to smoothly scroll to the desired position.
                                                                _scrollController
                                                                    .animateTo(
                                                                  targetOffset,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          500),
                                                                  curve: Curves
                                                                      .easeInOut,
                                                                );
                                                              }
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      Container(
                                                        width: 65,
                                                        height: 20,
                                                        child: Text(
                                                          "Navigate",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF005277),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      // Left Arrow
                                                      GestureDetector(
                                                        onTap: () {
                                                          // Handle left arrow click (e.g., navigate left)
                                                          if (currentPageAchieved >
                                                              1) {
                                                            setState(() {
                                                              currentPageAchieved--;
                                                            });
                                                            if (_selectedFilteringValueAchieved ==
                                                                "5") {
                                                              final double
                                                                  maxScrollExtent =
                                                                  _scrollController
                                                                      .position
                                                                      .maxScrollExtent;
                                                              final double
                                                                  targetOffset =
                                                                  maxScrollExtent *
                                                                      0.5; // Slightly more than half (60%).
                                                              // Use animateTo to smoothly scroll to the desired position.
                                                              _scrollController
                                                                  .animateTo(
                                                                targetOffset,
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        500),
                                                                curve: Curves
                                                                    .easeInOut,
                                                              );
                                                            } else if (_selectedFilteringValueAchieved ==
                                                                "10") {
                                                              print(
                                                                  "10 is here");
                                                              final double
                                                                  maxScrollExtent =
                                                                  _scrollController
                                                                      .position
                                                                      .maxScrollExtent;
                                                              final double
                                                                  targetOffset =
                                                                  maxScrollExtent *
                                                                      0.5; // Slightly more than half (60%).
                                                              // Use animateTo to smoothly scroll to the desired position.
                                                              _scrollController
                                                                  .animateTo(
                                                                targetOffset,
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        500),
                                                                curve: Curves
                                                                    .easeInOut,
                                                              );
                                                            } else if (_selectedFilteringValueAchieved ==
                                                                "15") {
                                                              final double
                                                                  maxScrollExtent =
                                                                  _scrollController
                                                                      .position
                                                                      .maxScrollExtent;
                                                              final double
                                                                  targetOffset =
                                                                  maxScrollExtent *
                                                                      0.3; // Slightly more than half (60%).
                                                              // Use animateTo to smoothly scroll to the desired position.
                                                              _scrollController
                                                                  .animateTo(
                                                                targetOffset,
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        500),
                                                                curve: Curves
                                                                    .easeInOut,
                                                              );
                                                            }
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 28,
                                                          height: 28,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                color:
                                                                    Colors.grey,
                                                                width: 2),
                                                            color: Colors.white,
                                                          ),
                                                          child: Icon(
                                                            Icons.arrow_left,
                                                            color: Color(
                                                                0xFF005277),
                                                            size: 20,
                                                          ),
                                                        ),
                                                      ),

                                                      // Right Arrow
                                                      GestureDetector(
                                                        onTap: () {
                                                          // Handle right arrow click (e.g., navigate right)
                                                          if (currentPageAchieved <
                                                              totalPagesAchieved) {
                                                            setState(() {
                                                              currentPageAchieved++;
                                                            });
                                                            if (_selectedFilteringValueAchieved ==
                                                                "5") {
                                                              print(
                                                                  "5 is here");
                                                              final double
                                                                  maxScrollExtent =
                                                                  _scrollController
                                                                      .position
                                                                      .maxScrollExtent;
                                                              final double
                                                                  targetOffset =
                                                                  maxScrollExtent *
                                                                      0.5; // Slightly more than half (60%).
                                                              // Use animateTo to smoothly scroll to the desired position.
                                                              _scrollController
                                                                  .animateTo(
                                                                targetOffset,
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        500),
                                                                curve: Curves
                                                                    .easeInOut,
                                                              );
                                                            } else if (_selectedFilteringValueAchieved ==
                                                                "10") {
                                                              print(
                                                                  "10 is here");
                                                              final double
                                                                  maxScrollExtent =
                                                                  _scrollController
                                                                      .position
                                                                      .maxScrollExtent;
                                                              final double
                                                                  targetOffset =
                                                                  maxScrollExtent *
                                                                      0.35; // Slightly more than half (60%).
                                                              // Use animateTo to smoothly scroll to the desired position.
                                                              _scrollController
                                                                  .animateTo(
                                                                targetOffset,
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        500),
                                                                curve: Curves
                                                                    .easeInOut,
                                                              );
                                                            } else if (_selectedFilteringValueAchieved ==
                                                                "15") {
                                                              final double
                                                                  maxScrollExtent =
                                                                  _scrollController
                                                                      .position
                                                                      .maxScrollExtent;
                                                              final double
                                                                  targetOffset =
                                                                  maxScrollExtent *
                                                                      0.3; // Slightly more than half (60%).
                                                              // Use animateTo to smoothly scroll to the desired position.
                                                              _scrollController
                                                                  .animateTo(
                                                                targetOffset,
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        500),
                                                                curve: Curves
                                                                    .easeInOut,
                                                              );
                                                            }
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 28,
                                                          height: 28,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                color:
                                                                    Colors.grey,
                                                                width: 2),
                                                            color: Colors.white,
                                                          ),
                                                          child: Icon(
                                                            Icons.arrow_right,
                                                            color: Color(
                                                                0xFF005277),
                                                            size: 20,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                            ],
                                          ),
                                        )
                                      : SizedBox(
                                          height: 2,
                                        ),
                                ],
                              ),
                            )
                          : SizedBox(
                              height: 40,
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
