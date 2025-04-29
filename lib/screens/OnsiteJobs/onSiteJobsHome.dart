import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:project_code_blue/ColorSchemas/AppColors.dart';
import 'package:project_code_blue/screens/OnsiteJobs/Controller/Feature/jobs_notifier.dart';
import 'package:project_code_blue/screens/OnsiteJobs/Controller/Feature/utils/dialogs.dart';
import 'package:project_code_blue/screens/OnsiteJobs/Controller/Feature/utils/enums.dart';
import 'package:project_code_blue/screens/OnsiteJobs/Data/onSiteJobsData.dart';
import 'package:project_code_blue/screens/OnsiteJobs/achievedJobsCard.dart';
import 'package:project_code_blue/screens/OnsiteJobs/NewCalloutJob/Main/newCalloutJob.dart';
import 'package:project_code_blue/screens/OnsiteJobs/NewOnsiteJob/Main/newOnsiteJob.dart';
import 'package:project_code_blue/screens/OnsiteJobs/onSiteJobCard.dart';
import 'package:provider/provider.dart';
import '../../AppState/appState.dart';
import 'package:project_code_blue/sidemenu/sidemenu.dart';
import '../../Navigation/appBar.dart';
import 'package:flutter/services.dart';

class OnsiteJobsHome extends StatefulWidget {
  const OnsiteJobsHome({super.key});

  @override
  State<OnsiteJobsHome> createState() => _onSiteJobsHomeState();
}

class _onSiteJobsHomeState extends State<OnsiteJobsHome> {
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController =
      TextEditingController(); // Controller for the text field
  final ScrollController _scrollController = ScrollController();
  bool isAtBottom = false; // Track whether the scroll is at the bottom
  bool isAtMiddle = false;
  DateTime? _selectedStartDate;
  DateTime? _selectedEndDate;
  final List<String> items = [
    "All",
    "Newcastle City",
    "Sydney Office",
    "Melbourne Branch",
  ]; // Example items list
  String? _selectedValue;

  final List<String> clients = [
    "All",
    "New Castle City Council",
    "Wollongong City Council",
    "Transport for New South Wales",
  ]; // Example items list
  String? _selectedClient;

  int currentPage = 1; // Tracks the current page
  int itemsPerPage = 5; // Default items per page

  int currentPageAchieved = 1; // Tracks the current page
  int itemsPerPageAchieved = 5; // Default items per page

  // Filtered jobs to display based on pagination
  List<Map<String, dynamic>> get paginatedJobData {
    int startIndex = (currentPage - 1) * itemsPerPage;
    int endIndex = startIndex + itemsPerPage;
    endIndex = endIndex > jobData.length ? jobData.length : endIndex;
    return jobData.sublist(startIndex, endIndex);
  }

  // Filtered achieved jobs to display based on pagination
  List<Map<String, dynamic>> get paginatedJobDataAchieved {
    int startIndexAchieved = (currentPageAchieved - 1) * itemsPerPageAchieved;
    int endIndexAchieved = startIndexAchieved + itemsPerPageAchieved;
    endIndexAchieved = endIndexAchieved > jobDataAchieved.length
        ? jobDataAchieved.length
        : endIndexAchieved;
    return jobData.sublist(startIndexAchieved, endIndexAchieved);
  }

  int get totalPages => (jobData.length / itemsPerPage).ceil();

  final List<String> status = ["Show", "Hide"];
  final List<String> filteringAmounts = ["5", "10", "15"];
  final List<String> filteringAmountsArchieved = ["5", "10", "15"];
  List<Map<String, dynamic>> jobData = [];

  int get totalPagesAchieved =>
      (jobDataAchieved.length / itemsPerPageAchieved).ceil();

  final List<Map<String, String>> jobDataAchieved =
      OnsiteJobsData().onSiteJobsAchievedData;

  String? _selectedStatus; // State variable for selected value
  String? _selectedFilteringValue; // State variable for selected value

  String? _selectedFilteringValueAchieved; // State variable for selected value

/*   int currentPage = 1; // Track the current page
  int totalPages = 3; // Total number of pages
  int recordsPerPage = 15; // Number of records per page
  int totalRecords = 100; // Total number of records */

  bool archieveJobsOpened = false;
  bool showMainJobs = true;

  var isVisible = true;

  String get displayRange {
    int start = ((currentPage - 1) * itemsPerPage) + 1;
    int end = currentPage * itemsPerPage;
    end = end > jobData.length ? jobData.length : end;
    return "$start - $end";
  }

  String get displayRangeAchieved {
    int start = ((currentPageAchieved - 1) * itemsPerPageAchieved) + 1;
    int end = currentPageAchieved * itemsPerPageAchieved;
    end = end > jobDataAchieved.length ? jobDataAchieved.length : end;
    return "$start - $end";
  }

  @override
  void initState() {
    print("yes onsite jobs called");
    super.initState();
    _selectedValue = items.first;
    _selectedClient = clients.first;
    _selectedStatus = status.first;
    _selectedFilteringValue = filteringAmounts.first;
    _selectedFilteringValueAchieved = filteringAmountsArchieved.first;
    // Initialize selected value

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final appState = Provider.of<AppState>(context, listen: false);
      if (appState.isOnsiteJobsOpen) {
        final jobsState = Provider.of<JobsNotifier>(context, listen: false);
        context.loaderOverlay.show();
        isVisible = context.loaderOverlay.visible;
        final jobs = await jobsState.getJobs(); // <-- Fetch data here

        setState(() {
          jobData = jobs.map((job) => job.toJson()).toList();
          context.loaderOverlay.hide();
          isVisible = context.loaderOverlay.visible;
        });
      }
    });

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
          showMainJobs = true;
          archieveJobsOpened = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose(); // Dispose the controller when done
    _scrollController.dispose();
    super.dispose();
  }

  // Function to show the date picker
  Future<void> _selectStartDate(BuildContext context) async {
    DateTime initialDate = _selectedStartDate ?? DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            colorScheme: const ColorScheme.highContrastLight(
              primary: Color(0xFF01B4D2),
            ),
            datePickerTheme: const DatePickerThemeData(
              backgroundColor: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedStartDate) {
      setState(() {
        _selectedStartDate = picked;
        _startDateController.text =
            "${picked.day}/${picked.month}/${picked.year}"; // Display the selected date
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    if (_selectedStartDate == null) {
      // If no Start Date is selected, show an alert or prompt
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: const Text("Start Date Required"),
            content: const Text(
                "Please select a Start Date before choosing an End Date."),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
      return; // Exit the function if Start Date is not selected
    }
    DateTime initialDate = (_selectedStartDate != null)
        ? _selectedStartDate!.add(const Duration(days: 1))
        : DateTime(2000); // Safe null fallback
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: (_selectedStartDate != null)
          ? _selectedStartDate!.add(const Duration(days: 1))
          : DateTime(2000), // Safe null fallback
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            colorScheme: const ColorScheme.highContrastLight(
              primary: Color(0xFF01B4D2),
            ),
            datePickerTheme: const DatePickerThemeData(
              backgroundColor: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedEndDate) {
      setState(() {
        _selectedEndDate = picked;
        _endDateController.text =
            "${picked.day}/${picked.month}/${picked.year}"; // Display the selected date
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    // Helper method for each row

    return Scaffold(
      backgroundColor: AppColors.appWideBackground,
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
              heroTag: "onSiteJobsHome",
              backgroundColor:
                  AppColors.floatingActionBarColor.withOpacity(0.6),
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
                  color: AppColors.headerColor,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              "Home / Onsite Jobs",
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
                              "Onsite Jobs",
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
                                              child: NewOnsiteJob(
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
                                              child: NewOnsiteJob(
                                                  scrollController:
                                                      scrollController),
                                            );
                                          },
                                        );
                                      },
                                    );
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
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 18.0,
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              if (Platform.isAndroid || Platform.isIOS) {
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
                                          ScrollController scrollController) {
                                        return Container(
                                          width: double.infinity,
                                          decoration: const BoxDecoration(
                                            color: Color(
                                                0xFFEDEEF0), // Background color of the bottom sheet
                                            borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(
                                                  0), // Rounded top corners
                                            ),
                                          ),
                                          child: NewCalloutJob(
                                            scrollController: scrollController,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              }
                            },
                            child: ClipRRect(
                              child: Image.asset(
                                "assets/images/icons/newCalloutOpen.png",
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
                Container(
                  width: double.infinity,
                  height: 130,
                  color: AppColors.appWideBackground.withOpacity(1),
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
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Text(
                                "Service Office",
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
                                value: _selectedValue,
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
                                items: items
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
                                    _selectedValue = value;
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
                              padding: const EdgeInsets.only(right: 72.0),
                              child: Text(
                                "Client",
                                style: TextStyle(
                                  color: Color(0xFF005277),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              width: 260,
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
                                focusColor: Colors.white,
                                value: _selectedClient,
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
                                  // Enable the fill color
                                ),
                                icon: Icon(
                                  Icons.arrow_drop_down_outlined,
                                  color: Color(
                                    0xFF71717A,
                                  ),
                                ),
                                items: clients
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
                                    _selectedClient = value;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              height: 5,
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
                              width: 100,
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
                                controller: _startDateController,
                                readOnly: true,
                                onTap: () => _selectStartDate(context),
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
                                  hintText: 'Start', // Placeholder text
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
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Container(
                                width: 100,
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
                                  controller: _endDateController,
                                  readOnly: true,
                                  onTap: () => _selectEndDate(context),
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
                                    hintText: 'Ends', // Placeholder text
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
                            )
                          ],
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
                !isVisible
                    ? Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                            padding: const EdgeInsets.only(
                              right: 18.0,
                              bottom: 5.0,
                            ),
                            child: showMainJobs
                                ? Text(
                                    "$displayRange out of ${jobData.length} records",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : null),
                      )
                    : SizedBox(
                        height: 0,
                      ),
                !isVisible
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 70.0),
                        child: Column(
                          children: [
                            Consumer<JobsNotifier>(
                              builder: (context, jobsNotifier, child) {
                                if (jobsNotifier.uiState == UiState.loading) {
                                  print('yes loading called');
                                  /* return const Center(
                                child: CircularProgressIndicator()); */
                                }
                                if (jobsNotifier.uiState == UiState.error) {
                                  DialogHelper.showError(
                                    context: context,
                                    title: "Jobs",
                                    message: jobsNotifier.errorMessage ??
                                        "An error occurred",
                                  );
                                  return const SizedBox
                                      .shrink(); // Return an empty widget
                                }
                                if (jobsNotifier.uiState == UiState.success) {
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    physics: const ClampingScrollPhysics(),
                                    itemCount: paginatedJobData.length,
                                    itemBuilder: (context, index) {
                                      final job = paginatedJobData[index];
                                      print(job["bookingInfo"]);
                                      return Center(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 16.0,
                                            right: 16.0,
                                            bottom: 10.0,
                                          ),
                                          child: OnsiteJobCard(job: job),
                                        ),
                                      );
                                    },
                                  );
                                }
                                return const SizedBox
                                    .shrink(); // Default return statement
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
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 30.0),
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
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 8, vertical: 4),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(0),
                                            borderSide: BorderSide(
                                                color: Colors.grey, width: 2),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(0),
                                            borderSide: BorderSide(
                                                color: Colors.grey,
                                                width: 2), // Border colo
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(0),
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
                                            currentPage =
                                                1; // Reset to first page
                                            _scrollController.animateTo(
                                              0,
                                              duration:
                                                  Duration(milliseconds: 500),
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
                                            duration:
                                                Duration(milliseconds: 500),
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

                                    SizedBox(
                                      width: 10,
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
                                            duration:
                                                Duration(milliseconds: 500),
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
                                        archieveJobsOpened =
                                            !archieveJobsOpened;
                                        if (!archieveJobsOpened) {
                                          showMainJobs = true;
                                        } else {
                                          showMainJobs = false;
                                        }
                                        if (archieveJobsOpened) {
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
                                                  _scrollController.position
                                                          .maxScrollExtent *
                                                      0.5;
                                              _scrollController.animateTo(
                                                targetOffset,
                                                duration:
                                                    Duration(milliseconds: 500),
                                                curve: Curves.easeOut,
                                              );
                                            } else if (theSelected == "15") {
                                              final double targetOffset =
                                                  _scrollController.position
                                                          .maxScrollExtent *
                                                      0.35;
                                              _scrollController.animateTo(
                                                targetOffset,
                                                duration:
                                                    Duration(milliseconds: 500),
                                                curve: Curves.easeOut,
                                              );
                                            }
                                          } else {
                                            _scrollController.animateTo(
                                              _scrollController
                                                      .position.pixels +
                                                  100, // Adjust this value to scroll further down
                                              duration:
                                                  Duration(milliseconds: 500),
                                              curve: Curves.easeOut,
                                            );
                                          }
                                        }
                                      });
                                    },
                                    child: !archieveJobsOpened
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
                            archieveJobsOpened
                                ? Container(
                                    width: double.infinity,
                                    color: const Color(0xFF01B4D2)
                                        .withOpacity(0.2),
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
                                              "$displayRangeAchieved out of ${jobDataAchieved.length} achieved records",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        archieveJobsOpened
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
                                                          paginatedJobDataAchieved
                                                              .length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        final job =
                                                            paginatedJobDataAchieved[
                                                                index];
                                                        return Center(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                              left: 16.0,
                                                              right: 16.0,
                                                              bottom: 10.0,
                                                            ),
                                                            child:
                                                                AchievedJobsCard(
                                                                    job: job),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        left: 10.0,
                                                        right: 70,
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      right:
                                                                          30.0),
                                                              child: Text(
                                                                "Show",
                                                                style:
                                                                    TextStyle(
                                                                  color: Color(
                                                                      0xFF005277),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
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
                                                                    Colors
                                                                        .white,
                                                                value:
                                                                    _selectedFilteringValueAchieved,
                                                                decoration:
                                                                    InputDecoration(
                                                                  contentPadding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          8,
                                                                      vertical:
                                                                          4),
                                                                  border:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(0),
                                                                    borderSide: BorderSide(
                                                                        color: Colors
                                                                            .grey,
                                                                        width:
                                                                            2),
                                                                  ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(0),
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
                                                                            .circular(0),
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
                                                                    color: Colors
                                                                        .black),
                                                                items:
                                                                    filteringAmountsArchieved
                                                                        .map((item) =>
                                                                            DropdownMenuItem(
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
                                                                onChanged:
                                                                    (value) {
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
                                                                        duration:
                                                                            Duration(milliseconds: 500),
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
                                                                        duration:
                                                                            Duration(milliseconds: 500),
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
                                                                        duration:
                                                                            Duration(milliseconds: 500),
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
                                                                style:
                                                                    TextStyle(
                                                                  color: Color(
                                                                      0xFF005277),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
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
                                                                      color: Colors
                                                                          .grey,
                                                                      width: 2),
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                                child: Icon(
                                                                  Icons
                                                                      .arrow_left,
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
                                                                      color: Colors
                                                                          .grey,
                                                                      width: 2),
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                                child: Icon(
                                                                  Icons
                                                                      .arrow_right,
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
                      )
                    : SizedBox(
                        height: 0,
                      ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
