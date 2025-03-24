import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../AppState/appState.dart';
import 'package:project_code_blue/sidemenu/sidemenu.dart';
import '../../Navigation/appBar.dart';

class DashboardHome extends StatefulWidget {
  const DashboardHome({super.key});

  @override
  State<DashboardHome> createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashboardHome> {
  final ScrollController _scrollController = ScrollController();
  DateTime? _selectedSummaryDate;
  bool isAtBottom = false; // Track whether the scroll is at the bottom
  TextEditingController _dashboardSummaryDateController =
      TextEditingController();
  String? _selectedLocation;
  @override
  void initState() {
    super.initState();
    //_selectedLocation = locationFilter.first;
    //_selectedClient = clients.first;
    //_selectedStatus = status.first;
    //_selectedFilteringValue = filteringAmounts.first;
    //_selectedFilteringValueAchieved = filteringAmountsArchieved.first;
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

    _selectedLocation = locationFilter.first;

    _scrollController.addListener(() {
      if (_scrollController.position.pixels < 680) {
        setState(() {
          //showMainJobs = true;
          //archieveJobsOpened = false;
        });
      }
    });
  }

  final List<String> locationFilter = [
    "All",
    "Specific Location",
  ];

  // Function to show the date picker
  Future<void> _selectDashboardDate(BuildContext context) async {
    DateTime initialDate = _selectedSummaryDate ?? DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.blue, // Header background color
              onPrimary: Colors.white, // Header text color
              onSurface: Colors.black, // Text color in the calendar
              surface: Color(0xFF01B4D2), // Background color for the dialog
            ),
            dialogBackgroundColor: Colors.yellow,
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor:
                    Colors.black, // Color for OK and Cancel buttons
              ),
            ), // Dialog background color
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedSummaryDate) {
      setState(() {
        _selectedSummaryDate = picked;
        _dashboardSummaryDateController.text =
            "${picked.day}/${picked.month}/${picked.year}"; // Display the selected date
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
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
      body: Scrollbar(
        thumbVisibility: true,
        interactive: true,
        trackVisibility: true,
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(children: [
            SizedBox(
              height: kToolbarHeight + MediaQuery.of(context).padding.top + 11,
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
                          "Dashboard / Dashboard Home",
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
                          "Dashboard Home",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 20,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Daily Summary",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Divider(
                        color: Colors.black,
                        thickness: 1,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 80.0),
                                child: Text(
                                  "Date",
                                  style: TextStyle(
                                    color: Color(0xFF005277),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                width: 190,
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
                                child: TextField(
                                  controller: _dashboardSummaryDateController,
                                  readOnly: true,
                                  onTap: () => _selectDashboardDate(context),
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
                                          width:
                                              3), // Border color when enabled
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width:
                                              3), // Border color when focused
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText:
                                        'Select the date', // Placeholder text
                                    hintStyle: TextStyle(
                                      color: Color(0xFF007AFF),
                                    ), // Style for the hint text
                                  ),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF007AFF),
                                  ), // Text style for the input text
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            right: 8.0,
                            top: 10.0,
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 52.0),
                                child: Text(
                                  "Location",
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
                                  value: _selectedLocation,
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
                                          width:
                                              2), // Border color when focused
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
                                  items: locationFilter
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
                                      _selectedLocation = value;
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
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Tests",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Divider(
                        color: Colors.black,
                        thickness: 1,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
