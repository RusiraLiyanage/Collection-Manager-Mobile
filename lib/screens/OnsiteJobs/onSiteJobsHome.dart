import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:project_code_blue/screens/OnsiteJobs/newJobAndroid.dart';
import 'package:project_code_blue/screens/OnsiteJobs/newJobIOS.dart';
import 'package:provider/provider.dart';
import '../../AppState/appState.dart';
import 'package:project_code_blue/sidemenu/sidemenu.dart';
import '../../Navigation/appBar.dart';
import 'package:number_pagination/number_pagination.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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
    "Newcastle City",
    "Sydney Office",
    "Melbourne Branch",
  ]; // Example items list
  String? _selectedValue;

  final List<String> clients = [
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
  List<Map<String, String>> get paginatedJobData {
    int startIndex = (currentPage - 1) * itemsPerPage;
    int endIndex = startIndex + itemsPerPage;
    endIndex = endIndex > jobData.length ? jobData.length : endIndex;
    return jobData.sublist(startIndex, endIndex);
  }

  // Filtered achieved jobs to display based on pagination
  List<Map<String, String>> get paginatedJobDataAchieved {
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
  final List<Map<String, String>> jobData = [
    {
      "jobNumber": "1",
      "jobStatus": "Draft",
      "dateTime": "30 Apr 2025 10:00",
      "client": "Rail NSW",
      "rep": "John Roberts",
      "location": "Parramatta",
      "service": "Random Testing",
      "callout": "Callout",
    },
    {
      "jobNumber": "2",
      "jobStatus": "Draft",
      "dateTime": "30 Apr 2025 10:00",
      "client": "Rail NSW",
      "rep": "John Roberts",
      "location": "Parramatta",
      "service": "Random Testing",
      "callout": "Callout",
    },
    {
      "jobNumber": "3",
      "jobStatus": "Draft",
      "dateTime": "30 Apr 2025 10:00",
      "client": "Rail NSW",
      "rep": "John Roberts",
      "location": "Parramatta",
      "service": "Random Testing",
      "callout": "Non Callout",
    },
    {
      "jobNumber": "4",
      "jobStatus": "Draft",
      "dateTime": "30 Apr 2025 10:00",
      "client": "Rail NSW",
      "rep": "John Roberts",
      "location": "Parramatta",
      "service": "Random Testing",
      "callout": "Non Callout",
    },
    {
      "jobNumber": "5",
      "jobStatus": "Draft",
      "dateTime": "30 Apr 2025 10:00",
      "client": "Rail NSW",
      "rep": "John Roberts",
      "location": "Parramatta",
      "service": "Random Testing",
      "callout": "Non Callout",
    },
    {
      "jobNumber": "6",
      "jobStatus": "Draft",
      "dateTime": "30 Apr 2025 10:00",
      "client": "Rail NSW",
      "rep": "John Roberts",
      "location": "Parramatta",
      "service": "Random Testing",
      "callout": "Non Callout",
    },
    {
      "jobNumber": "7",
      "jobStatus": "Draft",
      "dateTime": "30 Apr 2025 10:00",
      "client": "Rail NSW",
      "rep": "John Roberts",
      "location": "Parramatta",
      "service": "Random Testing",
      "callout": "Non Callout",
    },
    {
      "jobNumber": "8",
      "jobStatus": "Draft",
      "dateTime": "30 Apr 2025 10:00",
      "client": "Rail NSW",
      "rep": "John Roberts",
      "location": "Parramatta",
      "service": "Random Testing",
      "callout": "Non Callout",
    },
    {
      "jobNumber": "9",
      "jobStatus": "Draft",
      "dateTime": "30 Apr 2025 10:00",
      "client": "Rail NSW",
      "rep": "John Roberts",
      "location": "Parramatta",
      "service": "Random Testing",
      "callout": "Non Callout",
    },
    {
      "jobNumber": "10",
      "jobStatus": "Draft",
      "dateTime": "30 Apr 2025 10:00",
      "client": "Rail NSW",
      "rep": "John Roberts",
      "location": "Parramatta",
      "service": "Random Testing",
      "callout": "Non Callout",
    },
    {
      "jobNumber": "11",
      "jobStatus": "Draft",
      "dateTime": "30 Apr 2025 10:00",
      "client": "Rail NSW",
      "rep": "John Roberts",
      "location": "Parramatta",
      "service": "Random Testing",
      "callout": "Callout",
    },
    {
      "jobNumber": "12",
      "jobStatus": "Draft",
      "dateTime": "30 Apr 2025 10:00",
      "client": "Rail NSW",
      "rep": "John Roberts",
      "location": "Parramatta",
      "service": "Random Testing",
      "callout": "Callout",
    },
    {
      "jobNumber": "13",
      "jobStatus": "Draft",
      "dateTime": "30 Apr 2025 10:00",
      "client": "Rail NSW",
      "rep": "John Roberts",
      "location": "Parramatta",
      "service": "Random Testing",
      "callout": "Non Callout",
    },
    {
      "jobNumber": "14",
      "jobStatus": "Draft",
      "dateTime": "30 Apr 2025 10:00",
      "client": "Rail NSW",
      "rep": "John Roberts",
      "location": "Parramatta",
      "service": "Random Testing",
      "callout": "Non Callout",
    },
    {
      "jobNumber": "15",
      "jobStatus": "Draft",
      "dateTime": "30 Apr 2025 10:00",
      "client": "Rail NSW",
      "rep": "John Roberts",
      "location": "Parramatta",
      "service": "Random Testing",
      "callout": "Non Callout",
    },
    {
      "jobNumber": "16",
      "jobStatus": "Draft",
      "dateTime": "30 Apr 2025 10:00",
      "client": "Rail NSW",
      "rep": "John Roberts",
      "location": "Parramatta",
      "service": "Random Testing",
      "callout": "Non Callout",
    },
    {
      "jobNumber": "17",
      "jobStatus": "Draft",
      "dateTime": "30 Apr 2025 10:00",
      "client": "Rail NSW",
      "rep": "John Roberts",
      "location": "Parramatta",
      "service": "Random Testing",
      "callout": "Non Callout",
    },
    {
      "jobNumber": "18",
      "jobStatus": "Draft",
      "dateTime": "30 Apr 2025 10:00",
      "client": "Rail NSW",
      "rep": "John Roberts",
      "location": "Parramatta",
      "service": "Random Testing",
      "callout": "Non Callout",
    },
    {
      "jobNumber": "19",
      "jobStatus": "Draft",
      "dateTime": "30 Apr 2025 10:00",
      "client": "Rail NSW",
      "rep": "John Roberts",
      "location": "Parramatta",
      "service": "Random Testing",
      "callout": "Non Callout",
    },
    {
      "jobNumber": "20",
      "jobStatus": "Draft",
      "dateTime": "30 Apr 2025 10:00",
      "client": "Rail NSW",
      "rep": "John Roberts",
      "location": "Parramatta",
      "service": "Random Testing",
      "callout": "Non Callout",
    },
  ];

  int get totalPagesAchieved =>
      (jobDataAchieved.length / itemsPerPageAchieved).ceil();

  final List<Map<String, String>> jobDataAchieved = [
    {
      "jobNumber": "1",
      "jobStatus": "Draft",
      "dateTime": "30 Apr 2025 10:00",
      "client": "Rail NSW",
      "rep": "John Roberts",
      "location": "Parramatta",
      "service": "Random Testing",
      "callout": "Callout",
    },
    {
      "jobNumber": "2",
      "jobStatus": "Draft",
      "dateTime": "30 Apr 2025 10:00",
      "client": "Rail NSW",
      "rep": "John Roberts",
      "location": "Parramatta",
      "service": "Random Testing",
      "callout": "Callout",
    },
    {
      "jobNumber": "3",
      "jobStatus": "Draft",
      "dateTime": "30 Apr 2025 10:00",
      "client": "Rail NSW",
      "rep": "John Roberts",
      "location": "Parramatta",
      "service": "Random Testing",
      "callout": "Non Callout",
    },
    {
      "jobNumber": "4",
      "jobStatus": "Draft",
      "dateTime": "30 Apr 2025 10:00",
      "client": "Rail NSW",
      "rep": "John Roberts",
      "location": "Parramatta",
      "service": "Random Testing",
      "callout": "Non Callout",
    },
    {
      "jobNumber": "5",
      "jobStatus": "Draft",
      "dateTime": "30 Apr 2025 10:00",
      "client": "Rail NSW",
      "rep": "John Roberts",
      "location": "Parramatta",
      "service": "Random Testing",
      "callout": "Non Callout",
    },
    {
      "jobNumber": "6",
      "jobStatus": "Draft",
      "dateTime": "30 Apr 2025 10:00",
      "client": "Rail NSW",
      "rep": "John Roberts",
      "location": "Parramatta",
      "service": "Random Testing",
      "callout": "Non Callout",
    },
    {
      "jobNumber": "7",
      "jobStatus": "Draft",
      "dateTime": "30 Apr 2025 10:00",
      "client": "Rail NSW",
      "rep": "John Roberts",
      "location": "Parramatta",
      "service": "Random Testing",
      "callout": "Non Callout",
    },
    {
      "jobNumber": "8",
      "jobStatus": "Draft",
      "dateTime": "30 Apr 2025 10:00",
      "client": "Rail NSW",
      "rep": "John Roberts",
      "location": "Parramatta",
      "service": "Random Testing",
      "callout": "Non Callout",
    },
    {
      "jobNumber": "9",
      "jobStatus": "Draft",
      "dateTime": "30 Apr 2025 10:00",
      "client": "Rail NSW",
      "rep": "John Roberts",
      "location": "Parramatta",
      "service": "Random Testing",
      "callout": "Non Callout",
    },
    {
      "jobNumber": "10",
      "jobStatus": "Draft",
      "dateTime": "30 Apr 2025 10:00",
      "client": "Rail NSW",
      "rep": "John Roberts",
      "location": "Parramatta",
      "service": "Random Testing",
      "callout": "Non Callout",
    },
    {
      "jobNumber": "11",
      "jobStatus": "Draft",
      "dateTime": "30 Apr 2025 10:00",
      "client": "Rail NSW",
      "rep": "John Roberts",
      "location": "Parramatta",
      "service": "Random Testing",
      "callout": "Callout",
    },
    {
      "jobNumber": "12",
      "jobStatus": "Draft",
      "dateTime": "30 Apr 2025 10:00",
      "client": "Rail NSW",
      "rep": "John Roberts",
      "location": "Parramatta",
      "service": "Random Testing",
      "callout": "Callout",
    },
    {
      "jobNumber": "13",
      "jobStatus": "Draft",
      "dateTime": "30 Apr 2025 10:00",
      "client": "Rail NSW",
      "rep": "John Roberts",
      "location": "Parramatta",
      "service": "Random Testing",
      "callout": "Non Callout",
    },
    {
      "jobNumber": "14",
      "jobStatus": "Draft",
      "dateTime": "30 Apr 2025 10:00",
      "client": "Rail NSW",
      "rep": "John Roberts",
      "location": "Parramatta",
      "service": "Random Testing",
      "callout": "Non Callout",
    },
    {
      "jobNumber": "15",
      "jobStatus": "Draft",
      "dateTime": "30 Apr 2025 10:00",
      "client": "Rail NSW",
      "rep": "John Roberts",
      "location": "Parramatta",
      "service": "Random Testing",
      "callout": "Non Callout",
    }
  ];

  String? _selectedStatus; // State variable for selected value
  String? _selectedFilteringValue; // State variable for selected value

  String? _selectedFilteringValueAchieved; // State variable for selected value

/*   int currentPage = 1; // Track the current page
  int totalPages = 3; // Total number of pages
  int recordsPerPage = 15; // Number of records per page
  int totalRecords = 100; // Total number of records */

  bool archieveJobsOpened = false;
  bool showMainJobs = true;

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
    super.initState();
    _selectedValue = items.first;
    _selectedClient = clients.first;
    _selectedStatus = status.first;
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
    Widget _buildInfoRow({
      required String iconPath,
      required String title,
      required String value,
      bool isBold = false,
    }) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Left-aligned title
            Expanded(
              flex: 3, // Adjust the flex value to control space distribution
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF01B4D2),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),

            // Center-aligned icon
            Expanded(
              flex: 1, // Adjust the flex value to control space distribution
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(iconPath, height: 24),
              ),
            ),

            // Right-aligned value
            Expanded(
              flex: 4, // Adjust the flex value to control space distribution
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  value,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      onDrawerChanged: (isOpen) {
        appState.setDrawerState(isOpen); // Update global drawer state
      },
      drawer: SideMenu(
        navigationType: "bottomNavigation",
      ),
      appBar: MyAppBar(),
      floatingActionButton: Container(
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
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            color: Color(0xFFD9D9D9),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                      child: Container(
                        color: Color(0xFF56ACB1),
                        width: 168,
                        height: 42,
                        child: Row(
                          children: [
                            Image.asset("assets/images/icons/onSiteJobs.png"),
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 10,
                              ),
                              child: Text(
                                "On-site Jobs",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight
                                        .bold // Set the text size in logical pixels
                                    ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {
                          print("On tapped");
                        },
                        child: ClipRRect(
                          child: Image.asset(
                              "assets/images/icons/refresh_icon.png"),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 135.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: InkWell(
                          onTap: () {
                            if (Platform.isAndroid) {
                              showModalBottomSheet<void>(
                                isScrollControlled:
                                    true, // Allows controlling the height
                                isDismissible: false,
                                context: context,
                                builder: (BuildContext context) {
                                  return DraggableScrollableSheet(
                                    expand: false,
                                    initialChildSize:
                                        0.93, // Initial height of the sheet (93% of the screen)
                                    minChildSize:
                                        0.93, // Allow shrinking to 50% of the screen
                                    maxChildSize:
                                        0.93, // Prevent expansion above 93% of the screen
                                    builder: (BuildContext context,
                                        ScrollController scrollController) {
                                      return Container(
                                        width: double.infinity,
                                        decoration: const BoxDecoration(
                                          color: Colors
                                              .white, // Background color of the bottom sheet
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(
                                                16), // Rounded top corners
                                          ),
                                        ),
                                        child: NewJobAndroid(
                                            scrollController: scrollController),
                                      );
                                    },
                                  );
                                },
                              );
                            } else if (Platform.isIOS) {
                              showCupertinoModalBottomSheet(
                                transitionBackgroundColor: Colors.transparent,
                                enableDrag: false,
                                isDismissible: false,
                                expand: true,
                                context: context,
                                backgroundColor: Colors.transparent,
                                builder: (context) => DraggableScrollableSheet(
                                  initialChildSize:
                                      0.985, // Sets the initial size to 50% of the screen
                                  minChildSize:
                                      0.985, // Minimum size (30% of the screen)
                                  maxChildSize:
                                      0.985, // Maximum size (80% of the screen)
                                  builder: (context, scrollController) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(40),
                                        ),
                                      ),
                                      child: Container(
                                        child: const NewJob(),
                                      ),
                                    );
                                  },
                                ),
                              );
                            }
                          },
                          child: ClipRRect(
                            child: Image.asset(
                                "assets/images/icons/newJob_icon.png"),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          print("On tapped");
                        },
                        child: ClipRRect(
                          child: Image.asset(
                              "assets/images/icons/newCallOutJob_icon.png"),
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
            height: 200,
            color: Color(0xFF01B4D2).withOpacity(0.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                  child: Text(
                    "Filters",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Divider(
                    color: Color(0xFF0047B3),
                    thickness: 2,
                  ),
                ),
                SizedBox(
                  width: 3,
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
                        child: DropdownButtonFormField<String>(
                          value: _selectedValue,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  color: Colors.grey, width: 2), // Border colo
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 2), // Border color when focused
                            ),
                            fillColor: Colors
                                .white, // Set the background color to white
                            filled: true,
                          ),
                          icon:
                              Icon(Icons.arrow_drop_down, color: Colors.black),
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
                        padding: const EdgeInsets.only(right: 66.0),
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
                        child: DropdownButtonFormField<String>(
                          focusColor: Colors.white,
                          value: _selectedClient,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  color: Colors.grey, width: 2), // Border colo
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 2), // Border color when focused
                            ),
                            fillColor: Colors
                                .white, // Set the background color to white
                            filled: true,
                            // Enable the fill color
                          ),
                          icon:
                              Icon(Icons.arrow_drop_down, color: Colors.black),
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
                        padding: const EdgeInsets.only(right: 75.0),
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
                                  color: Colors.grey,
                                  width: 2), // Default border with thickness
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 3), // Border color when enabled
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  color: Colors.grey,
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
                                    color: Colors.grey,
                                    width: 2), // Default border with thickness
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 3), // Border color when enabled
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 3), // Border color when focused
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
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 63.0),
                        child: Text(
                          "Status",
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
                          value: _selectedStatus,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  color: Colors.grey, width: 2), // Border colo
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 2), // Border color when focused
                            ),
                            fillColor: Colors
                                .white, // Set the background color to white
                            filled: true,
                            // Enable the fill color
                          ),
                          icon:
                              Icon(Icons.arrow_drop_down, color: Colors.black),
                          items: status
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
                              _selectedStatus = value;
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
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
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
          ),
          Expanded(
            child: Scrollbar(
              thumbVisibility: true,
              interactive: true,
              trackVisibility: true,
              controller: _scrollController,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: paginatedJobData.length,
                      itemBuilder: (context, index) {
                        final job = paginatedJobData[index];
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 30.0,
                              right: 45.0,
                              bottom: 10.0,
                            ),
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 12.0,
                                  bottom: 12.0,
                                  left: 18.0,
                                  right: 25.0,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        // Left-aligned title
                                        Expanded(
                                          flex:
                                              3, // Adjust the flex value to control space distribution
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Row(
                                              children: [
                                                FittedBox(
                                                  child: Image.asset(
                                                    "assets/images/icons/threeDots.png",
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0),
                                                  child: FittedBox(
                                                    child: Image.asset(
                                                      "assets/images/icons/eye_icon.png",
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),

                                        // Center-aligned icon
                                        Expanded(
                                          flex:
                                              5, // Adjust the flex value to control space distribution
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Row(
                                              children: [
                                                Text("Job Status"),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 3,
                                                      vertical: 10),
                                                  decoration: BoxDecoration(
                                                    color: Colors.amber,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.5),
                                                        spreadRadius: 1,
                                                        blurRadius: 4,
                                                      ),
                                                    ],
                                                  ),
                                                  child: const Text(
                                                    'Draft',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),

                                        // Right-aligned value
                                        Expanded(
                                          flex:
                                              3, // Adjust the flex value to control space distribution
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                FittedBox(
                                                  child: Image.asset(
                                                    'assets/images/icons/document_icon.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width:
                                                      1, // Space between document icon and the number
                                                ),
                                                Text(
                                                  job["jobNumber"]!,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 19,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    // Content Rows
                                    _buildInfoRow(
                                        iconPath:
                                            'assets/images/icons/dafault_icon.png',
                                        title: 'Date / Time',
                                        value: job["dateTime"]!),
                                    _buildInfoRow(
                                        iconPath:
                                            'assets/images/icons/dafault_icon.png',
                                        title: 'Client',
                                        value: job["client"]!),
                                    _buildInfoRow(
                                        iconPath:
                                            'assets/images/icons/dafault_icon.png',
                                        title: 'Authorized Rep',
                                        value: job["rep"]!,
                                        isBold: false),
                                    _buildInfoRow(
                                        iconPath:
                                            'assets/images/icons/dafault_icon.png',
                                        title: 'location',
                                        value: job["location"]!),
                                    _buildInfoRow(
                                        iconPath:
                                            'assets/images/icons/dafault_icon.png',
                                        title: 'Service',
                                        value: job["service"]!),
                                    _buildInfoRow(
                                        iconPath:
                                            'assets/images/icons/dafault_icon.png',
                                        title: 'Callout Job',
                                        value: job["callout"]!),
                                  ],
                                ),
                              ),
                            ),
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
                                        width: 2), // Border color when focused
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
                                  border:
                                      Border.all(color: Colors.grey, width: 2),
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
                                  border:
                                      Border.all(color: Colors.grey, width: 2),
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
                                archieveJobsOpened = !archieveJobsOpened;
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
                                    ? Column(
                                        children: [
                                          ListView.builder(
                                            shrinkWrap:
                                                true, // Allow ListView to adapt to its content
                                            physics: ClampingScrollPhysics(),
                                            itemCount:
                                                paginatedJobDataAchieved.length,
                                            itemBuilder: (context, index) {
                                              final job =
                                                  paginatedJobDataAchieved[
                                                      index];
                                              return Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 30.0,
                                                    right: 45.0,
                                                    bottom: 10.0,
                                                  ),
                                                  child: Card(
                                                    elevation: 5,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        top: 12.0,
                                                        bottom: 12.0,
                                                        left: 18.0,
                                                        right: 25.0,
                                                      ),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              // Left-aligned title
                                                              Expanded(
                                                                flex:
                                                                    3, // Adjust the flex value to control space distribution
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  child: Row(
                                                                    children: [
                                                                      FittedBox(
                                                                        child: Image
                                                                            .asset(
                                                                          "assets/images/icons/threeDots.png",
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            top:
                                                                                8.0),
                                                                        child:
                                                                            FittedBox(
                                                                          child:
                                                                              Image.asset(
                                                                            "assets/images/icons/eye_icon.png",
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),

                                                              // Center-aligned icon
                                                              Expanded(
                                                                flex:
                                                                    5, // Adjust the flex value to control space distribution
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                          "Job Status"),
                                                                      SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                      Container(
                                                                        padding: const EdgeInsets
                                                                            .symmetric(
                                                                            horizontal:
                                                                                3,
                                                                            vertical:
                                                                                10),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.amber,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8),
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              color: Colors.grey.withOpacity(0.5),
                                                                              spreadRadius: 1,
                                                                              blurRadius: 4,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        child:
                                                                            const Text(
                                                                          'Draft',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),

                                                              // Right-aligned value
                                                              Expanded(
                                                                flex:
                                                                    3, // Adjust the flex value to control space distribution
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      FittedBox(
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/icons/document_icon.png',
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            1, // Space between document icon and the number
                                                                      ),
                                                                      Text(
                                                                        job["jobNumber"]!,
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.black,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          fontSize:
                                                                              19,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                              height: 5),
                                                          // Content Rows
                                                          _buildInfoRow(
                                                              iconPath:
                                                                  'assets/images/icons/dafault_icon.png',
                                                              title:
                                                                  'Date / Time',
                                                              value: job[
                                                                  "dateTime"]!),
                                                          _buildInfoRow(
                                                              iconPath:
                                                                  'assets/images/icons/dafault_icon.png',
                                                              title: 'Client',
                                                              value: job[
                                                                  "client"]!),
                                                          _buildInfoRow(
                                                              iconPath:
                                                                  'assets/images/icons/dafault_icon.png',
                                                              title:
                                                                  'Authorized Rep',
                                                              value:
                                                                  job["rep"]!,
                                                              isBold: false),
                                                          _buildInfoRow(
                                                              iconPath:
                                                                  'assets/images/icons/dafault_icon.png',
                                                              title: 'location',
                                                              value: job[
                                                                  "location"]!),
                                                          _buildInfoRow(
                                                              iconPath:
                                                                  'assets/images/icons/dafault_icon.png',
                                                              title: 'Service',
                                                              value: job[
                                                                  "service"]!),
                                                          _buildInfoRow(
                                                              iconPath:
                                                                  'assets/images/icons/dafault_icon.png',
                                                              title:
                                                                  'Callout Job',
                                                              value: job[
                                                                  "callout"]!),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
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
                                                        const EdgeInsets.only(
                                                            right: 30.0),
                                                    child: Text(
                                                      "Show",
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF005277),
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
                                                      focusColor: Colors.white,
                                                      value:
                                                          _selectedFilteringValueAchieved,
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 8,
                                                                vertical: 4),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(0),
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
                                                                  .circular(0),
                                                          borderSide: BorderSide(
                                                              color:
                                                                  Colors.grey,
                                                              width:
                                                                  2), // Border colo
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(0),
                                                          borderSide: BorderSide(
                                                              color:
                                                                  Colors.grey,
                                                              width:
                                                                  2), // Border color when focused
                                                        ),
                                                        fillColor: Colors
                                                            .white, // Set the background color to white
                                                        filled: true,
                                                        // Enable the fill color
                                                      ),
                                                      icon: Icon(
                                                          Icons.arrow_drop_down,
                                                          color: Colors.black),
                                                      items:
                                                          filteringAmountsArchieved
                                                              .map((item) =>
                                                                  DropdownMenuItem(
                                                                    value: item,
                                                                    child: Text(
                                                                      item,
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color: Color(
                                                                            0xFF007AFF),
                                                                      ),
                                                                    ),
                                                                  ))
                                                              .toList(),
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _selectedFilteringValueAchieved =
                                                              value;

                                                          itemsPerPageAchieved =
                                                              int.parse(value!);
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
                                                            print("10 is here");
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
                                                        color:
                                                            Color(0xFF005277),
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
                                                          print("10 is here");
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
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.grey,
                                                            width: 2),
                                                        color: Colors.white,
                                                      ),
                                                      child: Icon(
                                                        Icons.arrow_left,
                                                        color:
                                                            Color(0xFF005277),
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
                                                          print("5 is here");
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
                                                          print("10 is here");
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
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.grey,
                                                            width: 2),
                                                        color: Colors.white,
                                                      ),
                                                      child: Icon(
                                                        Icons.arrow_right,
                                                        color:
                                                            Color(0xFF005277),
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
                                      )
                                    : SizedBox(
                                        height: 2,
                                      ),
                              ],
                            ),
                          )
                        : SizedBox(
                            height: 2,
                          ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
