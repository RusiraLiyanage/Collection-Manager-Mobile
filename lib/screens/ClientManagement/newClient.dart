import 'dart:io';

import 'package:flutter/material.dart';
import 'package:horizontal_stepper_flutter/horizontal_stepper_flutter.dart';
import 'package:project_code_blue/screens/ClientManagement/achievedClientCard.dart';
import 'package:project_code_blue/screens/ClientManagement/achievedLocationCard.dart';
import 'package:project_code_blue/screens/ClientManagement/authorizedRepresentatives.dart';
import 'package:project_code_blue/screens/ClientManagement/authrorizedRepresentative.dart';
import 'package:project_code_blue/screens/ClientManagement/clientLocationCard.dart';
import 'package:project_code_blue/screens/ClientManagement/clientManagementCard.dart';
import 'package:project_code_blue/screens/ClientManagement/newClientLocation.dart';
import 'package:project_code_blue/screens/ClientManagement/newNote.dart';
import 'package:project_code_blue/screens/ClientManagement/noteCard.dart';
import 'package:project_code_blue/screens/OnsiteJobs/achievedJobsNewCard.dart';
import 'package:project_code_blue/screens/OnsiteJobs/collectorRepresentation.dart';
import 'package:project_code_blue/screens/OnsiteJobs/onSiteJobsNewCard.dart';
//import 'package:progress_stepper/progress_stepper.dart';
import 'package:im_stepper/stepper.dart';

enum TestsType {
  alcoholOnly,
  alcoholAndDrug,
  DrugOnly,
}

enum ClientSpec {
  inHouse,
  mobileClinic,
}

class NewClient extends StatefulWidget {
  final ScrollController scrollController;

  const NewClient({super.key, required this.scrollController});

  @override
  State<NewClient> createState() => _NewCalloutJobState();
}

class _NewCalloutJobState extends State<NewClient> {
  TestsType? _testsType = TestsType.alcoholOnly;
  ClientSpec? _clientSpecType = ClientSpec.inHouse;
  final List<GlobalKey<FormState>> _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  List<AuthorizedRepresentative> representatives = List.empty(growable: true);

  int currentPage = 1; // Tracks the current page
  int itemsPerPage = 5; // Default items per page

  int currentPageAchieved = 1; // Tracks the current page
  int itemsPerPageAchieved = 5; // Default items per page

  String? _selectedFilteringValue; // State variable for selected value

  String? _selectedFilteringValueAchieved;

  String get displayRange {
    int start = ((currentPage - 1) * itemsPerPage) + 1;
    int end = currentPage * itemsPerPage;
    end = end > locationData.length ? locationData.length : end;
    return "$start - $end";
  }

  String get displayRangeAchieved {
    int start = ((currentPageAchieved - 1) * itemsPerPageAchieved) + 1;
    int end = currentPageAchieved * itemsPerPageAchieved;
    end = end > locationDataAchieved.length ? locationDataAchieved.length : end;
    return "$start - $end";
  }

  List<Map<String, String>> get paginatedJobDataAchieved {
    int startIndexAchieved = (currentPageAchieved - 1) * itemsPerPageAchieved;
    int endIndexAchieved = startIndexAchieved + itemsPerPageAchieved;
    endIndexAchieved = endIndexAchieved > jobDataAchieved.length
        ? jobDataAchieved.length
        : endIndexAchieved;
    return jobData.sublist(startIndexAchieved, endIndexAchieved);
  }

  bool addNewOpened = false;

  bool archieveJobsOpened = false;

  bool showMainJobs = true;

  final GlobalKey<FormFieldState<String>> _siteRepresentativeKey =
      GlobalKey<FormFieldState<String>>();

  String? _selectedValue;

  TextEditingController _startDateController = TextEditingController();

  DateTime? _selectedStartDate;

  DateTime? _selectedEndDate;

  final List<String> items = [
    "Newcastle City",
    "Sydney Office",
    "Melbourne Branch",
  ];

  final List<String> clients = [
    "New Castle City Council",
    "Wollongong City Council",
    "Transport for New South Wales",
  ]; //

  final List<String> showLocations = [
    "All",
    "Specific",
  ];

  final List<Map<String, String>> notes = [
    {
      "title": "Office Hours",
      "creator": "Jane Smith",
      "date": "26/3/24",
      "time": "10:30 am",
      "subject": "Office Hours",
      "noteText": "This is the office hours note text that we added"
    },
    {
      "title": "Holiday Season",
      "creator": "Jane Smith",
      "date": "26/3/24",
      "time": "10:30 am",
      "subject": "Office Hours",
      "noteText": "This is the office hours note text that we added"
    },
    {
      "title": "Holiday Season",
      "creator": "Jane Smith",
      "date": "26/3/24",
      "time": "10:30 am",
      "subject": "Office Hours",
      "noteText": "This is the office hours note text that we added"
    },
    {
      "title": "Office Hours",
      "creator": "Jane Smith",
      "date": "26/3/24",
      "time": "10:30 am",
      "subject": "Office Hours",
      "noteText": "This is the office hours note text that we added"
    },
    {
      "title": "Winter Season",
      "creator": "Jane Smith",
      "date": "26/3/24",
      "time": "10:30 am",
      "subject": "Office Hours",
      "noteText": "This is the office hours note text that we added"
    },
    {
      "title": "Holiday Season",
      "creator": "Jane Smith",
      "date": "26/3/24",
      "time": "10:30 am",
      "subject": "Office Hours",
      "noteText": "This is the office hours note text that we added"
    },
    {
      "title": "Holiday Season",
      "creator": "Jane Smith",
      "date": "26/3/24",
      "time": "10:30 am",
      "subject": "Office Hours",
      "noteText": "This is the office hours note text that we added"
    },
    {
      "title": "Holiday Season",
      "creator": "Jane Smith",
      "date": "26/3/24",
      "time": "10:30 am",
      "subject": "Office Hours",
      "noteText": "This is the office hours note text that we added"
    },
    {
      "title": "Holiday Season",
      "creator": "Jane Smith",
      "date": "26/3/24",
      "time": "10:30 am",
      "subject": "Office Hours",
      "noteText": "This is the office hours note text that we added"
    },
    {
      "title": "Holiday Season",
      "creator": "Jane Smith",
      "date": "26/3/24",
      "time": "10:30 am",
      "subject": "Office Hours",
      "noteText": "This is the office hours note text that we added"
    },
  ];

  String? _selectedLocation;

  void addRepresentative(
      String representativeName, String mobile, String position, String email) {
    print("yes called");
    setState(() {
      representatives.add(
        AuthorizedRepresentative(
          id: DateTime.now().millisecondsSinceEpoch.toString(), // Unique ID
          representativeName: representativeName,
          mobile: mobile,
          position: position,
          email: email,
        ),
      );
      addNewOpened = false;
      numberOfRepresentatives++;
    });
  }

  void deleteRepresentative(String id) {
    setState(() {
      representatives.removeWhere((representative) => representative.id == id);
      numberOfRepresentatives--;
    });
  }

  void closeSiteContact() {
    setState(() {
      addNewOpened = false;
    });
  }

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

  String? _selectedClient;

  List<Map<String, String>> get paginatedJobData {
    int startIndex = (currentPage - 1) * itemsPerPage;
    int endIndex = startIndex + itemsPerPage;
    endIndex = endIndex > jobData.length ? jobData.length : endIndex;
    return jobData.sublist(startIndex, endIndex);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedValue = items.first;
    _selectedClient = clients.first;
    //_selectedStatus = status.first;
    _selectedFilteringValue = filteringAmounts.first;
    _selectedFilteringValueAchieved = filteringAmountsArchieved.first;

    _selectedLocation = showLocations.first;

    bool isAtBottom = false; // Track whether the scroll is at the bottom

    // Add listener to monitor scroll changes
    widget.scrollController.addListener(() {
      // Check if the scroll position is at the bottom
      bool atBottom = widget.scrollController.position.atEdge &&
          widget.scrollController.position.pixels > 0;

      if (atBottom != isAtBottom) {
        setState(() {
          isAtBottom = atBottom;
        });
      }
    });

    widget.scrollController.addListener(() {
      if (widget.scrollController.position.pixels < 380) {
        setState(() {
          showMainLocations = true;
          achieveLocationsOpened = false;
          archieveJobsOpened = false;
        });
      }
    });
  }

  // Filtered jobs to display based on pagination
  List<Map<String, String>> get paginatedLocationData {
    int startIndex = (currentPage - 1) * itemsPerPage;
    int endIndex = startIndex + itemsPerPage;
    endIndex = endIndex > locationData.length ? locationData.length : endIndex;
    return locationData.sublist(startIndex, endIndex);
  }

  // Filtered achieved jobs to display based on pagination
  List<Map<String, String>> get paginatedLocationDataAchieved {
    int startIndexAchieved = (currentPageAchieved - 1) * itemsPerPageAchieved;
    int endIndexAchieved = startIndexAchieved + itemsPerPageAchieved;
    endIndexAchieved = endIndexAchieved > locationDataAchieved.length
        ? locationDataAchieved.length
        : endIndexAchieved;
    return locationData.sublist(startIndexAchieved, endIndexAchieved);
  }

  bool achieveLocationsOpened = false;

  final List<String> status = ["Show", "Hide"];
  final List<String> filteringAmounts = ["5", "10", "15"];
  final List<String> filteringAmountsArchieved = ["5", "10", "15"];

  final List<Map<String, String>> locationData = [
    {
      "locationNumber": "1",
      "locationName": "New Castle Deport",
      "locationAddress": "6 Stewart Avenue, Newcastle West ",
      "siteContract": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
    },
    {
      "locationNumber": "2",
      "locationName": "New Castle City Council",
      "locationAddress": "6 Stewart Avenue, Newcastle West ",
      "siteContract": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
    },
    {
      "locationNumber": "3",
      "locationName": "New Castle City Council",
      "locationAddress": "6 Stewart Avenue, Newcastle West ",
      "siteContract": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
    },
    {
      "locationNumber": "4",
      "locationName": "New Castle City Council",
      "locationAddress": "6 Stewart Avenue, Newcastle West ",
      "siteContract": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
    },
    {
      "locationNumber": "5",
      "locationName": "New Castle City Council",
      "locationAddress": "6 Stewart Avenue, Newcastle West ",
      "siteContract": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
    },
    {
      "locationNumber": "6",
      "locationName": "New Castle City Council",
      "locationAddress": "6 Stewart Avenue, Newcastle West ",
      "siteContract": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
    },
    {
      "locationNumber": "7",
      "locationName": "New Castle City Council",
      "locationAddress": "6 Stewart Avenue, Newcastle West ",
      "siteContract": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
    },
    {
      "locationNumber": "8",
      "locationName": "New Castle City Council",
      "locationAddress": "6 Stewart Avenue, Newcastle West ",
      "siteContract": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
    },
    {
      "locationNumber": "9",
      "locationName": "New Castle City Council",
      "locationAddress": "6 Stewart Avenue, Newcastle West ",
      "siteContract": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
    },
    {
      "locationNumber": "10",
      "locationName": "New Castle City Council",
      "locationAddress": "6 Stewart Avenue, Newcastle West ",
      "siteContract": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
    },
    {
      "locationNumber": "11",
      "locationName": "New Castle City Council",
      "locationAddress": "6 Stewart Avenue, Newcastle West ",
      "siteContract": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
    },
    {
      "locationNumber": "12",
      "locationName": "New Castle City Council",
      "locationAddress": "6 Stewart Avenue, Newcastle West ",
      "siteContract": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
    },
    {
      "locationNumber": "13",
      "locationName": "New Castle City Council",
      "locationAddress": "6 Stewart Avenue, Newcastle West ",
      "siteContract": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
    },
    {
      "locationNumber": "14",
      "locationName": "New Castle City Council",
      "locationAddress": "6 Stewart Avenue, Newcastle West ",
      "siteContract": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
    },
    {
      "locationNumber": "15",
      "locationName": "New Castle City Council",
      "locationAddress": "6 Stewart Avenue, Newcastle West ",
      "siteContract": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
    },
    {
      "locationNumber": "16",
      "locationName": "New Castle City Council",
      "locationAddress": "6 Stewart Avenue, Newcastle West ",
      "siteContract": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
    },
    {
      "locationNumber": "17",
      "locationName": "New Castle City Council",
      "locationAddress": "6 Stewart Avenue, Newcastle West ",
      "siteContract": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
    },
    {
      "locationNumber": "18",
      "locationName": "New Castle City Council",
      "locationAddress": "6 Stewart Avenue, Newcastle West ",
      "siteContract": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
    },
    {
      "locationNumber": "19",
      "locationName": "New Castle City Council",
      "locationAddress": "6 Stewart Avenue, Newcastle West ",
      "siteContract": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
    },
    {
      "locationNumber": "20",
      "locationName": "New Castle City Council",
      "locationAddress": "6 Stewart Avenue, Newcastle West ",
      "siteContract": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
    },
  ];

  final List<Map<String, String>> locationDataAchieved = [
    {
      "locationNumber": "1",
      "locationName": "New Castle City Council",
      "locationAddress": "6 Stewart Avenue, Newcastle West ",
      "siteContract": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
    },
    {
      "locationNumber": "2",
      "locationName": "New Castle City Council",
      "locationAddress": "6 Stewart Avenue, Newcastle West ",
      "siteContract": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
    },
    {
      "locationNumber": "3",
      "locationName": "New Castle City Council",
      "locationAddress": "6 Stewart Avenue, Newcastle West ",
      "siteContract": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
    },
    {
      "locationNumber": "4",
      "locationName": "New Castle City Council",
      "locationAddress": "6 Stewart Avenue, Newcastle West ",
      "siteContract": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
    },
    {
      "locationNumber": "5",
      "locationName": "New Castle City Council",
      "locationAddress": "6 Stewart Avenue, Newcastle West ",
      "siteContract": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
    },
    {
      "locationNumber": "6",
      "locationName": "New Castle City Council",
      "locationAddress": "6 Stewart Avenue, Newcastle West ",
      "siteContract": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
    },
    {
      "locationNumber": "7",
      "locationName": "New Castle City Council",
      "locationAddress": "6 Stewart Avenue, Newcastle West ",
      "siteContract": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
    },
    {
      "locationNumber": "8",
      "locationName": "New Castle City Council",
      "locationAddress": "6 Stewart Avenue, Newcastle West ",
      "siteContract": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
    },
    {
      "locationNumber": "9",
      "locationName": "New Castle City Council",
      "locationAddress": "6 Stewart Avenue, Newcastle West ",
      "siteContract": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
    },
    {
      "locationNumber": "10",
      "locationName": "New Castle City Council",
      "locationAddress": "6 Stewart Avenue, Newcastle West ",
      "siteContract": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
    },
    {
      "locationNumber": "11",
      "locationName": "New Castle City Council",
      "locationAddress": "6 Stewart Avenue, Newcastle West ",
      "siteContract": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
    },
    {
      "locationNumber": "12",
      "locationName": "New Castle City Council",
      "locationAddress": "6 Stewart Avenue, Newcastle West ",
      "siteContract": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
    },
    {
      "locationNumber": "13",
      "locationName": "New Castle City Council",
      "locationAddress": "6 Stewart Avenue, Newcastle West ",
      "siteContract": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
    },
    {
      "locationNumber": "14",
      "locationName": "New Castle City Council",
      "locationAddress": "6 Stewart Avenue, Newcastle West ",
      "siteContract": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
    },
    {
      "locationNumber": "15",
      "locationName": "New Castle City Council",
      "locationAddress": "6 Stewart Avenue, Newcastle West ",
      "siteContract": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
    },
    {
      "locationNumber": "16",
      "locationName": "New Castle City Council",
      "locationAddress": "6 Stewart Avenue, Newcastle West ",
      "siteContract": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
    },
    {
      "locationNumber": "17",
      "locationName": "New Castle City Council",
      "locationAddress": "6 Stewart Avenue, Newcastle West ",
      "siteContract": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
    },
    {
      "locationNumber": "18",
      "locationName": "New Castle City Council",
      "locationAddress": "6 Stewart Avenue, Newcastle West ",
      "siteContract": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
    },
    {
      "locationNumber": "19",
      "locationName": "New Castle City Council",
      "locationAddress": "6 Stewart Avenue, Newcastle West ",
      "siteContract": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
    },
    {
      "locationNumber": "20",
      "locationName": "New Castle City Council",
      "locationAddress": "6 Stewart Avenue, Newcastle West ",
      "siteContract": "Olvia Lopez",
      "mobile": "0456 227 889",
      "email": "eeeeee@gmail.com",
    },
  ];

  int numberOfRepresentatives = 0;

  int _currentStep = 0; // Start from Step 1

  final TextEditingController _locationSearchController =
      TextEditingController();

  final TextEditingController _donorsController = TextEditingController();
  final TextEditingController _jobReferenceController = TextEditingController();
  final TextEditingController _typeOfServiceController =
      TextEditingController();

  final TextEditingController _clientNameController = TextEditingController();

  final TextEditingController _clientNamEController = TextEditingController();

  final TextEditingController _calloutInstructionsController =
      TextEditingController();

  final TextEditingController _mobile_Controller = TextEditingController();

  final TextEditingController _positionController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _addressLineOneController =
      TextEditingController();

  final TextEditingController _addressLineTwoController =
      TextEditingController();

  final TextEditingController _citySuburbController = TextEditingController();

  final TextEditingController _stateController = TextEditingController();

  final TextEditingController _postCodeController = TextEditingController();

  final TextEditingController _category1_Controller = TextEditingController();

  final TextEditingController _category1LimitGController =
      TextEditingController();

  final TextEditingController _category1SetLimitOutTimeController =
      TextEditingController();

  final TextEditingController _category2Controller = TextEditingController();

  final TextEditingController _category2LimitGController =
      TextEditingController();

  final TextEditingController _category2SetLimitOutTimeController =
      TextEditingController();

  final TextEditingController _siteContact_3_Controller =
      TextEditingController();

  final TextEditingController _category3LimitGController =
      TextEditingController();

  final TextEditingController _category3SetLimitOutTimeController =
      TextEditingController();

  final TextEditingController _primaryDrugTestController =
      TextEditingController();

  final TextEditingController _primaryDrugTestPreferredDeviceController =
      TextEditingController();

  final TextEditingController _secondaryDrugTestController =
      TextEditingController();

  final TextEditingController _secondaryDrugTestPreferredDeviceController =
      TextEditingController();

  final TextEditingController _thirteryDrugTestController =
      TextEditingController();

  final TextEditingController _thirteryDrugTestPreferredDeviceController =
      TextEditingController();

  final TextEditingController _additionalTestsController =
      TextEditingController();

  final TextEditingController _additioanlTestInstructionsController =
      TextEditingController();

  final TextEditingController _donorSelectionProcessController =
      TextEditingController();

  final TextEditingController _screeningAndTestingProcessController =
      TextEditingController();

  final TextEditingController _testConfirmationInstructionsController =
      TextEditingController();

  final TextEditingController _globalSiteAccessInstructionsController =
      TextEditingController();

  final TextEditingController _specificLocalSiteAccessInstructionsController =
      TextEditingController();

  final TextEditingController _specialInstructionsController =
      TextEditingController();

  // Dropdown values
  String? _selectedClientName;
  String? _selectedSite;
  String? _selectedCollectorOneAssignment;
  String? _selectedCollectorTwoAssignment;
  String? _selectedClientReference;

  String? _selectedJobReference;
  String? _selectedTypeOfService;

  final GlobalKey<FormFieldState<String>> _clientNameKey =
      GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> _serviceOfficeKey =
      GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> _jobDateKey =
      GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> _startTimeKey =
      GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> _jobDurationKey =
      GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> _numberOfDonorsKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _typeOfServiceKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _jobReferenceKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _siteKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _collectorOneAssignmentKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _collectorTwoAssignmentKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _clientNamEKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _calloutInstructionsKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _mobileKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _positionKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _emailKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _addressLineOneKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _addressLineTwoKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _citySuburbKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _stateKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _postCodeKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _category1Key =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _category1Limit210L =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _category1SitoutTimeKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _category2Key =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _category2Limit210L =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _category2SitoutTimeKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _category3Key =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _category3Limit210L =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _category3SitoutTimeKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _primaryTestSpecificationsKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _selectPreferedPrimaryDeviceKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _secondaryDrugTestKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _selectPreferedSecondaryDeviceKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _thirtoryDrugTestKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _selectPreferedThirtoryDeviceKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _additionalTestsKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _additioanlTestInstructionsKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _donorSelectionProcessKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _screeningAndTestingProcessKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _testConfirmationInstructionsKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _globalSiteAccessInstructionsKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>>
      _specificLocalSiteAccessInstructionsKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _specialInstructionsKey =
      GlobalKey<FormFieldState<String>>();

  int get totalPages => (locationData.length / itemsPerPage).ceil();

  int get totalPagesAchieved =>
      (locationDataAchieved.length / itemsPerPageAchieved).ceil();

  // Dropdown options
  final List<String> _theClientNames = [
    'George Vasileski',
    'Heath Cooper',
    'Nam Naguyen',
    "Jinchen Yang",
    "SQ Park"
  ];
  final List<String> _sites = ['Site 1', 'Site 2', 'Site 3'];
  final List<String> _collectorOneAssignment = [
    'Allocated',
    'Accepted',
    'Rejected'
  ];
  final List<String> _collectorTwoAssignment = [
    'Allocated',
    'Accepted',
    'Rejected'
  ];
  final List<String> _clientReferences = [
    'Ref12234',
    'Ref4567',
    'Ref7890',
    'Ref4583'
  ];

  TextEditingController _endDateController = TextEditingController();

  DateTime? _selectedJobDate;
  TimeOfDay? _selectedTime;

  // Declare the _selectedDuration variable
  Duration? _selectedDuration;
  int _selectedNoDonors = 0;

  int hours = 0;
  int minutes = 0;

  bool isMobileClinic = false;
  bool showMainLocations = true;

  void removeRepresentative() {
    setState(() {
      numberOfRepresentatives--; // Decrease count when a collector is deleted
    });
  }

  bool isKeyboardVisible(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom > 0;
  }

  @override
  void dispose() {
    _locationSearchController.dispose();
    _startDateController.dispose();
    _endDateController.dispose(); // Dispose the controller when done
    super.dispose();
  }

  Widget _buildStepContent() {
    switch (_currentStep) {
      case 0:
        return Column(children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            child: SizedBox(
              width: double.infinity,
              height: 80,
              child: Card(
                surfaceTintColor: Colors.white,
                color: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 12.0,
                    bottom: 12.0,
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              const Color(0xFFE6F7FA), // Light blue background
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize
                              .min, // Ensures Column takes only required space
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16), // Padding
                              decoration: BoxDecoration(
                                color:
                                    Colors.grey[600], // Light blue background
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    '1',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Container(
                                    height: 20,
                                    width: 2,
                                    color: Colors.white, // Vertical divider
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Client Details',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            child: SizedBox(
              width: double.infinity,
              height: 180,
              child: Card(
                surfaceTintColor: Colors.white,
                color: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 12.0,
                    bottom: 12.0,
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 125,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              const Color(0xFFE6F7FA), // Light blue background
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 12.0,
                                top: 15.0,
                                right: 12.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Client\nName",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 206,
                                    child: DropdownButtonFormField<String>(
                                      key: _clientNameKey,
                                      icon: Image.asset(
                                        "assets/images/icons/dropDownIcon.png", // Replace with your image path
                                        width: 16, // Adjust the size
                                        height: 16,
                                      ),
                                      elevation: 20,
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          borderSide: const BorderSide(
                                            color: Colors.white,
                                            width: 2, // Default border width
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          borderSide: const BorderSide(
                                            color: Colors.white,
                                            width:
                                                2, // Set the border color to grey
                                            // Set the border color to grey
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          borderSide: const BorderSide(
                                            color: Colors
                                                .white, // Set the border color to grey when focused
                                            width:
                                                2, // Optional: Adjust the width for better visibility
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          borderSide: const BorderSide(
                                            color: Colors
                                                .red, // Set the border color to grey when focused
                                            width:
                                                2, // Optional: Adjust the width for better visibility
                                          ),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          borderSide: const BorderSide(
                                            color: Colors
                                                .red, // Set the border color to grey when focused
                                            width:
                                                2, // Optional: Adjust the width for better visibility
                                          ),
                                        ),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          vertical:
                                              5, // Adjust vertical padding
                                          horizontal:
                                              12, // Adjust horizontal padding
                                        ),
                                        errorStyle: TextStyle(
                                          color: Colors.red,
                                          fontSize:
                                              12, // Adjust font size if needed
                                        ), // Reserve space for error messages
                                      ),
                                      value: _selectedClientName,
                                      items:
                                          _theClientNames.map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedClientName = value;
                                          _clientNameKey.currentState!
                                              .validate(); // Revalidate the field
                                          /* if (_selectedClientName!.length < 0) {
                                // Clear error state once a valid selection is made
                                _formKeys[_currentStep].currentState?.validate();
                              } */
                                        });
                                      },
                                      validator: (value) => value == null
                                          ? 'Please select a client Name'
                                          : null,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 12.0,
                                top: 15.0,
                                right: 12.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Client\nReference",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 206,
                                    child: DropdownButtonFormField<String>(
                                      key: _serviceOfficeKey,
                                      icon: Image.asset(
                                        "assets/images/icons/dropDownIcon.png", // Replace with your image path
                                        width: 16, // Adjust the size
                                        height: 16,
                                      ),
                                      elevation: 20,
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          borderSide: const BorderSide(
                                            color: Colors.white,
                                            width: 2, // Default border width
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          borderSide: const BorderSide(
                                            color: Colors.white,
                                            width:
                                                2, // Set the border color to grey
                                            // Set the border color to grey
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          borderSide: const BorderSide(
                                            color: Colors
                                                .white, // Set the border color to grey when focused
                                            width:
                                                2, // Optional: Adjust the width for better visibility
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          borderSide: const BorderSide(
                                            color: Colors
                                                .red, // Set the border color to grey when focused
                                            width:
                                                2, // Optional: Adjust the width for better visibility
                                          ),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          borderSide: const BorderSide(
                                            color: Colors
                                                .red, // Set the border color to grey when focused
                                            width:
                                                2, // Optional: Adjust the width for better visibility
                                          ),
                                        ),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          vertical:
                                              5, // Adjust vertical padding
                                          horizontal:
                                              12, // Adjust horizontal padding
                                        ),
                                        errorStyle: TextStyle(
                                          color: Colors.red,
                                          fontSize:
                                              12, // Adjust font size if needed
                                        ), // Reserve space for error messages
                                      ),
                                      value: _selectedClientReference,
                                      items:
                                          _clientReferences.map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedClientReference = value;
                                          _serviceOfficeKey.currentState!
                                              .validate();
                                          /* if (_selectedClientName!.length < 0) {
                                // Clear error state once a valid selection is made
                                _formKeys[_currentStep].currentState?.validate();
                              } */
                                        });
                                      },
                                      validator: (value) => value == null
                                          ? 'Please select a Client Reference'
                                          : null,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            child: SizedBox(
              width: double.infinity,
              child: Card(
                surfaceTintColor: Colors.white,
                color: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 12.0,
                    bottom: 12.0,
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Left-aligned title
                          Row(
                            children: [
                              Text(
                                "Client Contact",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 0.0,
                              top: 15.0,
                              right: 0.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Name",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 0.0),
                                  child: Container(
                                    height: 40,
                                    width: 206,
                                    child: Material(
                                      elevation:
                                          4, // Adjust this value for more or less elevation
                                      shadowColor: Colors.black.withOpacity(
                                          0.5), // Optional: Adjust shadow color
                                      borderRadius: BorderRadius.circular(
                                          4), // Match with TextFormField's border radius
                                      child: TextFormField(
                                        key: _clientNamEKey,
                                        controller: _clientNamEController,
                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.red,
                                              width: 2,
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.red,
                                              width: 2,
                                            ),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            vertical: 5,
                                            horizontal: 12,
                                          ),
                                          errorStyle: const TextStyle(
                                            color: Colors.red,
                                            fontSize: 12,
                                          ),
                                        ),
                                        keyboardType: TextInputType
                                            .text, // Ensures numeric input
                                        onChanged: (value) {
                                          setState(() {
                                            //_selectedJobReference = value;
                                            // Update the number of donors and the text controller
                                            _clientNamEController.text =
                                                value; // Manually update the controller text
                                            _clientNamEKey.currentState!
                                                .validate();
                                          });
                                        },
                                        validator: (value) {
                                          if (_clientNamEController.text ==
                                              "") {
                                            return 'Please enter a correct name';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 0.0,
                              top: 15.0,
                              right: 0.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Mobile",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 0.0),
                                  child: Container(
                                    height: 40,
                                    width: 206,
                                    child: Material(
                                      elevation:
                                          4, // Adjust this value for more or less elevation
                                      shadowColor: Colors.black.withOpacity(
                                          0.5), // Optional: Adjust shadow color
                                      borderRadius: BorderRadius.circular(
                                          4), // Match with TextFormField's border radius
                                      child: TextFormField(
                                        key: _mobileKey,
                                        controller: _mobile_Controller,
                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.red,
                                              width: 2,
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.red,
                                              width: 2,
                                            ),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            vertical: 5,
                                            horizontal: 12,
                                          ),
                                          errorStyle: const TextStyle(
                                            color: Colors.red,
                                            fontSize: 12,
                                          ),
                                          /* suffixIcon: Padding(
                                            padding: const EdgeInsets.all(
                                                8.0), // Adjust the padding as needed
                                            child: Image.asset(
                                              "assets/images/icons/icon_calendar.png", // Replace with your image path
                                              width:
                                                  32, // Adjust the width of the image
                                              height:
                                                  32, // Adjust the height of the image
                                            ),
                                          ), */
                                        ),
                                        keyboardType: TextInputType
                                            .phone, // Ensures numeric input
                                        onChanged: (value) {
                                          setState(() {
                                            // Update the number of donors and the text controller
                                            _mobile_Controller.text =
                                                value; // Manually update the controller text
                                            _mobileKey.currentState!.validate();
                                          });
                                        },
                                        validator: (value) {
                                          if (!RegExp(r'^[0-9]{10}$')
                                              .hasMatch(value!)) {
                                            return 'Please enter a valid mobile number';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 0.0,
                              top: 15.0,
                              right: 0.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Position",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 0.0),
                                  child: Container(
                                    height: 40,
                                    width: 206,
                                    child: Material(
                                      elevation:
                                          4, // Adjust this value for more or less elevation
                                      shadowColor: Colors.black.withOpacity(
                                          0.5), // Optional: Adjust shadow color
                                      borderRadius: BorderRadius.circular(
                                          4), // Match with TextFormField's border radius
                                      child: TextFormField(
                                        key: _positionKey,
                                        controller: _positionController,
                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.red,
                                              width: 2,
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.red,
                                              width: 2,
                                            ),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            vertical: 5,
                                            horizontal: 12,
                                          ),
                                          errorStyle: const TextStyle(
                                            color: Colors.red,
                                            fontSize: 12,
                                          ),
                                        ),
                                        keyboardType: TextInputType
                                            .text, // Ensures numeric input
                                        onChanged: (value) {
                                          setState(() {
                                            //_selectedJobReference = value;
                                            // Update the number of donors and the text controller
                                            _positionController.text =
                                                value; // Manually update the controller text
                                            _positionKey.currentState!
                                                .validate();
                                          });
                                        },
                                        validator: (value) {
                                          if (_positionController.text == "") {
                                            return 'Please enter a correct position';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 0.0,
                              top: 15.0,
                              right: 0.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Email",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 0.0),
                                  child: Container(
                                    height: 40,
                                    width: 206,
                                    child: Material(
                                      elevation:
                                          4, // Adjust this value for more or less elevation
                                      shadowColor: Colors.black.withOpacity(
                                          0.5), // Optional: Adjust shadow color
                                      borderRadius: BorderRadius.circular(
                                          4), // Match with TextFormField's border radius
                                      child: TextFormField(
                                        key: _emailKey,
                                        controller: _emailController,
                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.red,
                                              width: 2,
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.red,
                                              width: 2,
                                            ),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            vertical: 5,
                                            horizontal: 12,
                                          ),
                                          errorStyle: const TextStyle(
                                            color: Colors.red,
                                            fontSize: 12,
                                          ),
                                        ),
                                        keyboardType: TextInputType
                                            .text, // Ensures numeric input
                                        onChanged: (value) {
                                          setState(() {
                                            //_selectedJobReference = value;
                                            // Update the number of donors and the text controller
                                            _emailController.text =
                                                value; // Manually update the controller text
                                            _emailKey.currentState!.validate();
                                          });
                                        },
                                        validator: (value) {
                                          if (!RegExp(
                                                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                                              .hasMatch(value!)) {
                                            return 'Please enter a valid email address';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            child: SizedBox(
              width: double.infinity,
              child: Card(
                surfaceTintColor: Colors.white,
                color: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 12.0,
                    bottom: 12.0,
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Left-aligned title
                          Row(
                            children: [
                              Text(
                                "Main Address",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 0.0,
                              top: 15.0,
                              right: 0.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Address Line 1",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 0.0),
                                  child: Container(
                                    height: 40,
                                    width: 206,
                                    child: Material(
                                      elevation:
                                          4, // Adjust this value for more or less elevation
                                      shadowColor: Colors.black.withOpacity(
                                          0.5), // Optional: Adjust shadow color
                                      borderRadius: BorderRadius.circular(
                                          4), // Match with TextFormField's border radius
                                      child: TextFormField(
                                        key: _addressLineOneKey,
                                        controller: _addressLineOneController,
                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.red,
                                              width: 2,
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.red,
                                              width: 2,
                                            ),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            vertical: 5,
                                            horizontal: 12,
                                          ),
                                          errorStyle: const TextStyle(
                                            color: Colors.red,
                                            fontSize: 12,
                                          ),
                                        ),
                                        keyboardType: TextInputType
                                            .text, // Ensures numeric input
                                        onChanged: (value) {
                                          setState(() {
                                            //_selectedJobReference = value;
                                            // Update the number of donors and the text controller
                                            _addressLineOneController.text =
                                                value; // Manually update the controller text
                                            _addressLineOneKey.currentState!
                                                .validate();
                                          });
                                        },
                                        validator: (value) {
                                          if (_addressLineOneController.text ==
                                              "") {
                                            return 'Please enter a address line 1';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 0.0,
                              top: 15.0,
                              right: 0.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Address Line 2",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 0.0),
                                  child: Container(
                                    height: 40,
                                    width: 206,
                                    child: Material(
                                      elevation:
                                          4, // Adjust this value for more or less elevation
                                      shadowColor: Colors.black.withOpacity(
                                          0.5), // Optional: Adjust shadow color
                                      borderRadius: BorderRadius.circular(
                                          4), // Match with TextFormField's border radius
                                      child: TextFormField(
                                        key: _addressLineTwoKey,
                                        controller: _addressLineTwoController,
                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.red,
                                              width: 2,
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.red,
                                              width: 2,
                                            ),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            vertical: 5,
                                            horizontal: 12,
                                          ),
                                          errorStyle: const TextStyle(
                                            color: Colors.red,
                                            fontSize: 12,
                                          ),
                                        ),
                                        keyboardType: TextInputType
                                            .text, // Ensures numeric input
                                        onChanged: (value) {
                                          setState(() {
                                            //_selectedJobReference = value;
                                            // Update the number of donors and the text controller
                                            _addressLineTwoController.text =
                                                value; // Manually update the controller text
                                            _addressLineTwoKey.currentState!
                                                .validate();
                                          });
                                        },
                                        validator: (value) {
                                          if (_addressLineTwoController.text ==
                                              "") {
                                            return 'Please enter a address line 2';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 0.0,
                              top: 15.0,
                              right: 0.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "City/Suburb *",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 0.0),
                                  child: Container(
                                    height: 40,
                                    width: 206,
                                    child: Material(
                                      elevation:
                                          4, // Adjust this value for more or less elevation
                                      shadowColor: Colors.black.withOpacity(
                                          0.5), // Optional: Adjust shadow color
                                      borderRadius: BorderRadius.circular(
                                          4), // Match with TextFormField's border radius
                                      child: TextFormField(
                                        key: _citySuburbKey,
                                        controller: _citySuburbController,
                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.red,
                                              width: 2,
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.red,
                                              width: 2,
                                            ),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            vertical: 5,
                                            horizontal: 12,
                                          ),
                                          errorStyle: const TextStyle(
                                            color: Colors.red,
                                            fontSize: 12,
                                          ),
                                        ),
                                        keyboardType: TextInputType
                                            .text, // Ensures numeric input
                                        onChanged: (value) {
                                          setState(() {
                                            //_selectedJobReference = value;
                                            // Update the number of donors and the text controller
                                            _citySuburbController.text =
                                                value; // Manually update the controller text
                                            _citySuburbKey.currentState!
                                                .validate();
                                          });
                                        },
                                        validator: (value) {
                                          if (_citySuburbController.text ==
                                              "") {
                                            return 'Please enter the city suburb';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 0.0,
                              top: 15.0,
                              right: 0.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "State *",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 0.0),
                                  child: Container(
                                    height: 40,
                                    width: 140,
                                    child: Material(
                                      elevation:
                                          4, // Adjust this value for more or less elevation
                                      shadowColor: Colors.black.withOpacity(
                                          0.5), // Optional: Adjust shadow color
                                      borderRadius: BorderRadius.circular(
                                          4), // Match with TextFormField's border radius
                                      child: TextFormField(
                                        key: _stateKey,
                                        controller: _stateController,
                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.red,
                                              width: 2,
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.red,
                                              width: 2,
                                            ),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            vertical: 5,
                                            horizontal: 12,
                                          ),
                                          errorStyle: const TextStyle(
                                            color: Colors.red,
                                            fontSize: 12,
                                          ),
                                        ),
                                        keyboardType: TextInputType
                                            .text, // Ensures numeric input
                                        onChanged: (value) {
                                          setState(() {
                                            //_selectedJobReference = value;
                                            // Update the number of donors and the text controller
                                            _stateController.text =
                                                value; // Manually update the controller text
                                            _stateKey.currentState!.validate();
                                          });
                                        },
                                        validator: (value) {
                                          if (_stateController.text == "") {
                                            return 'Please enter the state name';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 0.0,
                              top: 15.0,
                              right: 0.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Postcode *",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 0.0),
                                  child: Container(
                                    height: 40,
                                    width: 80,
                                    child: Material(
                                      elevation:
                                          4, // Adjust this value for more or less elevation
                                      shadowColor: Colors.black.withOpacity(
                                          0.5), // Optional: Adjust shadow color
                                      borderRadius: BorderRadius.circular(
                                          4), // Match with TextFormField's border radius
                                      child: TextFormField(
                                        key: _postCodeKey,
                                        controller: _postCodeController,
                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.red,
                                              width: 2,
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.red,
                                              width: 2,
                                            ),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            vertical: 5,
                                            horizontal: 12,
                                          ),
                                          errorStyle: const TextStyle(
                                            color: Colors.red,
                                            fontSize: 12,
                                          ),
                                        ),
                                        keyboardType: TextInputType
                                            .text, // Ensures numeric input
                                        onChanged: (value) {
                                          setState(() {
                                            //_selectedJobReference = value;
                                            // Update the number of donors and the text controller
                                            _postCodeController.text =
                                                value; // Manually update the controller text
                                            _postCodeKey.currentState!
                                                .validate();
                                          });
                                        },
                                        validator: (value) {
                                          if (_postCodeController.text == "") {
                                            return 'Please enter a valid post code';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            child: SizedBox(
              width: double.infinity,
              child: Card(
                surfaceTintColor: Colors.white,
                color: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 12.0,
                    bottom: 12.0,
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Left-aligned title
                          Row(
                            children: [
                              Text(
                                "Callout Client",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Left-aligned title
                          Row(
                            children: [
                              Text(
                                "General Callout Instructions",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Transform.scale(
                                scale: 0.7,
                                child: Switch(
                                  activeColor: Colors.white,
                                  activeTrackColor: Colors.black,
                                  value: isMobileClinic,
                                  onChanged: (value) {
                                    setState(() {
                                      isMobileClinic = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          Container(
                            height: 230,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(
                                  0xFFE6F7FA), // Light blue background
                              borderRadius: BorderRadius.circular(19),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 9.0, left: 9.0, top: 9.0, bottom: 9.0),
                              child: Container(
                                height: 230,
                                width: double.infinity,
                                child: Material(
                                  elevation: 4,
                                  shadowColor: Colors.black.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(15),
                                  child: TextFormField(
                                    key: _calloutInstructionsKey,
                                    controller: _calloutInstructionsController,
                                    maxLines:
                                        null, // Makes the text field expandable
                                    minLines: 8,
                                    decoration: InputDecoration(
                                      hintText: '',
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: BorderSide
                                            .none, // Removes border outline
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: const BorderSide(
                                          color: Colors
                                              .white, // Set the border color to grey when focused
                                          width:
                                              2, // Optional: Adjust the width for better visibility
                                        ),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        vertical: 15,
                                        horizontal: 12,
                                      ),
                                    ),
                                    keyboardType: TextInputType.multiline,
                                    onChanged: (value) {
                                      setState(() {
                                        _calloutInstructionsController.text =
                                            value;
                                        _calloutInstructionsKey.currentState
                                            ?.validate();
                                      });
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter a valid callout instructions';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).viewInsets.bottom > 0
                            ? MediaQuery.of(context).viewInsets.bottom + 5
                            : 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Color for the Back button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    minimumSize:
                        Size(80, 30), // Sets a minimum width and height
                  ),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: _nextStep,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Color for the Next button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    minimumSize: Size(80, 30),
                  ),
                  child: const Text(
                    "Next",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
        ]);
      case 1:
        return Column(children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            child: SizedBox(
              width: double.infinity,
              height: 80,
              child: Card(
                surfaceTintColor: Colors.white,
                color: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 12.0,
                    bottom: 12.0,
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(
                                0xFFE6F7FA), // Light blue background
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize
                                .min, // Ensures Column takes only required space
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16), // Padding
                                decoration: BoxDecoration(
                                  color:
                                      Colors.grey[600], // Light blue background
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      '2',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Container(
                                      height: 20,
                                      width: 2,
                                      color: Colors.white, // Vertical divider
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      'Authorized Representatives',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          /* Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            child: Card(
              surfaceTintColor: Colors.white,
              color: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 12.0,
                  bottom: 12.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Left-aligned title
                          Row(
                            children: [
                              Text(
                                "Authorized Representatives",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 0.0,
                              top: 15.0,
                              right: 0.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: const Text(
                                    "Number of Representatives",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      color: Color(0xFF94A3B8),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 61,
                                  height: 26,
                                  decoration: BoxDecoration(
                                    color: Colors
                                        .transparent, // No background color
                                    border: Border.all(
                                      color: Color(
                                          0x8C808080), // Border color with 55% opacity
                                      width: 1.5, // Adjust thickness as needed
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        2), // Optional: rounded corners
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                        numberOfRepresentatives.toString()),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color.fromRGBO(
                                        26, 140, 255, 1.0), // Blue color
                                    foregroundColor: Colors.white, // Text color
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 1), // Adjust padding
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          6), // Slightly rounded edges
                                    ),
                                    textStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight:
                                          FontWeight.w500, // Medium weight text
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      numberOfRepresentatives++;
                                    });
                                  },
                                  child: Text(
                                    "Add New",
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: numberOfRepresentatives,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  AuthorizedRepresentatives(
                                    numberOfRepresentatives:
                                        numberOfRepresentatives,
                                    representativeNumber: index + 1,
                                    onDelete: removeRepresentative,
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                ],
                              );
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
          ), */
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            child: Card(
              surfaceTintColor: Colors.white,
              color: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 12.0,
                  bottom: 12.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Left-aligned title
                          Row(
                            children: [
                              Text(
                                "Authorized Representatives",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 0.0,
                              top: 15.0,
                              right: 0.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: const Text(
                                    "Number of Representatives",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      color: Color(0xFF94A3B8),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 61,
                                  height: 26,
                                  decoration: BoxDecoration(
                                    color: Colors
                                        .transparent, // No background color
                                    border: Border.all(
                                      color: Color(
                                          0x8C808080), // Border color with 55% opacity
                                      width: 1.5, // Adjust thickness as needed
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        2), // Optional: rounded corners
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                        numberOfRepresentatives.toString()),
                                  ),
                                ),
                                addNewOpened
                                    ? ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Colors.grey, // Blue color
                                          foregroundColor:
                                              Colors.white, // Text color
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 1), // Adjust padding
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                6), // Slightly rounded edges
                                          ),
                                          textStyle: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight
                                                .w500, // Medium weight text
                                          ),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            //numberOfRepresentatives++;
                                            addNewOpened = true;
                                          });
                                        },
                                        child: Text(
                                          "Add New",
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                      )
                                    : ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color.fromRGBO(
                                              26, 140, 255, 1.0), // Blue color
                                          foregroundColor:
                                              Colors.white, // Text color
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 1), // Adjust padding
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                6), // Slightly rounded edges
                                          ),
                                          textStyle: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight
                                                .w500, // Medium weight text
                                          ),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            //numberOfRepresentatives++;
                                            addNewOpened = true;
                                          });
                                        },
                                        child: Text(
                                          "Add New",
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                      )
                              ],
                            ),
                          ),
                          /* SizedBox(
                            height: 1,
                          ), */
                          Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              ListView.builder(
                                padding: EdgeInsets.zero,
                                key: ValueKey(representatives
                                    .length), // Ensures the list updates correctly
                                scrollDirection: Axis.vertical,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: representatives.length,
                                itemBuilder: (context, index) {
                                  final representative = representatives[index];
                                  return Column(
                                    key: ValueKey(representative.id),
                                    children: [
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: const Color(
                                              0xFFE6F7FA), // Light blue background
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 12.0,
                                                top: 15.0,
                                                right: 12.0,
                                              ),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 8.0,
                                                      bottom: 5.0,
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Text(
                                                            "Representative ${(index + 1)}",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            deleteRepresentative(
                                                                representative
                                                                    .id); // Delete by ID
                                                          },
                                                          child: FittedBox(
                                                            fit: BoxFit.contain,
                                                            child: Image.asset(
                                                                "assets/images/icons/delete.png"),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 8.0,
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: const Text(
                                                        "Authorized Representative *",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 13,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      right: 0.0,
                                                      top: 5,
                                                    ),
                                                    child: Container(
                                                      height: 40,
                                                      width: double.infinity,
                                                      child: Material(
                                                        elevation:
                                                            4, // Adjust this value for more or less elevation
                                                        shadowColor: Colors
                                                            .black
                                                            .withOpacity(
                                                                0.5), // Optional: Adjust shadow color
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                4), // Match with TextFormField's border radius
                                                        child: TextFormField(
                                                          readOnly: true,
                                                          initialValue:
                                                              representative
                                                                  .representativeName,
                                                          decoration:
                                                              InputDecoration(
                                                            fillColor:
                                                                Colors.white,
                                                            filled: true,
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color:
                                                                    Colors.red,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color:
                                                                    Colors.red,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            contentPadding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              vertical: 5,
                                                              horizontal: 12,
                                                            ),
                                                            errorStyle:
                                                                const TextStyle(
                                                              color: Colors.red,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                          keyboardType:
                                                              TextInputType
                                                                  .text, // Ensures numeric input
                                                          onChanged: (value) {
                                                            setState(() {});
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 8.0,
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: const Text(
                                                        "Mobile *",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 13,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      right: 0.0,
                                                      top: 5.0,
                                                    ),
                                                    child: Container(
                                                      height: 40,
                                                      width: double.infinity,
                                                      child: Material(
                                                        elevation:
                                                            4, // Adjust this value for more or less elevation
                                                        shadowColor: Colors
                                                            .black
                                                            .withOpacity(
                                                                0.5), // Optional: Adjust shadow color
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                4), // Match with TextFormField's border radius
                                                        child: TextFormField(
                                                          readOnly: true,
                                                          initialValue:
                                                              representative
                                                                  .mobile,
                                                          decoration:
                                                              InputDecoration(
                                                            fillColor:
                                                                Colors.white,
                                                            filled: true,
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color:
                                                                    Colors.red,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color:
                                                                    Colors.red,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            contentPadding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              vertical: 5,
                                                              horizontal: 12,
                                                            ),
                                                            errorStyle:
                                                                const TextStyle(
                                                              color: Colors.red,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                          keyboardType:
                                                              TextInputType
                                                                  .phone, // Ensures numeric input
                                                          onChanged: (value) {
                                                            setState(() {
                                                              // Update the number of donors and the text controller
                                                              /*  _mobile_Controller.text =
                                                                  value; // Manually update the controller text
                                                              _mobileKey.currentState!
                                                                  .validate(); */
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 8.0,
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Text(
                                                        "Position",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 13,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      right: 0.0,
                                                      top: 5.0,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 0.0),
                                                      child: Container(
                                                        height: 40,
                                                        width: double.infinity,
                                                        child: Material(
                                                          elevation:
                                                              4, // Adjust this value for more or less elevation
                                                          shadowColor: Colors
                                                              .black
                                                              .withOpacity(
                                                                  0.5), // Optional: Adjust shadow color
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  4), // Match with TextFormField's border radius
                                                          child: TextFormField(
                                                            readOnly: true,
                                                            initialValue:
                                                                representative
                                                                    .position,
                                                            decoration:
                                                                InputDecoration(
                                                              fillColor:
                                                                  Colors.white,
                                                              filled: true,
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Colors
                                                                      .white,
                                                                  width: 2,
                                                                ),
                                                              ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Colors
                                                                      .white,
                                                                  width: 2,
                                                                ),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Colors
                                                                      .white,
                                                                  width: 2,
                                                                ),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Colors
                                                                      .red,
                                                                  width: 2,
                                                                ),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Colors
                                                                      .red,
                                                                  width: 2,
                                                                ),
                                                              ),
                                                              contentPadding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                vertical: 5,
                                                                horizontal: 12,
                                                              ),
                                                              errorStyle:
                                                                  const TextStyle(
                                                                color:
                                                                    Colors.red,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                            keyboardType:
                                                                TextInputType
                                                                    .text, // Ensures numeric input
                                                            onChanged: (value) {
                                                              setState(() {
                                                                //_selectedJobReference = value;
                                                                // Update the number of donors and the text controller
                                                              });
                                                            },
                                                            validator: (value) {
                                                              if (_positionController
                                                                      .text ==
                                                                  "") {
                                                                return 'Please enter a correct position';
                                                              }
                                                              return null;
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 8.0,
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Text(
                                                        "Email *",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 13,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 0.0),
                                                    child: Container(
                                                      height: 40,
                                                      width: double.infinity,
                                                      child: Material(
                                                        elevation:
                                                            4, // Adjust this value for more or less elevation
                                                        shadowColor: Colors
                                                            .black
                                                            .withOpacity(
                                                                0.5), // Optional: Adjust shadow color
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                4), // Match with TextFormField's border radius
                                                        child: TextFormField(
                                                          readOnly: true,
                                                          initialValue:
                                                              representative
                                                                  .email,
                                                          decoration:
                                                              InputDecoration(
                                                            fillColor:
                                                                Colors.white,
                                                            filled: true,
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color:
                                                                    Colors.red,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color:
                                                                    Colors.red,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            contentPadding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              vertical: 5,
                                                              horizontal: 12,
                                                            ),
                                                            errorStyle:
                                                                const TextStyle(
                                                              color: Colors.red,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                          keyboardType:
                                                              TextInputType
                                                                  .text, // Ensures numeric input
                                                          onChanged: (value) {
                                                            setState(() {
                                                              //_selectedJobReference = value;
                                                              // Update the number of donors and the text controller
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          addNewOpened
                              ? AuthorizedRepresentatives(
                                  key: _siteRepresentativeKey,
                                  onCreate: addRepresentative,
                                  onClose: closeSiteContact)
                              : SizedBox(
                                  height: 0,
                                ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
          ),
        ]);
      case 2:
        return Column(children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            child: SizedBox(
              width: double.infinity,
              height: 80,
              child: Card(
                surfaceTintColor: Colors.white,
                color: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 12.0,
                    bottom: 12.0,
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(
                                0xFFE6F7FA), // Light blue background
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Column(
                              mainAxisSize: MainAxisSize
                                  .min, // Ensures Column takes only required space
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 16), // Padding
                                  decoration: BoxDecoration(
                                    color: Colors
                                        .grey[600], // Light blue background
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        '3',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Container(
                                        height: 20,
                                        width: 2,
                                        color: Colors.white, // Vertical divider
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'Client Specifications',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                        ),
                      ]),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            child: Card(
              surfaceTintColor: Colors.white,
              color: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 12.0,
                  bottom: 12.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Left-aligned title
                        Row(
                          children: [
                            Text(
                              "Testing Specifications",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text("In House"),
                                Radio<ClientSpec>(
                                  value: ClientSpec.inHouse,
                                  groupValue: _clientSpecType,
                                  onChanged: (ClientSpec? value) {
                                    setState(() {
                                      _clientSpecType = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text("Mobile Clinic"),
                                Radio<ClientSpec>(
                                  value: ClientSpec.mobileClinic,
                                  groupValue: _clientSpecType,
                                  onChanged: (ClientSpec? value) {
                                    setState(() {
                                      _clientSpecType = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 160,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(
                                0xFFE6F7FA), // Light blue background
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 24.0,
                                  top: 4.0,
                                  bottom: 2.0,
                                ),
                                child: Row(
                                  children: [
                                    Radio<TestsType>(
                                      value: TestsType.alcoholOnly,
                                      groupValue: _testsType,
                                      onChanged: (TestsType? value) {
                                        setState(() {
                                          _testsType = value;
                                        });
                                      },
                                    ),
                                    const Text(
                                      'Alcohol Test Only',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 0), // Adjust the gap
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 24.0,
                                ),
                                child: Row(
                                  children: [
                                    Radio<TestsType>(
                                      value: TestsType.alcoholAndDrug,
                                      groupValue: _testsType,
                                      onChanged: (TestsType? value) {
                                        setState(() {
                                          _testsType = value;
                                        });
                                      },
                                    ),
                                    const Text(
                                      'Alcohol and Drug Test',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 0), // Adjust the gap
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 24.0,
                                  bottom: 8.0,
                                ),
                                child: Row(
                                  children: [
                                    Radio<TestsType>(
                                      value: TestsType.DrugOnly,
                                      groupValue: _testsType,
                                      onChanged: (TestsType? value) {
                                        setState(() {
                                          _testsType = value;
                                        });
                                      },
                                    ),
                                    const Text(
                                      'Drug Test Only',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        _testsType == TestsType.alcoholOnly
                            ? Container(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Left-aligned title
                                        Row(
                                          children: [
                                            Text(
                                              "Breath Alcohol Test Limits",
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 0.0,
                                        top: 15.0,
                                        right: 0.0,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: const Text(
                                              "Category 1",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 40,
                                              child: Material(
                                                elevation:
                                                    4, // Adjust this value for more or less elevation
                                                shadowColor: Colors.black
                                                    .withOpacity(
                                                        0.5), // Optional: Adjust shadow color
                                                borderRadius: BorderRadius.circular(
                                                    4), // Match with TextFormField's border radius
                                                child: TextFormField(
                                                  key: _category1Key,
                                                  controller:
                                                      _category1_Controller,
                                                  decoration: InputDecoration(
                                                    fillColor: Colors.white,
                                                    filled: true,
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: Colors.white,
                                                        width: 2,
                                                      ),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: Colors.white,
                                                        width: 2,
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: Colors.white,
                                                        width: 2,
                                                      ),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: Colors.red,
                                                        width: 2,
                                                      ),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: Colors.red,
                                                        width: 2,
                                                      ),
                                                    ),
                                                    contentPadding:
                                                        const EdgeInsets
                                                            .symmetric(
                                                      vertical: 5,
                                                      horizontal: 12,
                                                    ),
                                                    errorStyle: const TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  keyboardType: TextInputType
                                                      .text, // Ensures numeric input
                                                  onChanged: (value) {
                                                    setState(() {
                                                      // Update the number of donors and the text controller
                                                      _category1_Controller
                                                              .text =
                                                          value; // Manually update the controller text
                                                      _category1Key
                                                          .currentState!
                                                          .validate();
                                                    });
                                                  },
                                                  validator: (value) {
                                                    if (_category1_Controller
                                                            .text ==
                                                        "") {
                                                      return 'Please enter a valid category 1 name';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text(
                                                      "Limit (g/210L)",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 13,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 0.0),
                                                    child: Container(
                                                      width: 160,
                                                      height: 40,
                                                      child: Material(
                                                        elevation:
                                                            4, // Adjust this value for more or less elevation
                                                        shadowColor: Colors
                                                            .black
                                                            .withOpacity(
                                                                0.5), // Optional: Adjust shadow color
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                4), // Match with TextFormField's border radius
                                                        child: TextFormField(
                                                          key:
                                                              _category1Limit210L,
                                                          controller:
                                                              _category1LimitGController,
                                                          decoration:
                                                              InputDecoration(
                                                            fillColor:
                                                                Colors.white,
                                                            filled: true,
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color:
                                                                    Colors.red,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color:
                                                                    Colors.red,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            contentPadding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              vertical: 5,
                                                              horizontal: 12,
                                                            ),
                                                            errorStyle:
                                                                const TextStyle(
                                                              color: Colors.red,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                          keyboardType:
                                                              TextInputType
                                                                  .text, // Ensures numeric input
                                                          onChanged: (value) {
                                                            setState(() {
                                                              // Update the number of donors and the text controller
                                                              _category1LimitGController
                                                                      .text =
                                                                  value; // Manually update the controller text
                                                              _category1Limit210L
                                                                  .currentState!
                                                                  .validate();
                                                            });
                                                          },
                                                          validator: (value) {
                                                            if (_category1LimitGController
                                                                    .text ==
                                                                "") {
                                                              return 'Please enter a valid limit';
                                                            }
                                                            return null;
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text(
                                                      "Sit Out Time (minutes)",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 13,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 0.0),
                                                    child: Container(
                                                      width: 160,
                                                      height: 40,
                                                      child: Material(
                                                        elevation:
                                                            4, // Adjust this value for more or less elevation
                                                        shadowColor: Colors
                                                            .black
                                                            .withOpacity(
                                                                0.5), // Optional: Adjust shadow color
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                4), // Match with TextFormField's border radius
                                                        child: TextFormField(
                                                          key:
                                                              _category1SitoutTimeKey,
                                                          controller:
                                                              _category1SetLimitOutTimeController,
                                                          decoration:
                                                              InputDecoration(
                                                            fillColor:
                                                                Colors.white,
                                                            filled: true,
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color:
                                                                    Colors.red,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color:
                                                                    Colors.red,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            contentPadding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              vertical: 5,
                                                              horizontal: 12,
                                                            ),
                                                            errorStyle:
                                                                const TextStyle(
                                                              color: Colors.red,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                          keyboardType:
                                                              TextInputType
                                                                  .text, // Ensures numeric input
                                                          onChanged: (value) {
                                                            setState(() {
                                                              // Update the number of donors and the text controller
                                                              _category1SetLimitOutTimeController
                                                                      .text =
                                                                  value; // Manually update the controller text
                                                              _category1SitoutTimeKey
                                                                  .currentState!
                                                                  .validate();
                                                            });
                                                          },
                                                          validator: (value) {
                                                            if (_category1SetLimitOutTimeController
                                                                    .text ==
                                                                "") {
                                                              return 'Please enter a valid set out time';
                                                            }
                                                            return null;
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: List.generate(
                                              60, // Adjust the number of dashes
                                              (index) => Container(
                                                width: 4, // Width of each dash
                                                height:
                                                    2, // Height of each dash (thickness)
                                                color: Colors
                                                    .black, // Color of the dash
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 0.0,
                                        top: 15.0,
                                        right: 0.0,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: const Text(
                                              "Category 2",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 40,
                                              child: Material(
                                                elevation:
                                                    4, // Adjust this value for more or less elevation
                                                shadowColor: Colors.black
                                                    .withOpacity(
                                                        0.5), // Optional: Adjust shadow color
                                                borderRadius: BorderRadius.circular(
                                                    4), // Match with TextFormField's border radius
                                                child: TextFormField(
                                                  key: _category2Key,
                                                  controller:
                                                      _category2Controller,
                                                  decoration: InputDecoration(
                                                    fillColor: Colors.white,
                                                    filled: true,
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: Colors.white,
                                                        width: 2,
                                                      ),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: Colors.white,
                                                        width: 2,
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: Colors.white,
                                                        width: 2,
                                                      ),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: Colors.red,
                                                        width: 2,
                                                      ),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: Colors.red,
                                                        width: 2,
                                                      ),
                                                    ),
                                                    contentPadding:
                                                        const EdgeInsets
                                                            .symmetric(
                                                      vertical: 5,
                                                      horizontal: 12,
                                                    ),
                                                    errorStyle: const TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  keyboardType: TextInputType
                                                      .text, // Ensures numeric input
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _category2Key
                                                          .currentState!
                                                          .validate();
                                                      // Update the number of donors and the text controller
                                                      _category2Controller
                                                              .text =
                                                          value; // Manually update the controller text
                                                    });
                                                  },
                                                  validator: (value) {
                                                    if (_category2Controller
                                                            .text ==
                                                        "") {
                                                      return 'Please enter a valid category 2 name';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text(
                                                      "Limit (g/210L)",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 13,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 0.0),
                                                    child: Container(
                                                      width: 160,
                                                      height: 40,
                                                      child: Material(
                                                        elevation:
                                                            4, // Adjust this value for more or less elevation
                                                        shadowColor: Colors
                                                            .black
                                                            .withOpacity(
                                                                0.5), // Optional: Adjust shadow color
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                4), // Match with TextFormField's border radius
                                                        child: TextFormField(
                                                          key:
                                                              _category2Limit210L,
                                                          controller:
                                                              _category2LimitGController,
                                                          decoration:
                                                              InputDecoration(
                                                            fillColor:
                                                                Colors.white,
                                                            filled: true,
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color:
                                                                    Colors.red,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color:
                                                                    Colors.red,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            contentPadding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              vertical: 5,
                                                              horizontal: 12,
                                                            ),
                                                            errorStyle:
                                                                const TextStyle(
                                                              color: Colors.red,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                          keyboardType:
                                                              TextInputType
                                                                  .text, // Ensures numeric input
                                                          onChanged: (value) {
                                                            setState(() {
                                                              _category2Limit210L
                                                                  .currentState!
                                                                  .validate();
                                                              // Update the number of donors and the text controller
                                                              _category2LimitGController
                                                                      .text =
                                                                  value; // Manually update the controller text
                                                            });
                                                          },
                                                          validator: (value) {
                                                            if (_category2LimitGController
                                                                    .text ==
                                                                "") {
                                                              return 'Please enter a valid limit';
                                                            }
                                                            return null;
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text(
                                                      "Sit Out Time (minutes)",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 13,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 0.0),
                                                    child: Container(
                                                      width: 160,
                                                      height: 40,
                                                      child: Material(
                                                        elevation:
                                                            4, // Adjust this value for more or less elevation
                                                        shadowColor: Colors
                                                            .black
                                                            .withOpacity(
                                                                0.5), // Optional: Adjust shadow color
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                4), // Match with TextFormField's border radius
                                                        child: TextFormField(
                                                          key:
                                                              _category2SitoutTimeKey,
                                                          controller:
                                                              _category2SetLimitOutTimeController,
                                                          decoration:
                                                              InputDecoration(
                                                            fillColor:
                                                                Colors.white,
                                                            filled: true,
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color:
                                                                    Colors.red,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color:
                                                                    Colors.red,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            contentPadding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              vertical: 5,
                                                              horizontal: 12,
                                                            ),
                                                            errorStyle:
                                                                const TextStyle(
                                                              color: Colors.red,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                          keyboardType:
                                                              TextInputType
                                                                  .text, // Ensures numeric input
                                                          onChanged: (value) {
                                                            setState(() {
                                                              _category2SitoutTimeKey
                                                                  .currentState!
                                                                  .validate();
                                                              // Update the number of donors and the text controller
                                                              _category2SetLimitOutTimeController
                                                                      .text =
                                                                  value; // Manually update the controller text
                                                            });
                                                          },
                                                          validator: (value) {
                                                            if (_category2SetLimitOutTimeController
                                                                    .text ==
                                                                "") {
                                                              return 'Please enter a valid sit out time';
                                                            }
                                                            return null;
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: List.generate(
                                              60, // Adjust the number of dashes
                                              (index) => Container(
                                                width: 4, // Width of each dash
                                                height:
                                                    2, // Height of each dash (thickness)
                                                color: Colors
                                                    .black, // Color of the dash
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 0.0,
                                        top: 15.0,
                                        right: 0.0,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: const Text(
                                              "Category 3",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 40,
                                              child: Material(
                                                elevation:
                                                    4, // Adjust this value for more or less elevation
                                                shadowColor: Colors.black
                                                    .withOpacity(
                                                        0.5), // Optional: Adjust shadow color
                                                borderRadius: BorderRadius.circular(
                                                    4), // Match with TextFormField's border radius
                                                child: TextFormField(
                                                  key: _category3Key,
                                                  controller:
                                                      _siteContact_3_Controller,
                                                  decoration: InputDecoration(
                                                    fillColor: Colors.white,
                                                    filled: true,
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: Colors.white,
                                                        width: 2,
                                                      ),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: Colors.white,
                                                        width: 2,
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: Colors.white,
                                                        width: 2,
                                                      ),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: Colors.red,
                                                        width: 2,
                                                      ),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: Colors.red,
                                                        width: 2,
                                                      ),
                                                    ),
                                                    contentPadding:
                                                        const EdgeInsets
                                                            .symmetric(
                                                      vertical: 5,
                                                      horizontal: 12,
                                                    ),
                                                    errorStyle: const TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  keyboardType: TextInputType
                                                      .text, // Ensures numeric input
                                                  onChanged: (value) {
                                                    setState(() {
                                                      // Update the number of donors and the text controller
                                                      _siteContact_3_Controller
                                                              .text =
                                                          value; // Manually update the controller text
                                                      _category3Key
                                                          .currentState!
                                                          .validate();
                                                    });
                                                  },
                                                  validator: (value) {
                                                    if (_siteContact_3_Controller
                                                            .text ==
                                                        "") {
                                                      return 'Please enter a valid category name';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text(
                                                      "Limit (g/210L)",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 13,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 0.0),
                                                    child: Container(
                                                      width: 160,
                                                      height: 40,
                                                      child: Material(
                                                        elevation:
                                                            4, // Adjust this value for more or less elevation
                                                        shadowColor: Colors
                                                            .black
                                                            .withOpacity(
                                                                0.5), // Optional: Adjust shadow color
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                4), // Match with TextFormField's border radius
                                                        child: TextFormField(
                                                          key:
                                                              _category3Limit210L,
                                                          controller:
                                                              _category3LimitGController,
                                                          decoration:
                                                              InputDecoration(
                                                            fillColor:
                                                                Colors.white,
                                                            filled: true,
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color:
                                                                    Colors.red,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color:
                                                                    Colors.red,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            contentPadding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              vertical: 5,
                                                              horizontal: 12,
                                                            ),
                                                            errorStyle:
                                                                const TextStyle(
                                                              color: Colors.red,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                          keyboardType:
                                                              TextInputType
                                                                  .text, // Ensures numeric input
                                                          onChanged: (value) {
                                                            setState(() {
                                                              // Update the number of donors and the text controller
                                                              _category3LimitGController
                                                                      .text =
                                                                  value; // Manually update the controller text
                                                              _category3Limit210L
                                                                  .currentState!
                                                                  .validate();
                                                            });
                                                          },
                                                          validator: (value) {
                                                            if (_category3LimitGController
                                                                    .text ==
                                                                "") {
                                                              return 'Please enter a valid limit';
                                                            }
                                                            return null;
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text(
                                                      "Sit Out Time (minutes)",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 13,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 0.0),
                                                    child: Container(
                                                      width: 160,
                                                      height: 40,
                                                      child: Material(
                                                        elevation:
                                                            4, // Adjust this value for more or less elevation
                                                        shadowColor: Colors
                                                            .black
                                                            .withOpacity(
                                                                0.5), // Optional: Adjust shadow color
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                4), // Match with TextFormField's border radius
                                                        child: TextFormField(
                                                          key:
                                                              _category3SitoutTimeKey,
                                                          controller:
                                                              _category3SetLimitOutTimeController,
                                                          decoration:
                                                              InputDecoration(
                                                            fillColor:
                                                                Colors.white,
                                                            filled: true,
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color:
                                                                    Colors.red,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color:
                                                                    Colors.red,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            contentPadding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              vertical: 5,
                                                              horizontal: 12,
                                                            ),
                                                            errorStyle:
                                                                const TextStyle(
                                                              color: Colors.red,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                          keyboardType:
                                                              TextInputType
                                                                  .text, // Ensures numeric input
                                                          onChanged: (value) {
                                                            setState(() {
                                                              // Update the number of donors and the text controller
                                                              _category3SetLimitOutTimeController
                                                                      .text =
                                                                  value; // Manually update the controller text

                                                              _category3SitoutTimeKey
                                                                  .currentState!
                                                                  .validate();
                                                            });
                                                          },
                                                          validator: (value) {
                                                            if (_category3SetLimitOutTimeController
                                                                    .text ==
                                                                "") {
                                                              return 'Please enter a valid site out time';
                                                            }
                                                            return null;
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: List.generate(
                                              60, // Adjust the number of dashes
                                              (index) => Container(
                                                width: 4, // Width of each dash
                                                height:
                                                    2, // Height of each dash (thickness)
                                                color: Colors
                                                    .black, // Color of the dash
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              )
                            : _testsType == TestsType.alcoholAndDrug
                                ? Container(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            // Left-aligned title
                                            Row(
                                              children: [
                                                Text(
                                                  "Breath Alcohol Test Limits",
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 0.0,
                                            top: 15.0,
                                            right: 0.0,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: const Text(
                                                  "Category 1",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 40,
                                                  child: Material(
                                                    elevation:
                                                        4, // Adjust this value for more or less elevation
                                                    shadowColor: Colors.black
                                                        .withOpacity(
                                                            0.5), // Optional: Adjust shadow color
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4), // Match with TextFormField's border radius
                                                    child: TextFormField(
                                                      key: _category1Key,
                                                      controller:
                                                          _category1_Controller,
                                                      decoration:
                                                          InputDecoration(
                                                        fillColor: Colors.white,
                                                        filled: true,
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.white,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.white,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.white,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.red,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.red,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          vertical: 5,
                                                          horizontal: 12,
                                                        ),
                                                        errorStyle:
                                                            const TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      keyboardType: TextInputType
                                                          .text, // Ensures numeric input
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _category1Key
                                                              .currentState!
                                                              .validate();
                                                          // Update the number of donors and the text controller
                                                          _category1_Controller
                                                                  .text =
                                                              value; // Manually update the controller text
                                                        });
                                                      },
                                                      validator: (value) {
                                                        if (_category1_Controller
                                                                .text ==
                                                            "") {
                                                          return 'Please enter a valid category';
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Text(
                                                          "Limit (g/210L)",
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 13,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 0.0),
                                                        child: Container(
                                                          width: 160,
                                                          height: 40,
                                                          child: Material(
                                                            elevation:
                                                                4, // Adjust this value for more or less elevation
                                                            shadowColor: Colors
                                                                .black
                                                                .withOpacity(
                                                                    0.5), // Optional: Adjust shadow color
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4), // Match with TextFormField's border radius
                                                            child:
                                                                TextFormField(
                                                              key:
                                                                  _category1Limit210L,
                                                              controller:
                                                                  _category1LimitGController,
                                                              decoration:
                                                                  InputDecoration(
                                                                fillColor:
                                                                    Colors
                                                                        .white,
                                                                filled: true,
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .red,
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .red,
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                contentPadding:
                                                                    const EdgeInsets
                                                                        .symmetric(
                                                                  vertical: 5,
                                                                  horizontal:
                                                                      12,
                                                                ),
                                                                errorStyle:
                                                                    const TextStyle(
                                                                  color: Colors
                                                                      .red,
                                                                  fontSize: 12,
                                                                ),
                                                              ),
                                                              keyboardType:
                                                                  TextInputType
                                                                      .text, // Ensures numeric input
                                                              onChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  _category1Limit210L
                                                                      .currentState!
                                                                      .validate();
                                                                  // Update the number of donors and the text controller
                                                                  _category1LimitGController
                                                                          .text =
                                                                      value; // Manually update the controller text
                                                                });
                                                              },
                                                              validator:
                                                                  (value) {
                                                                if (_category1LimitGController
                                                                        .text ==
                                                                    "") {
                                                                  return 'Please enter a valid limit';
                                                                }
                                                                return null;
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Text(
                                                          "Sit Out Time (minutes)",
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 13,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 0.0),
                                                        child: Container(
                                                          width: 160,
                                                          height: 40,
                                                          child: Material(
                                                            elevation:
                                                                4, // Adjust this value for more or less elevation
                                                            shadowColor: Colors
                                                                .black
                                                                .withOpacity(
                                                                    0.5), // Optional: Adjust shadow color
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4), // Match with TextFormField's border radius
                                                            child:
                                                                TextFormField(
                                                              key:
                                                                  _category1SitoutTimeKey,
                                                              controller:
                                                                  _category1SetLimitOutTimeController,
                                                              decoration:
                                                                  InputDecoration(
                                                                fillColor:
                                                                    Colors
                                                                        .white,
                                                                filled: true,
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .red,
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .red,
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                contentPadding:
                                                                    const EdgeInsets
                                                                        .symmetric(
                                                                  vertical: 5,
                                                                  horizontal:
                                                                      12,
                                                                ),
                                                                errorStyle:
                                                                    const TextStyle(
                                                                  color: Colors
                                                                      .red,
                                                                  fontSize: 12,
                                                                ),
                                                              ),
                                                              keyboardType:
                                                                  TextInputType
                                                                      .text, // Ensures numeric input
                                                              onChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  _category1SitoutTimeKey
                                                                      .currentState!
                                                                      .validate();
                                                                  // Update the number of donors and the text controller
                                                                  _category1SetLimitOutTimeController
                                                                          .text =
                                                                      value; // Manually update the controller text
                                                                });
                                                              },
                                                              validator:
                                                                  (value) {
                                                                if (_category1SetLimitOutTimeController
                                                                        .text ==
                                                                    "") {
                                                                  return 'Please enter a valid set limit out time';
                                                                }
                                                                return null;
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: List.generate(
                                                  60, // Adjust the number of dashes
                                                  (index) => Container(
                                                    width:
                                                        4, // Width of each dash
                                                    height:
                                                        2, // Height of each dash (thickness)
                                                    color: Colors
                                                        .black, // Color of the dash
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 0.0,
                                            top: 15.0,
                                            right: 0.0,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: const Text(
                                                  "Category 2",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 40,
                                                  child: Material(
                                                    elevation:
                                                        4, // Adjust this value for more or less elevation
                                                    shadowColor: Colors.black
                                                        .withOpacity(
                                                            0.5), // Optional: Adjust shadow color
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4), // Match with TextFormField's border radius
                                                    child: TextFormField(
                                                      key: _category2Key,
                                                      controller:
                                                          _category2Controller,
                                                      decoration:
                                                          InputDecoration(
                                                        fillColor: Colors.white,
                                                        filled: true,
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.white,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.white,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.white,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.red,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.red,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          vertical: 5,
                                                          horizontal: 12,
                                                        ),
                                                        errorStyle:
                                                            const TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      keyboardType: TextInputType
                                                          .text, // Ensures numeric input
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _category2Key
                                                              .currentState!
                                                              .validate();
                                                          // Update the number of donors and the text controller
                                                          _category2Controller
                                                                  .text =
                                                              value; // Manually update the controller text
                                                        });
                                                      },
                                                      validator: (value) {
                                                        if (_category2Controller
                                                                .text ==
                                                            "") {
                                                          return 'Please enter a valid category';
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Text(
                                                          "Limit (g/210L)",
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 13,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 0.0),
                                                        child: Container(
                                                          width: 160,
                                                          height: 40,
                                                          child: Material(
                                                            elevation:
                                                                4, // Adjust this value for more or less elevation
                                                            shadowColor: Colors
                                                                .black
                                                                .withOpacity(
                                                                    0.5), // Optional: Adjust shadow color
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4), // Match with TextFormField's border radius
                                                            child:
                                                                TextFormField(
                                                              key:
                                                                  _category2Limit210L,
                                                              controller:
                                                                  _category2LimitGController,
                                                              decoration:
                                                                  InputDecoration(
                                                                fillColor:
                                                                    Colors
                                                                        .white,
                                                                filled: true,
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .red,
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .red,
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                contentPadding:
                                                                    const EdgeInsets
                                                                        .symmetric(
                                                                  vertical: 5,
                                                                  horizontal:
                                                                      12,
                                                                ),
                                                                errorStyle:
                                                                    const TextStyle(
                                                                  color: Colors
                                                                      .red,
                                                                  fontSize: 12,
                                                                ),
                                                              ),
                                                              keyboardType:
                                                                  TextInputType
                                                                      .text, // Ensures numeric input
                                                              onChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  _category2Limit210L
                                                                      .currentState!
                                                                      .validate();
                                                                  // Update the number of donors and the text controller
                                                                  _category2LimitGController
                                                                          .text =
                                                                      value; // Manually update the controller text
                                                                });
                                                              },
                                                              validator:
                                                                  (value) {
                                                                if (_category2LimitGController
                                                                        .text ==
                                                                    "") {
                                                                  return 'Please enter a valid limit';
                                                                }
                                                                return null;
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Text(
                                                          "Sit Out Time (minutes)",
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 13,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 0.0),
                                                        child: Container(
                                                          width: 160,
                                                          height: 40,
                                                          child: Material(
                                                            elevation:
                                                                4, // Adjust this value for more or less elevation
                                                            shadowColor: Colors
                                                                .black
                                                                .withOpacity(
                                                                    0.5), // Optional: Adjust shadow color
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4), // Match with TextFormField's border radius
                                                            child:
                                                                TextFormField(
                                                              key:
                                                                  _category2SitoutTimeKey,
                                                              controller:
                                                                  _category2SetLimitOutTimeController,
                                                              decoration:
                                                                  InputDecoration(
                                                                fillColor:
                                                                    Colors
                                                                        .white,
                                                                filled: true,
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .red,
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .red,
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                contentPadding:
                                                                    const EdgeInsets
                                                                        .symmetric(
                                                                  vertical: 5,
                                                                  horizontal:
                                                                      12,
                                                                ),
                                                                errorStyle:
                                                                    const TextStyle(
                                                                  color: Colors
                                                                      .red,
                                                                  fontSize: 12,
                                                                ),
                                                              ),
                                                              keyboardType:
                                                                  TextInputType
                                                                      .text, // Ensures numeric input
                                                              onChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  _category2SitoutTimeKey
                                                                      .currentState!
                                                                      .validate();
                                                                  // Update the number of donors and the text controller
                                                                  _category2SetLimitOutTimeController
                                                                          .text =
                                                                      value; // Manually update the controller text
                                                                });
                                                              },
                                                              validator:
                                                                  (value) {
                                                                if (_category2SetLimitOutTimeController
                                                                        .text ==
                                                                    "") {
                                                                  return 'Please enter a valid sit out time';
                                                                }
                                                                return null;
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: List.generate(
                                                  60, // Adjust the number of dashes
                                                  (index) => Container(
                                                    width:
                                                        4, // Width of each dash
                                                    height:
                                                        2, // Height of each dash (thickness)
                                                    color: Colors
                                                        .black, // Color of the dash
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 0.0,
                                            top: 15.0,
                                            right: 0.0,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: const Text(
                                                  "Category 3",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 40,
                                                  child: Material(
                                                    elevation:
                                                        4, // Adjust this value for more or less elevation
                                                    shadowColor: Colors.black
                                                        .withOpacity(
                                                            0.5), // Optional: Adjust shadow color
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4), // Match with TextFormField's border radius
                                                    child: TextFormField(
                                                      key: _category3Key,
                                                      controller:
                                                          _siteContact_3_Controller,
                                                      decoration:
                                                          InputDecoration(
                                                        fillColor: Colors.white,
                                                        filled: true,
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.white,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.white,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.white,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.red,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.red,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          vertical: 5,
                                                          horizontal: 12,
                                                        ),
                                                        errorStyle:
                                                            const TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      keyboardType: TextInputType
                                                          .text, // Ensures numeric input
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _category3Key
                                                              .currentState!
                                                              .validate();

                                                          // Update the number of donors and the text controller
                                                          _siteContact_3_Controller
                                                                  .text =
                                                              value; // Manually update the controller text
                                                        });
                                                      },
                                                      validator: (value) {
                                                        if (_siteContact_3_Controller
                                                                .text ==
                                                            "") {
                                                          return 'Please enter a valid category name';
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Text(
                                                          "Limit (g/210L)",
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 13,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 0.0),
                                                        child: Container(
                                                          width: 160,
                                                          height: 40,
                                                          child: Material(
                                                            elevation:
                                                                4, // Adjust this value for more or less elevation
                                                            shadowColor: Colors
                                                                .black
                                                                .withOpacity(
                                                                    0.5), // Optional: Adjust shadow color
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4), // Match with TextFormField's border radius
                                                            child:
                                                                TextFormField(
                                                              key:
                                                                  _category3Limit210L,
                                                              controller:
                                                                  _category3LimitGController,
                                                              decoration:
                                                                  InputDecoration(
                                                                fillColor:
                                                                    Colors
                                                                        .white,
                                                                filled: true,
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .red,
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .red,
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                contentPadding:
                                                                    const EdgeInsets
                                                                        .symmetric(
                                                                  vertical: 5,
                                                                  horizontal:
                                                                      12,
                                                                ),
                                                                errorStyle:
                                                                    const TextStyle(
                                                                  color: Colors
                                                                      .red,
                                                                  fontSize: 12,
                                                                ),
                                                              ),
                                                              keyboardType:
                                                                  TextInputType
                                                                      .text, // Ensures numeric input
                                                              onChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  _category3Limit210L
                                                                      .currentState!
                                                                      .validate();
                                                                  // Update the number of donors and the text controller
                                                                  _category3LimitGController
                                                                          .text =
                                                                      value; // Manually update the controller text
                                                                });
                                                              },
                                                              validator:
                                                                  (value) {
                                                                if (_category3LimitGController
                                                                        .text ==
                                                                    "") {
                                                                  return 'Please enter a valid limit';
                                                                }
                                                                return null;
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Text(
                                                          "Sit Out Time (minutes)",
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 13,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 0.0),
                                                        child: Container(
                                                          width: 160,
                                                          height: 40,
                                                          child: Material(
                                                            elevation:
                                                                4, // Adjust this value for more or less elevation
                                                            shadowColor: Colors
                                                                .black
                                                                .withOpacity(
                                                                    0.5), // Optional: Adjust shadow color
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4), // Match with TextFormField's border radius
                                                            child:
                                                                TextFormField(
                                                              key:
                                                                  _category3SitoutTimeKey,
                                                              controller:
                                                                  _category3SetLimitOutTimeController,
                                                              decoration:
                                                                  InputDecoration(
                                                                fillColor:
                                                                    Colors
                                                                        .white,
                                                                filled: true,
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .red,
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .red,
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                contentPadding:
                                                                    const EdgeInsets
                                                                        .symmetric(
                                                                  vertical: 5,
                                                                  horizontal:
                                                                      12,
                                                                ),
                                                                errorStyle:
                                                                    const TextStyle(
                                                                  color: Colors
                                                                      .red,
                                                                  fontSize: 12,
                                                                ),
                                                              ),
                                                              keyboardType:
                                                                  TextInputType
                                                                      .text, // Ensures numeric input
                                                              onChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  _category3SitoutTimeKey
                                                                      .currentState!
                                                                      .validate();
                                                                  // Update the number of donors and the text controller
                                                                  _category3SetLimitOutTimeController
                                                                          .text ==
                                                                      value; // Manually update the controller text
                                                                });
                                                              },
                                                              validator:
                                                                  (value) {
                                                                if (_category3SetLimitOutTimeController
                                                                        .text ==
                                                                    "") {
                                                                  return 'Please enter a valid sit out time limit';
                                                                }
                                                                return null;
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: List.generate(
                                                  60, // Adjust the number of dashes
                                                  (index) => Container(
                                                    width:
                                                        4, // Width of each dash
                                                    height:
                                                        2, // Height of each dash (thickness)
                                                    color: Colors
                                                        .black, // Color of the dash
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            // Left-aligned title
                                            Row(
                                              children: [
                                                Text(
                                                  "Drug Test Specifications",
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 0.0,
                                            top: 15.0,
                                            right: 0.0,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: const Text(
                                                  "Primary Drug Test",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 40,
                                                  child: Material(
                                                    elevation:
                                                        4, // Adjust this value for more or less elevation
                                                    shadowColor: Colors.black
                                                        .withOpacity(
                                                            0.5), // Optional: Adjust shadow color
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4), // Match with TextFormField's border radius
                                                    child: TextFormField(
                                                      key:
                                                          _primaryTestSpecificationsKey,
                                                      controller:
                                                          _primaryDrugTestController,
                                                      decoration:
                                                          InputDecoration(
                                                        fillColor: Colors.white,
                                                        filled: true,
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.white,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.white,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.white,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.red,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.red,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          vertical: 5,
                                                          horizontal: 12,
                                                        ),
                                                        errorStyle:
                                                            const TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      keyboardType: TextInputType
                                                          .text, // Ensures numeric input
                                                      onChanged: (value) {
                                                        setState(() {
                                                          // Update the number of donors and the text controller
                                                          _primaryDrugTestController
                                                                  .text =
                                                              value; // Manually update the controller text
                                                          _primaryTestSpecificationsKey
                                                              .currentState!
                                                              .validate();
                                                        });
                                                      },
                                                      validator: (value) {
                                                        if (_primaryDrugTestController
                                                                .text ==
                                                            "") {
                                                          return 'Please enter the primary drug test name';
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 0.0,
                                            top: 15.0,
                                            right: 0.0,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: const Text(
                                                  "Select Preferred Device",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 40,
                                                  child: Material(
                                                    elevation:
                                                        4, // Adjust this value for more or less elevation
                                                    shadowColor: Colors.black
                                                        .withOpacity(
                                                            0.5), // Optional: Adjust shadow color
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4), // Match with TextFormField's border radius
                                                    child: TextFormField(
                                                      key:
                                                          _selectPreferedPrimaryDeviceKey,
                                                      controller:
                                                          _primaryDrugTestPreferredDeviceController,
                                                      decoration:
                                                          InputDecoration(
                                                        fillColor: Colors.white,
                                                        filled: true,
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.white,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.white,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.white,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.red,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.red,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          vertical: 5,
                                                          horizontal: 12,
                                                        ),
                                                        errorStyle:
                                                            const TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      keyboardType: TextInputType
                                                          .text, // Ensures numeric input
                                                      onChanged: (value) {
                                                        setState(() {
                                                          // Update the number of donors and the text controller
                                                          _primaryDrugTestPreferredDeviceController
                                                                  .text =
                                                              value; // Manually update the controller text
                                                          _selectPreferedPrimaryDeviceKey
                                                              .currentState!
                                                              .validate();
                                                        });
                                                      },
                                                      validator: (value) {
                                                        if (_primaryDrugTestPreferredDeviceController
                                                                .text ==
                                                            "") {
                                                          return 'Please enter the prefered Device name';
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: List.generate(
                                            60, // Adjust the number of dashes
                                            (index) => Container(
                                              width: 4, // Width of each dash
                                              height:
                                                  2, // Height of each dash (thickness)
                                              color: Colors
                                                  .black, // Color of the dash
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 0.0,
                                            top: 15.0,
                                            right: 0.0,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: const Text(
                                                  "Secondary Drug Test",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 40,
                                                  child: Material(
                                                    elevation:
                                                        4, // Adjust this value for more or less elevation
                                                    shadowColor: Colors.black
                                                        .withOpacity(
                                                            0.5), // Optional: Adjust shadow color
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4), // Match with TextFormField's border radius
                                                    child: TextFormField(
                                                      key:
                                                          _secondaryDrugTestKey,
                                                      controller:
                                                          _secondaryDrugTestController,
                                                      decoration:
                                                          InputDecoration(
                                                        fillColor: Colors.white,
                                                        filled: true,
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.white,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.white,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.white,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.red,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.red,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          vertical: 5,
                                                          horizontal: 12,
                                                        ),
                                                        errorStyle:
                                                            const TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      keyboardType: TextInputType
                                                          .text, // Ensures numeric input
                                                      onChanged: (value) {
                                                        setState(() {
                                                          // Update the number of donors and the text controller
                                                          _secondaryDrugTestController
                                                                  .text =
                                                              value; // Manually update the controller text
                                                          _secondaryDrugTestKey
                                                              .currentState!
                                                              .validate();
                                                        });
                                                      },
                                                      validator: (value) {
                                                        if (_secondaryDrugTestController
                                                                .text ==
                                                            "") {
                                                          return 'Please enter a valid drug test name';
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 0.0,
                                            top: 15.0,
                                            right: 0.0,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: const Text(
                                                  "Select Preferred Device",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 40,
                                                  child: Material(
                                                    elevation:
                                                        4, // Adjust this value for more or less elevation
                                                    shadowColor: Colors.black
                                                        .withOpacity(
                                                            0.5), // Optional: Adjust shadow color
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4), // Match with TextFormField's border radius
                                                    child: TextFormField(
                                                      key:
                                                          _selectPreferedSecondaryDeviceKey,
                                                      controller:
                                                          _secondaryDrugTestPreferredDeviceController,
                                                      decoration:
                                                          InputDecoration(
                                                        fillColor: Colors.white,
                                                        filled: true,
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.white,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.white,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.white,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.red,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.red,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          vertical: 5,
                                                          horizontal: 12,
                                                        ),
                                                        errorStyle:
                                                            const TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      keyboardType: TextInputType
                                                          .text, // Ensures numeric input
                                                      onChanged: (value) {
                                                        setState(() {
                                                          // Update the number of donors and the text controller
                                                          _secondaryDrugTestPreferredDeviceController
                                                                  .text =
                                                              value; // Manually update the controller text
                                                          _selectPreferedSecondaryDeviceKey
                                                              .currentState!
                                                              .validate();
                                                        });
                                                      },
                                                      validator: (value) {
                                                        if (_secondaryDrugTestPreferredDeviceController
                                                                .text ==
                                                            "") {
                                                          return 'Please enter a valid device name';
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: List.generate(
                                            60, // Adjust the number of dashes
                                            (index) => Container(
                                              width: 4, // Width of each dash
                                              height:
                                                  2, // Height of each dash (thickness)
                                              color: Colors
                                                  .black, // Color of the dash
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 0.0,
                                            top: 15.0,
                                            right: 0.0,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: const Text(
                                                  "Teritory Drug Test",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 40,
                                                  child: Material(
                                                    elevation:
                                                        4, // Adjust this value for more or less elevation
                                                    shadowColor: Colors.black
                                                        .withOpacity(
                                                            0.5), // Optional: Adjust shadow color
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4), // Match with TextFormField's border radius
                                                    child: TextFormField(
                                                      key: _thirtoryDrugTestKey,
                                                      controller:
                                                          _thirteryDrugTestController,
                                                      decoration:
                                                          InputDecoration(
                                                        fillColor: Colors.white,
                                                        filled: true,
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.white,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.white,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.white,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.red,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.red,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          vertical: 5,
                                                          horizontal: 12,
                                                        ),
                                                        errorStyle:
                                                            const TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      keyboardType: TextInputType
                                                          .text, // Ensures numeric input
                                                      onChanged: (value) {
                                                        setState(() {
                                                          // Update the number of donors and the text controller
                                                          _thirteryDrugTestController
                                                                  .text =
                                                              value; // Manually update the controller text
                                                          _thirtoryDrugTestKey
                                                              .currentState!
                                                              .validate();
                                                        });
                                                      },
                                                      validator: (value) {
                                                        if (_thirteryDrugTestController
                                                                .text ==
                                                            "") {
                                                          return 'Please enter a valid drug test name';
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 0.0,
                                            top: 15.0,
                                            right: 0.0,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: const Text(
                                                  "Select Preferred Device",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 40,
                                                  child: Material(
                                                    elevation:
                                                        4, // Adjust this value for more or less elevation
                                                    shadowColor: Colors.black
                                                        .withOpacity(
                                                            0.5), // Optional: Adjust shadow color
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4), // Match with TextFormField's border radius
                                                    child: TextFormField(
                                                      key:
                                                          _selectPreferedThirtoryDeviceKey,
                                                      controller:
                                                          _thirteryDrugTestPreferredDeviceController,
                                                      decoration:
                                                          InputDecoration(
                                                        fillColor: Colors.white,
                                                        filled: true,
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.white,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.white,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.white,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.red,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.red,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          vertical: 5,
                                                          horizontal: 12,
                                                        ),
                                                        errorStyle:
                                                            const TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      keyboardType: TextInputType
                                                          .text, // Ensures numeric input
                                                      onChanged: (value) {
                                                        setState(() {
                                                          // Update the number of donors and the text controller
                                                          _thirteryDrugTestPreferredDeviceController
                                                                  .text =
                                                              value; // Manually update the controller text
                                                          _selectPreferedThirtoryDeviceKey
                                                              .currentState!
                                                              .validate();
                                                        });
                                                      },
                                                      validator: (value) {
                                                        if (_thirteryDrugTestPreferredDeviceController
                                                                .text ==
                                                            "") {
                                                          return 'Please enter a valid preferred device';
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: List.generate(
                                            60, // Adjust the number of dashes
                                            (index) => Container(
                                              width: 4, // Width of each dash
                                              height:
                                                  2, // Height of each dash (thickness)
                                              color: Colors
                                                  .black, // Color of the dash
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : _testsType == TestsType.DrugOnly
                                    ? Container(
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                // Left-aligned title
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Drug Test Specifications",
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 0.0,
                                                top: 15.0,
                                                right: 0.0,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: const Text(
                                                      "Primary Drug Test",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 13,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 40,
                                                      child: Material(
                                                        elevation:
                                                            4, // Adjust this value for more or less elevation
                                                        shadowColor: Colors
                                                            .black
                                                            .withOpacity(
                                                                0.5), // Optional: Adjust shadow color
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                4), // Match with TextFormField's border radius
                                                        child: TextFormField(
                                                          key:
                                                              _primaryTestSpecificationsKey,
                                                          controller:
                                                              _primaryDrugTestController,
                                                          decoration:
                                                              InputDecoration(
                                                            fillColor:
                                                                Colors.white,
                                                            filled: true,
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color:
                                                                    Colors.red,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color:
                                                                    Colors.red,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            contentPadding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              vertical: 5,
                                                              horizontal: 12,
                                                            ),
                                                            errorStyle:
                                                                const TextStyle(
                                                              color: Colors.red,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                          keyboardType:
                                                              TextInputType
                                                                  .text, // Ensures numeric input
                                                          onChanged: (value) {
                                                            setState(() {
                                                              // Update the number of donors and the text controller
                                                              _primaryDrugTestController
                                                                      .text =
                                                                  value; // Manually update the controller text
                                                              _primaryTestSpecificationsKey
                                                                  .currentState!
                                                                  .validate();
                                                            });
                                                          },
                                                          validator: (value) {
                                                            if (_primaryDrugTestController
                                                                    .text ==
                                                                "") {
                                                              return 'Please enter the primary drug test name';
                                                            }
                                                            return null;
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 0.0,
                                                top: 15.0,
                                                right: 0.0,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: const Text(
                                                      "Select Preferred Device",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 13,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 40,
                                                      child: Material(
                                                        elevation:
                                                            4, // Adjust this value for more or less elevation
                                                        shadowColor: Colors
                                                            .black
                                                            .withOpacity(
                                                                0.5), // Optional: Adjust shadow color
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                4), // Match with TextFormField's border radius
                                                        child: TextFormField(
                                                          key:
                                                              _selectPreferedPrimaryDeviceKey,
                                                          controller:
                                                              _primaryDrugTestPreferredDeviceController,
                                                          decoration:
                                                              InputDecoration(
                                                            fillColor:
                                                                Colors.white,
                                                            filled: true,
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color:
                                                                    Colors.red,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color:
                                                                    Colors.red,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            contentPadding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              vertical: 5,
                                                              horizontal: 12,
                                                            ),
                                                            errorStyle:
                                                                const TextStyle(
                                                              color: Colors.red,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                          keyboardType:
                                                              TextInputType
                                                                  .text, // Ensures numeric input
                                                          onChanged: (value) {
                                                            setState(() {
                                                              // Update the number of donors and the text controller
                                                              _primaryDrugTestPreferredDeviceController
                                                                      .text =
                                                                  value; // Manually update the controller text
                                                              _selectPreferedPrimaryDeviceKey
                                                                  .currentState!
                                                                  .validate();
                                                            });
                                                          },
                                                          validator: (value) {
                                                            if (_primaryDrugTestPreferredDeviceController
                                                                    .text ==
                                                                "") {
                                                              return 'Please enter the prefered Device name';
                                                            }
                                                            return null;
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 25,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: List.generate(
                                                60, // Adjust the number of dashes
                                                (index) => Container(
                                                  width:
                                                      4, // Width of each dash
                                                  height:
                                                      2, // Height of each dash (thickness)
                                                  color: Colors
                                                      .black, // Color of the dash
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 0.0,
                                                top: 15.0,
                                                right: 0.0,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: const Text(
                                                      "Secondary Drug Test",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 13,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 40,
                                                      child: Material(
                                                        elevation:
                                                            4, // Adjust this value for more or less elevation
                                                        shadowColor: Colors
                                                            .black
                                                            .withOpacity(
                                                                0.5), // Optional: Adjust shadow color
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                4), // Match with TextFormField's border radius
                                                        child: TextFormField(
                                                          key:
                                                              _secondaryDrugTestKey,
                                                          controller:
                                                              _secondaryDrugTestController,
                                                          decoration:
                                                              InputDecoration(
                                                            fillColor:
                                                                Colors.white,
                                                            filled: true,
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color:
                                                                    Colors.red,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color:
                                                                    Colors.red,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            contentPadding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              vertical: 5,
                                                              horizontal: 12,
                                                            ),
                                                            errorStyle:
                                                                const TextStyle(
                                                              color: Colors.red,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                          keyboardType:
                                                              TextInputType
                                                                  .text, // Ensures numeric input
                                                          onChanged: (value) {
                                                            setState(() {
                                                              // Update the number of donors and the text controller
                                                              _secondaryDrugTestController
                                                                      .text =
                                                                  value; // Manually update the controller text
                                                              _secondaryDrugTestKey
                                                                  .currentState!
                                                                  .validate();
                                                            });
                                                          },
                                                          validator: (value) {
                                                            if (_secondaryDrugTestController
                                                                    .text ==
                                                                "") {
                                                              return 'Please enter a valid drug test name';
                                                            }
                                                            return null;
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 0.0,
                                                top: 15.0,
                                                right: 0.0,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: const Text(
                                                      "Select Preferred Device",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 13,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 40,
                                                      child: Material(
                                                        elevation:
                                                            4, // Adjust this value for more or less elevation
                                                        shadowColor: Colors
                                                            .black
                                                            .withOpacity(
                                                                0.5), // Optional: Adjust shadow color
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                4), // Match with TextFormField's border radius
                                                        child: TextFormField(
                                                          key:
                                                              _selectPreferedSecondaryDeviceKey,
                                                          controller:
                                                              _secondaryDrugTestPreferredDeviceController,
                                                          decoration:
                                                              InputDecoration(
                                                            fillColor:
                                                                Colors.white,
                                                            filled: true,
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color:
                                                                    Colors.red,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color:
                                                                    Colors.red,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            contentPadding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              vertical: 5,
                                                              horizontal: 12,
                                                            ),
                                                            errorStyle:
                                                                const TextStyle(
                                                              color: Colors.red,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                          keyboardType:
                                                              TextInputType
                                                                  .text, // Ensures numeric input
                                                          onChanged: (value) {
                                                            setState(() {
                                                              // Update the number of donors and the text controller
                                                              _secondaryDrugTestPreferredDeviceController
                                                                      .text =
                                                                  value; // Manually update the controller text
                                                              _selectPreferedSecondaryDeviceKey
                                                                  .currentState!
                                                                  .validate();
                                                            });
                                                          },
                                                          validator: (value) {
                                                            if (_secondaryDrugTestPreferredDeviceController
                                                                    .text ==
                                                                "") {
                                                              return 'Please enter a valid device name';
                                                            }
                                                            return null;
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 25,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: List.generate(
                                                60, // Adjust the number of dashes
                                                (index) => Container(
                                                  width:
                                                      4, // Width of each dash
                                                  height:
                                                      2, // Height of each dash (thickness)
                                                  color: Colors
                                                      .black, // Color of the dash
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 0.0,
                                                top: 15.0,
                                                right: 0.0,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: const Text(
                                                      "Teritory Drug Test",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 13,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 40,
                                                      child: Material(
                                                        elevation:
                                                            4, // Adjust this value for more or less elevation
                                                        shadowColor: Colors
                                                            .black
                                                            .withOpacity(
                                                                0.5), // Optional: Adjust shadow color
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                4), // Match with TextFormField's border radius
                                                        child: TextFormField(
                                                          key:
                                                              _thirtoryDrugTestKey,
                                                          controller:
                                                              _thirteryDrugTestController,
                                                          decoration:
                                                              InputDecoration(
                                                            fillColor:
                                                                Colors.white,
                                                            filled: true,
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color:
                                                                    Colors.red,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color:
                                                                    Colors.red,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            contentPadding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              vertical: 5,
                                                              horizontal: 12,
                                                            ),
                                                            errorStyle:
                                                                const TextStyle(
                                                              color: Colors.red,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                          keyboardType:
                                                              TextInputType
                                                                  .text, // Ensures numeric input
                                                          onChanged: (value) {
                                                            setState(() {
                                                              // Update the number of donors and the text controller
                                                              _thirteryDrugTestController
                                                                      .text =
                                                                  value; // Manually update the controller text
                                                              _thirtoryDrugTestKey
                                                                  .currentState!
                                                                  .validate();
                                                            });
                                                          },
                                                          validator: (value) {
                                                            if (_thirteryDrugTestController
                                                                    .text ==
                                                                "") {
                                                              return 'Please enter a valid drug test name';
                                                            }
                                                            return null;
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 0.0,
                                                top: 15.0,
                                                right: 0.0,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: const Text(
                                                      "Select Preferred Device",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 13,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 40,
                                                      child: Material(
                                                        elevation:
                                                            4, // Adjust this value for more or less elevation
                                                        shadowColor: Colors
                                                            .black
                                                            .withOpacity(
                                                                0.5), // Optional: Adjust shadow color
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                4), // Match with TextFormField's border radius
                                                        child: TextFormField(
                                                          key:
                                                              _selectPreferedThirtoryDeviceKey,
                                                          controller:
                                                              _thirteryDrugTestPreferredDeviceController,
                                                          decoration:
                                                              InputDecoration(
                                                            fillColor:
                                                                Colors.white,
                                                            filled: true,
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color:
                                                                    Colors.red,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color:
                                                                    Colors.red,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            contentPadding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              vertical: 5,
                                                              horizontal: 12,
                                                            ),
                                                            errorStyle:
                                                                const TextStyle(
                                                              color: Colors.red,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                          keyboardType:
                                                              TextInputType
                                                                  .text, // Ensures numeric input
                                                          onChanged: (value) {
                                                            setState(() {
                                                              // Update the number of donors and the text controller
                                                              _thirteryDrugTestPreferredDeviceController
                                                                      .text =
                                                                  value; // Manually update the controller text
                                                              _selectPreferedThirtoryDeviceKey
                                                                  .currentState!
                                                                  .validate();
                                                            });
                                                          },
                                                          validator: (value) {
                                                            if (_thirteryDrugTestPreferredDeviceController
                                                                    .text ==
                                                                "") {
                                                              return 'Please enter a valid preferred device';
                                                            }
                                                            return null;
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 25,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: List.generate(
                                                60, // Adjust the number of dashes
                                                (index) => Container(
                                                  width:
                                                      4, // Width of each dash
                                                  height:
                                                      2, // Height of each dash (thickness)
                                                  color: Colors
                                                      .black, // Color of the dash
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container()
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            child: SizedBox(
              width: double.infinity,
              height: 1150,
              child: Card(
                surfaceTintColor: Colors.white,
                color: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 12.0,
                    bottom: 12.0,
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Left-aligned title
                            Row(
                              children: [
                                Text(
                                  "Additional Tests (s)",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 0.0),
                            child: Container(
                              height: 88,
                              width: double.infinity,
                              child: Material(
                                elevation: 4,
                                shadowColor: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(4),
                                child: TextFormField(
                                  key: _additionalTestsKey,
                                  controller: _additionalTestsController,
                                  maxLines:
                                      null, // Makes the text field expandable
                                  minLines: 5,
                                  decoration: InputDecoration(
                                    hintText: 'Test (s)',
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide
                                          .none, // Removes border outline
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                      horizontal: 12,
                                    ),
                                  ),
                                  keyboardType: TextInputType.multiline,
                                  onChanged: (value) {
                                    setState(() {
                                      _additionalTestsController.text = value;
                                      _additionalTestsKey.currentState
                                          ?.validate();
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter any test instructions';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 0.0),
                            child: Container(
                              height: 88,
                              width: double.infinity,
                              child: Material(
                                elevation: 4,
                                shadowColor: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(4),
                                child: TextFormField(
                                  key: _additioanlTestInstructionsKey,
                                  controller:
                                      _additioanlTestInstructionsController,
                                  maxLines:
                                      null, // Makes the text field expandable
                                  minLines: 5,
                                  decoration: InputDecoration(
                                    hintText: 'Additional Test Instructions',
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide
                                          .none, // Removes border outline
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                      horizontal: 12,
                                    ),
                                  ),
                                  keyboardType: TextInputType.multiline,
                                  onChanged: (value) {
                                    setState(() {
                                      _additioanlTestInstructionsController
                                          .text = value;
                                      _additioanlTestInstructionsKey
                                          .currentState
                                          ?.validate();
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter any additional test instructions';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Left-aligned title
                              Row(
                                children: [
                                  Text(
                                    "Donor Selection Process",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 0.0),
                            child: Container(
                              height: 88,
                              width: double.infinity,
                              child: Material(
                                elevation: 4,
                                shadowColor: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(4),
                                child: TextFormField(
                                  key: _donorSelectionProcessKey,
                                  controller: _donorSelectionProcessController,
                                  maxLines:
                                      null, // Makes the text field expandable
                                  minLines: 5,
                                  decoration: InputDecoration(
                                    hintText: '',
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide
                                          .none, // Removes border outline
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                      horizontal: 12,
                                    ),
                                  ),
                                  keyboardType: TextInputType.multiline,
                                  onChanged: (value) {
                                    setState(() {
                                      _donorSelectionProcessController.text =
                                          value;
                                      _donorSelectionProcessKey.currentState
                                          ?.validate();
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a valid donor selection process';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Left-aligned title
                              Row(
                                children: [
                                  Text(
                                    "Screening and Testing Process",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 0.0),
                            child: Container(
                              height: 88,
                              width: double.infinity,
                              child: Material(
                                elevation: 4,
                                shadowColor: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(4),
                                child: TextFormField(
                                  key: _screeningAndTestingProcessKey,
                                  controller:
                                      _screeningAndTestingProcessController,
                                  maxLines:
                                      null, // Makes the text field expandable
                                  minLines: 5,
                                  decoration: InputDecoration(
                                    hintText: '',
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide
                                          .none, // Removes border outline
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                      horizontal: 12,
                                    ),
                                  ),
                                  keyboardType: TextInputType.multiline,
                                  onChanged: (value) {
                                    setState(() {
                                      _screeningAndTestingProcessController
                                          .text = value;
                                      _screeningAndTestingProcessKey
                                          .currentState
                                          ?.validate();
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter any screening and testing process';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Left-aligned title
                              Row(
                                children: [
                                  Text(
                                    "Test Confirmation Instructions",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 0.0),
                            child: Container(
                              height: 88,
                              width: double.infinity,
                              child: Material(
                                elevation: 4,
                                shadowColor: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(4),
                                child: TextFormField(
                                  key: _testConfirmationInstructionsKey,
                                  controller:
                                      _testConfirmationInstructionsController,
                                  maxLines:
                                      null, // Makes the text field expandable
                                  minLines: 5,
                                  decoration: InputDecoration(
                                    hintText: '',
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide
                                          .none, // Removes border outline
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                      horizontal: 12,
                                    ),
                                  ),
                                  keyboardType: TextInputType.multiline,
                                  onChanged: (value) {
                                    setState(() {
                                      _testConfirmationInstructionsController
                                          .text = value;
                                      _testConfirmationInstructionsKey
                                          .currentState
                                          ?.validate();
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter any test confirmation instructions';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Left-aligned title
                              Row(
                                children: [
                                  Text(
                                    "Global Site Access Instructions",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 0.0),
                            child: Container(
                              height: 88,
                              width: double.infinity,
                              child: Material(
                                elevation: 4,
                                shadowColor: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(4),
                                child: TextFormField(
                                  key: _globalSiteAccessInstructionsKey,
                                  controller:
                                      _globalSiteAccessInstructionsController,
                                  maxLines:
                                      null, // Makes the text field expandable
                                  minLines: 5,
                                  decoration: InputDecoration(
                                    hintText: '',
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide
                                          .none, // Removes border outline
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                      horizontal: 12,
                                    ),
                                  ),
                                  keyboardType: TextInputType.multiline,
                                  onChanged: (value) {
                                    setState(() {
                                      _globalSiteAccessInstructionsController
                                          .text = value;
                                      _globalSiteAccessInstructionsKey
                                          .currentState
                                          ?.validate();
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter any global site access instructions';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Left-aligned title
                              Row(
                                children: [
                                  Text(
                                    "Specific Local Site Access Instructions",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 0.0),
                            child: Container(
                              height: 88,
                              width: double.infinity,
                              child: Material(
                                elevation: 4,
                                shadowColor: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(4),
                                child: TextFormField(
                                  key: _specificLocalSiteAccessInstructionsKey,
                                  controller:
                                      _specificLocalSiteAccessInstructionsController,
                                  maxLines:
                                      null, // Makes the text field expandable
                                  minLines: 5,
                                  decoration: InputDecoration(
                                    hintText: '',
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide
                                          .none, // Removes border outline
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                      horizontal: 12,
                                    ),
                                  ),
                                  keyboardType: TextInputType.multiline,
                                  onChanged: (value) {
                                    setState(() {
                                      _specificLocalSiteAccessInstructionsController
                                          .text = value;
                                      _specificLocalSiteAccessInstructionsKey
                                          .currentState
                                          ?.validate();
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter specific local site access instructions';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Left-aligned title
                              Row(
                                children: [
                                  Text(
                                    "Special Instructions",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 0.0),
                            child: Container(
                              height: 88,
                              width: double.infinity,
                              child: Material(
                                elevation: 4,
                                shadowColor: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(4),
                                child: TextFormField(
                                  key: _specialInstructionsKey,
                                  controller: _specialInstructionsController,
                                  maxLines:
                                      null, // Makes the text field expandable
                                  minLines: 5,
                                  decoration: InputDecoration(
                                    hintText: '',
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide
                                          .none, // Removes border outline
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                      horizontal: 12,
                                    ),
                                  ),
                                  keyboardType: TextInputType.multiline,
                                  onChanged: (value) {
                                    setState(() {
                                      _specialInstructionsController.text =
                                          value;
                                      _specialInstructionsKey.currentState
                                          ?.validate();
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter any special instructions';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ]),
                ),
              ),
            ),
          ),
        ]);
      case 3:
        return Column(children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            child: SizedBox(
              width: double.infinity,
              height: 80,
              child: Card(
                surfaceTintColor: Colors.white,
                color: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 12.0,
                    bottom: 12.0,
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(
                                0xFFE6F7FA), // Light blue background
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize
                                .min, // Ensures Column takes only required space
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16), // Padding
                                decoration: BoxDecoration(
                                  color:
                                      Colors.grey[600], // Light blue background
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      '4',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Container(
                                      height: 20,
                                      width: 2,
                                      color: Colors.white, // Vertical divider
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      'Client Locations',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            child: Card(
              surfaceTintColor: Colors.white,
              color: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 12.0,
                  bottom: 12.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 8.0,
                      ),
                      Container(
                        width: double.infinity,
                        height: 85,
                        decoration: BoxDecoration(
                          color: Color(0xFFF2F2F2).withOpacity(1),
                          borderRadius:
                              BorderRadius.circular(15), // Rounded corners
                        ),
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
                              padding:
                                  const EdgeInsets.only(left: 16.0, right: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 45.0),
                                    child: Text(
                                      "Search Client Locations",
                                      style: TextStyle(
                                        color: Color(0xFF005277),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          right: 16.0,
                                          top: 4.0,
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
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: InkWell(
                                          onTap: () {
                                            if (Platform.isAndroid) {
                                              showModalBottomSheet<void>(
                                                isScrollControlled:
                                                    true, // Allows controlling the height
                                                isDismissible: false,
                                                enableDrag: false,
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return DraggableScrollableSheet(
                                                    expand: false,
                                                    initialChildSize:
                                                        1, // Initial height of the sheet (93% of the screen)
                                                    minChildSize:
                                                        1, // Allow shrinking to 50% of the screen
                                                    maxChildSize:
                                                        1, // Prevent expansion above 93% of the screen
                                                    builder: (BuildContext
                                                            context,
                                                        ScrollController
                                                            scrollController) {
                                                      return Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: Color(
                                                              0xFFEDEEF0), // Background color of the bottom sheet
                                                          borderRadius:
                                                              BorderRadius
                                                                  .vertical(
                                                            top: Radius.circular(
                                                                0), // Rounded top corners
                                                          ),
                                                        ),
                                                        child:
                                                            NewClientLocation(),
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
                                                builder:
                                                    (BuildContext context) {
                                                  return DraggableScrollableSheet(
                                                    expand: false,
                                                    initialChildSize:
                                                        1, // Initial height of the sheet (93% of the screen)
                                                    minChildSize:
                                                        1, // Allow shrinking to 50% of the screen
                                                    maxChildSize:
                                                        1, // Prevent expansion above 93% of the screen
                                                    builder: (BuildContext
                                                            context,
                                                        ScrollController
                                                            scrollController) {
                                                      return Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: Color(
                                                              0xFFEDEEF0), // Background color of the bottom sheet
                                                          borderRadius:
                                                              BorderRadius
                                                                  .vertical(
                                                            top: Radius.circular(
                                                                0), // Rounded top corners
                                                          ),
                                                        ),
                                                        child:
                                                            NewClientLocation(),
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
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Container(
                                width: 230,
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
                                  controller: _locationSearchController,
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
                                      _locationSearchController.text = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
                padding: const EdgeInsets.only(
                  right: 18.0,
                  bottom: 5.0,
                ),
                child: showMainLocations
                    ? Text(
                        "$displayRange out of ${locationData.length} records",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : null),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Column(
              children: [
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: paginatedLocationData.length,
                  itemBuilder: (context, index) {
                    final location = paginatedLocationData[index];
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                          right: 16.0,
                          bottom: 10.0,
                        ),
                        child: ClientLocationCard(location: location),
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
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2),
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
                                widget.scrollController.animateTo(
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
                              widget.scrollController.animateTo(
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
                              border: Border.all(color: Colors.grey, width: 2),
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
                              widget.scrollController.animateTo(
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
                              border: Border.all(color: Colors.grey, width: 2),
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
                            achieveLocationsOpened = !achieveLocationsOpened;
                            if (!achieveLocationsOpened) {
                              showMainLocations = true;
                            } else {
                              showMainLocations = false;
                            }
                            if (achieveLocationsOpened) {
                              if (_selectedFilteringValue != "5") {
                                String? theSelected = _selectedFilteringValue;
                                setState(() {
                                  _selectedFilteringValue =
                                      filteringAmounts.first;
                                  itemsPerPage = 5;
                                });
                                // Calculate the target offset (80% of the scrollable extent)
                                print(theSelected);
                                if (theSelected == "10") {
                                  final double targetOffset = widget
                                          .scrollController
                                          .position
                                          .maxScrollExtent *
                                      0.5;
                                  widget.scrollController.animateTo(
                                    targetOffset,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeOut,
                                  );
                                } else if (theSelected == "15") {
                                  final double targetOffset = widget
                                          .scrollController
                                          .position
                                          .maxScrollExtent *
                                      0.35;
                                  widget.scrollController.animateTo(
                                    targetOffset,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeOut,
                                  );
                                }
                              } else {
                                widget.scrollController.animateTo(
                                  widget.scrollController.position.pixels +
                                      100, // Adjust this value to scroll further down
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeOut,
                                );
                              }
                            }
                          });
                        },
                        child: !achieveLocationsOpened
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
                  height: 10,
                ),
                achieveLocationsOpened
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
                                  "$displayRangeAchieved out of ${locationDataAchieved.length} achieved records",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            achieveLocationsOpened
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 5.0,
                                    ),
                                    child: Column(
                                      children: [
                                        ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap:
                                              true, // Allow ListView to adapt to its content
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount:
                                              paginatedLocationDataAchieved
                                                  .length,
                                          itemBuilder: (context, index) {
                                            final locationAchieved =
                                                paginatedLocationDataAchieved[
                                                    index];
                                            return Center(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 16.0,
                                                  right: 16.0,
                                                  bottom: 10.0,
                                                ),
                                                child: AchievedLocationCard(
                                                  location: locationAchieved,
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
                                                      color: Color(0xFF005277),
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
                                                    decoration: InputDecoration(
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
                                                        borderSide: BorderSide(
                                                            color: Colors.grey,
                                                            width: 2),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey,
                                                            width:
                                                                2), // Border colo
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0),
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
                                                              widget
                                                                  .scrollController
                                                                  .position
                                                                  .maxScrollExtent;
                                                          final double
                                                              targetOffset =
                                                              maxScrollExtent *
                                                                  0.5; // Slightly more than half (60%).
                                                          // Use animateTo to smoothly scroll to the desired position.
                                                          widget
                                                              .scrollController
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
                                                              widget
                                                                  .scrollController
                                                                  .position
                                                                  .maxScrollExtent;
                                                          final double
                                                              targetOffset =
                                                              maxScrollExtent *
                                                                  0.5; // Slightly more than half (60%).
                                                          // Use animateTo to smoothly scroll to the desired position.
                                                          widget
                                                              .scrollController
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
                                                              widget
                                                                  .scrollController
                                                                  .position
                                                                  .maxScrollExtent;
                                                          final double
                                                              targetOffset =
                                                              maxScrollExtent *
                                                                  0.55; // Slightly more than half (60%).
                                                          // Use animateTo to smoothly scroll to the desired position.
                                                          widget
                                                              .scrollController
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
                                                      color: Color(0xFF005277),
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
                                                            widget
                                                                .scrollController
                                                                .position
                                                                .maxScrollExtent;
                                                        final double
                                                            targetOffset =
                                                            maxScrollExtent *
                                                                0.5; // Slightly more than half (60%).
                                                        // Use animateTo to smoothly scroll to the desired position.
                                                        widget.scrollController
                                                            .animateTo(
                                                          targetOffset,
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                          curve:
                                                              Curves.easeInOut,
                                                        );
                                                      } else if (_selectedFilteringValueAchieved ==
                                                          "10") {
                                                        print("10 is here");
                                                        final double
                                                            maxScrollExtent =
                                                            widget
                                                                .scrollController
                                                                .position
                                                                .maxScrollExtent;
                                                        final double
                                                            targetOffset =
                                                            maxScrollExtent *
                                                                0.5; // Slightly more than half (60%).
                                                        // Use animateTo to smoothly scroll to the desired position.
                                                        widget.scrollController
                                                            .animateTo(
                                                          targetOffset,
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                          curve:
                                                              Curves.easeInOut,
                                                        );
                                                      } else if (_selectedFilteringValueAchieved ==
                                                          "15") {
                                                        final double
                                                            maxScrollExtent =
                                                            widget
                                                                .scrollController
                                                                .position
                                                                .maxScrollExtent;
                                                        final double
                                                            targetOffset =
                                                            maxScrollExtent *
                                                                0.3; // Slightly more than half (60%).
                                                        // Use animateTo to smoothly scroll to the desired position.
                                                        widget.scrollController
                                                            .animateTo(
                                                          targetOffset,
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                          curve:
                                                              Curves.easeInOut,
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
                                                      color: Color(0xFF005277),
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
                                                            widget
                                                                .scrollController
                                                                .position
                                                                .maxScrollExtent;
                                                        final double
                                                            targetOffset =
                                                            maxScrollExtent *
                                                                0.5; // Slightly more than half (60%).
                                                        // Use animateTo to smoothly scroll to the desired position.
                                                        widget.scrollController
                                                            .animateTo(
                                                          targetOffset,
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                          curve:
                                                              Curves.easeInOut,
                                                        );
                                                      } else if (_selectedFilteringValueAchieved ==
                                                          "10") {
                                                        print("10 is here");
                                                        final double
                                                            maxScrollExtent =
                                                            widget
                                                                .scrollController
                                                                .position
                                                                .maxScrollExtent;
                                                        final double
                                                            targetOffset =
                                                            maxScrollExtent *
                                                                0.35; // Slightly more than half (60%).
                                                        // Use animateTo to smoothly scroll to the desired position.
                                                        widget.scrollController
                                                            .animateTo(
                                                          targetOffset,
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                          curve:
                                                              Curves.easeInOut,
                                                        );
                                                      } else if (_selectedFilteringValueAchieved ==
                                                          "15") {
                                                        final double
                                                            maxScrollExtent =
                                                            widget
                                                                .scrollController
                                                                .position
                                                                .maxScrollExtent;
                                                        final double
                                                            targetOffset =
                                                            maxScrollExtent *
                                                                0.3; // Slightly more than half (60%).
                                                        // Use animateTo to smoothly scroll to the desired position.
                                                        widget.scrollController
                                                            .animateTo(
                                                          targetOffset,
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                          curve:
                                                              Curves.easeInOut,
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
                                                      color: Color(0xFF005277),
                                                      size: 20,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
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
        ]);
      case 4:
        return Column(children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            child: SizedBox(
              width: double.infinity,
              height: 80,
              child: Card(
                surfaceTintColor: Colors.white,
                color: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 12.0,
                    bottom: 12.0,
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(
                                0xFFE6F7FA), // Light blue background
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize
                                .min, // Ensures Column takes only required space
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16), // Padding
                                decoration: BoxDecoration(
                                  color:
                                      Colors.grey[600], // Light blue background
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      '5',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Container(
                                      height: 20,
                                      width: 2,
                                      color: Colors.white, // Vertical divider
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      'Onsite Job History',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            child: Card(
              surfaceTintColor: Colors.white,
              color: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 12.0,
                  bottom: 12.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 8.0,
                      ),
                      Container(
                        width: double.infinity,
                        height: 220,
                        decoration: BoxDecoration(
                          color: Color(0xFFF2F2F2).withOpacity(1),
                          borderRadius:
                              BorderRadius.circular(15), // Rounded corners
                        ),
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
                              padding:
                                  const EdgeInsets.only(left: 16.0, right: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 45.0),
                                    child: Text(
                                      "Service Office",
                                      style: TextStyle(
                                        color: Color(0xFF005277),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          right: 3.0,
                                          top: 2.0,
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
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: InkWell(
                                          onTap: () {
                                            if (Platform.isAndroid) {
                                              showModalBottomSheet<void>(
                                                isScrollControlled:
                                                    true, // Allows controlling the height
                                                isDismissible: false,
                                                enableDrag: false,
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return DraggableScrollableSheet(
                                                    expand: false,
                                                    initialChildSize:
                                                        1, // Initial height of the sheet (93% of the screen)
                                                    minChildSize:
                                                        1, // Allow shrinking to 50% of the screen
                                                    maxChildSize:
                                                        1, // Prevent expansion above 93% of the screen
                                                    builder: (BuildContext
                                                            context,
                                                        ScrollController
                                                            scrollController) {
                                                      return Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: Color(
                                                              0xFFEDEEF0), // Background color of the bottom sheet
                                                          borderRadius:
                                                              BorderRadius
                                                                  .vertical(
                                                            top: Radius.circular(
                                                                0), // Rounded top corners
                                                          ),
                                                        ),
                                                        child:
                                                            NewClientLocation(),
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
                                                builder:
                                                    (BuildContext context) {
                                                  return DraggableScrollableSheet(
                                                    expand: false,
                                                    initialChildSize:
                                                        1, // Initial height of the sheet (93% of the screen)
                                                    minChildSize:
                                                        1, // Allow shrinking to 50% of the screen
                                                    maxChildSize:
                                                        1, // Prevent expansion above 93% of the screen
                                                    builder: (BuildContext
                                                            context,
                                                        ScrollController
                                                            scrollController) {
                                                      return Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: Color(
                                                              0xFFEDEEF0), // Background color of the bottom sheet
                                                          borderRadius:
                                                              BorderRadius
                                                                  .vertical(
                                                            top: Radius.circular(
                                                                0), // Rounded top corners
                                                          ),
                                                        ),
                                                        child:
                                                            NewClientLocation(),
                                                      );
                                                    },
                                                  );
                                                },
                                              );
                                            }
                                          },
                                          child: SizedBox(
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Container(
                                width: 230,
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
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                "Client",
                                style: TextStyle(
                                  color: Color(0xFF005277),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Container(
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
                                          width:
                                              2), // Border color when focused
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
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      "Date",
                                      style: TextStyle(
                                        color: Color(0xFF005277),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
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
                                          blurRadius:
                                              1, // How blurry the shadow is
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
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 4),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width:
                                                  2), // Default border with thickness
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width:
                                                  3), // Border color when enabled
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width:
                                                  3), // Border color when focused
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
                                ),
                                SizedBox(
                                  width: 10,
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
                                          blurRadius:
                                              1, // How blurry the shadow is
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
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 4),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width:
                                                  2), // Default border with thickness
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width:
                                                  3), // Border color when enabled
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ),
          SizedBox(
            height: 8.0,
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
                        "$displayRange out of ${locationData.length} records",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : null),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Column(
              children: [
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: paginatedJobData.length,
                  itemBuilder: (context, index) {
                    final job = paginatedJobData[index];
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                          right: 16.0,
                          bottom: 10.0,
                        ),
                        child: OnsiteJobsNewCard(job: job),
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
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2),
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
                                widget.scrollController.animateTo(
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
                              widget.scrollController.animateTo(
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
                              border: Border.all(color: Colors.grey, width: 2),
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
                              widget.scrollController.animateTo(
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
                              border: Border.all(color: Colors.grey, width: 2),
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
                                String? theSelected = _selectedFilteringValue;
                                setState(() {
                                  _selectedFilteringValue =
                                      filteringAmounts.first;
                                  itemsPerPage = 5;
                                });
                                // Calculate the target offset (80% of the scrollable extent)
                                print(theSelected);
                                if (theSelected == "10") {
                                  final double targetOffset = widget
                                          .scrollController
                                          .position
                                          .maxScrollExtent *
                                      0.5;
                                  widget.scrollController.animateTo(
                                    targetOffset,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeOut,
                                  );
                                } else if (theSelected == "15") {
                                  final double targetOffset = widget
                                          .scrollController
                                          .position
                                          .maxScrollExtent *
                                      0.35;
                                  widget.scrollController.animateTo(
                                    targetOffset,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeOut,
                                  );
                                }
                              } else {
                                widget.scrollController.animateTo(
                                  widget.scrollController.position.pixels +
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
                                          physics: ClampingScrollPhysics(),
                                          itemCount:
                                              paginatedJobDataAchieved.length,
                                          itemBuilder: (context, index) {
                                            final job =
                                                paginatedJobDataAchieved[index];
                                            return Center(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 16.0,
                                                  right: 16.0,
                                                  bottom: 10.0,
                                                ),
                                                child: AchievedJobsNewCard(
                                                    job: job),
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
                                                      color: Color(0xFF005277),
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
                                                    decoration: InputDecoration(
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
                                                        borderSide: BorderSide(
                                                            color: Colors.grey,
                                                            width: 2),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey,
                                                            width:
                                                                2), // Border colo
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0),
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
                                                              widget
                                                                  .scrollController
                                                                  .position
                                                                  .maxScrollExtent;
                                                          final double
                                                              targetOffset =
                                                              maxScrollExtent *
                                                                  0.5; // Slightly more than half (60%).
                                                          // Use animateTo to smoothly scroll to the desired position.
                                                          widget
                                                              .scrollController
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
                                                              widget
                                                                  .scrollController
                                                                  .position
                                                                  .maxScrollExtent;
                                                          final double
                                                              targetOffset =
                                                              maxScrollExtent *
                                                                  0.5; // Slightly more than half (60%).
                                                          // Use animateTo to smoothly scroll to the desired position.
                                                          widget
                                                              .scrollController
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
                                                              widget
                                                                  .scrollController
                                                                  .position
                                                                  .maxScrollExtent;
                                                          final double
                                                              targetOffset =
                                                              maxScrollExtent *
                                                                  0.55; // Slightly more than half (60%).
                                                          // Use animateTo to smoothly scroll to the desired position.
                                                          widget
                                                              .scrollController
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
                                                      color: Color(0xFF005277),
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
                                                            widget
                                                                .scrollController
                                                                .position
                                                                .maxScrollExtent;
                                                        final double
                                                            targetOffset =
                                                            maxScrollExtent *
                                                                0.5; // Slightly more than half (60%).
                                                        // Use animateTo to smoothly scroll to the desired position.
                                                        widget.scrollController
                                                            .animateTo(
                                                          targetOffset,
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                          curve:
                                                              Curves.easeInOut,
                                                        );
                                                      } else if (_selectedFilteringValueAchieved ==
                                                          "10") {
                                                        print("10 is here");
                                                        final double
                                                            maxScrollExtent =
                                                            widget
                                                                .scrollController
                                                                .position
                                                                .maxScrollExtent;
                                                        final double
                                                            targetOffset =
                                                            maxScrollExtent *
                                                                0.5; // Slightly more than half (60%).
                                                        // Use animateTo to smoothly scroll to the desired position.
                                                        widget.scrollController
                                                            .animateTo(
                                                          targetOffset,
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                          curve:
                                                              Curves.easeInOut,
                                                        );
                                                      } else if (_selectedFilteringValueAchieved ==
                                                          "15") {
                                                        final double
                                                            maxScrollExtent =
                                                            widget
                                                                .scrollController
                                                                .position
                                                                .maxScrollExtent;
                                                        final double
                                                            targetOffset =
                                                            maxScrollExtent *
                                                                0.3; // Slightly more than half (60%).
                                                        // Use animateTo to smoothly scroll to the desired position.
                                                        widget.scrollController
                                                            .animateTo(
                                                          targetOffset,
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                          curve:
                                                              Curves.easeInOut,
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
                                                      color: Color(0xFF005277),
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
                                                            widget
                                                                .scrollController
                                                                .position
                                                                .maxScrollExtent;
                                                        final double
                                                            targetOffset =
                                                            maxScrollExtent *
                                                                0.5; // Slightly more than half (60%).
                                                        // Use animateTo to smoothly scroll to the desired position.
                                                        widget.scrollController
                                                            .animateTo(
                                                          targetOffset,
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                          curve:
                                                              Curves.easeInOut,
                                                        );
                                                      } else if (_selectedFilteringValueAchieved ==
                                                          "10") {
                                                        print("10 is here");
                                                        final double
                                                            maxScrollExtent =
                                                            widget
                                                                .scrollController
                                                                .position
                                                                .maxScrollExtent;
                                                        final double
                                                            targetOffset =
                                                            maxScrollExtent *
                                                                0.35; // Slightly more than half (60%).
                                                        // Use animateTo to smoothly scroll to the desired position.
                                                        widget.scrollController
                                                            .animateTo(
                                                          targetOffset,
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                          curve:
                                                              Curves.easeInOut,
                                                        );
                                                      } else if (_selectedFilteringValueAchieved ==
                                                          "15") {
                                                        final double
                                                            maxScrollExtent =
                                                            widget
                                                                .scrollController
                                                                .position
                                                                .maxScrollExtent;
                                                        final double
                                                            targetOffset =
                                                            maxScrollExtent *
                                                                0.3; // Slightly more than half (60%).
                                                        // Use animateTo to smoothly scroll to the desired position.
                                                        widget.scrollController
                                                            .animateTo(
                                                          targetOffset,
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                          curve:
                                                              Curves.easeInOut,
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
        ]);
      case 5:
        return Column(children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            child: SizedBox(
              width: double.infinity,
              height: 80,
              child: Card(
                surfaceTintColor: Colors.white,
                color: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 12.0,
                    bottom: 12.0,
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(
                                0xFFE6F7FA), // Light blue background
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize
                                .min, // Ensures Column takes only required space
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16), // Padding
                                decoration: BoxDecoration(
                                  color:
                                      Colors.grey[600], // Light blue background
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      '6',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Container(
                                      height: 20,
                                      width: 2,
                                      color: Colors.white, // Vertical divider
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      'Notes',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            child: SizedBox(
              width: double.infinity,
              height: 95,
              child: Card(
                surfaceTintColor: Colors.white,
                color: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 6.0,
                    bottom: 12.0,
                    left: 1.0,
                    right: 1.0,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize
                              .min, // Ensures Column takes only required space
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Color(0xFFCBF5FC),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/icons/profileIcon.png', // Replace with the actual asset path
                                      width: 40,
                                      height: 40,
                                    ),
                                    const SizedBox(width: 12),
                                    const Text(
                                      'Newcastle City Council',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            child: Card(
              surfaceTintColor: Colors.white,
              color: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 12.0,
                  bottom: 12.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 8.0,
                      ),
                      Container(
                        width: double.infinity,
                        height: 85,
                        decoration: BoxDecoration(
                          color: Color(0xFFF2F2F2).withOpacity(1),
                          borderRadius:
                              BorderRadius.circular(15), // Rounded corners
                        ),
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
                              padding:
                                  const EdgeInsets.only(left: 16.0, right: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 45.0),
                                    child: Text(
                                      "Location",
                                      style: TextStyle(
                                        color: Color(0xFF005277),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          right: 16.0,
                                          top: 2.0,
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
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: InkWell(
                                          onTap: () {
                                            if (Platform.isAndroid) {
                                              showModalBottomSheet<void>(
                                                isScrollControlled:
                                                    true, // Allows controlling the height
                                                isDismissible: false,
                                                enableDrag: false,
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return DraggableScrollableSheet(
                                                    expand: false,
                                                    initialChildSize:
                                                        1, // Initial height of the sheet (93% of the screen)
                                                    minChildSize:
                                                        1, // Allow shrinking to 50% of the screen
                                                    maxChildSize:
                                                        1, // Prevent expansion above 93% of the screen
                                                    builder: (BuildContext
                                                            context,
                                                        ScrollController
                                                            scrollController) {
                                                      return Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: Color(
                                                              0xFFEDEEF0), // Background color of the bottom sheet
                                                          borderRadius:
                                                              BorderRadius
                                                                  .vertical(
                                                            top: Radius.circular(
                                                                0), // Rounded top corners
                                                          ),
                                                        ),
                                                        child: NewNote(
                                                          subject: "",
                                                          noteText: "",
                                                        ),
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
                                                builder:
                                                    (BuildContext context) {
                                                  return DraggableScrollableSheet(
                                                    expand: false,
                                                    initialChildSize:
                                                        1, // Initial height of the sheet (93% of the screen)
                                                    minChildSize:
                                                        1, // Allow shrinking to 50% of the screen
                                                    maxChildSize:
                                                        1, // Prevent expansion above 93% of the screen
                                                    builder: (BuildContext
                                                            context,
                                                        ScrollController
                                                            scrollController) {
                                                      return Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: Color(
                                                              0xFFEDEEF0), // Background color of the bottom sheet
                                                          borderRadius:
                                                              BorderRadius
                                                                  .vertical(
                                                            top: Radius.circular(
                                                                0), // Rounded top corners
                                                          ),
                                                        ),
                                                        child: NewNote(
                                                          subject: "",
                                                          noteText: "",
                                                        ),
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
                                              child: FittedBox(
                                                fit: BoxFit.contain,
                                                child: Image.asset(
                                                  "assets/images/icons/newNoteAdd.png",
                                                  width: 24,
                                                  height: 24,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Container(
                                width: 230,
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
                                  items: showLocations
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
                            ),
                            SizedBox(
                              height: 3,
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 8.0,
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
                color: Colors
                    .white, // Use a white background to match the second section
                elevation: 2, // Add slight elevation for a subtle shadow
                child: Padding(
                  padding:
                      const EdgeInsets.all(12.0), // Padding inside the card
                  child: Column(
                    children: [
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: notes.length,
                        itemBuilder: (context, index) {
                          final note = notes[index];
                          return Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                              right: 8.0,
                              bottom: 10.0,
                            ),
                            child: NoteCard(
                              note: note,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]);
      case 6:
        return Column(children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            child: SizedBox(
              width: double.infinity,
              height: 80,
              child: Card(
                surfaceTintColor: Colors.white,
                color: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 12.0,
                    bottom: 12.0,
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(
                                0xFFE6F7FA), // Light blue background
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize
                                .min, // Ensures Column takes only required space
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16), // Padding
                                decoration: BoxDecoration(
                                  color:
                                      Colors.grey[600], // Light blue background
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      '7',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Container(
                                      height: 20,
                                      width: 2,
                                      color: Colors.white, // Vertical divider
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      'Reporting',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ),
        ]);
      default:
        return const SizedBox.shrink();
    }
  }

  void _nextStep() {
    final formState = _formKeys[_currentStep].currentState;

    // Validate the current form
    if (formState != null && !formState.validate()) {
      // If validation fails, return or show a message (optional)
      // Scroll to the top if validation fails
      widget.scrollController.animateTo(
        0, // Scroll to top
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      return;
    }

    // Move to the next step if validation passes
    if (_currentStep < _formKeys.length - 1) {
      setState(() {
        _currentStep++;
      });
    } else {
      // Handle form submission
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Success'),
          content: const Text('Form submitted successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      trackVisibility: false,
      thumbVisibility: true,
      controller: widget.scrollController,
      child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: widget.scrollController,
          children: [
            Column(
              children: [
                Container(
                  color: Color(0xFFEDEEF0),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 1.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 18.0,
                            ),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: SizedBox(
                                width: 25,
                                height: 25,
                                child: Image.asset(
                                  "assets/images/icons/X.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.black,
                        thickness: 1.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20), // Adjust as needed
                            bottomRight:
                                Radius.circular(20), // Adjust as needed
                          ),
                        ),
                        child: Column(
                          children: [
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "New Client",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  SizedBox(
                                    child: Image.asset(
                                      "assets/images/icons/newClient.png",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Container(
                                width:
                                    500, // Reduced total width to make it smaller
                                child: IconStepper(
                                  activeStepBorderColor: Colors.transparent,
                                  lineDotRadius: 1.1,
                                  onStepReached: (index) {
                                    setState(() {
                                      /* final formState =
                                          _formKeys[_currentStep].currentState; */

                                      // Validate the current form
                                      /* if (formState != null &&
                                          !formState.validate()) {
                                        // If validation fails, return or show a message (optional)
                                        // Scroll to the top if validation fails
                                        widget.scrollController.animateTo(
                                          0, // Scroll to top
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve: Curves.easeInOut,
                                        );
                                        return;
                                      } */
                                      _currentStep = index;
                                    });
                                  },
                                  icons: const [
                                    Icon(Icons.looks_one,
                                        size: 58, color: Colors.white),
                                    Icon(Icons.looks_two,
                                        size: 58, color: Colors.white),
                                    Icon(Icons.looks_3,
                                        size: 58, color: Colors.white),
                                    Icon(Icons.looks_4,
                                        size: 58, color: Colors.white),
                                    Icon(Icons.looks_5,
                                        size: 58, color: Colors.white),
                                    Icon(Icons.looks_6,
                                        size: 58, color: Colors.white),
                                    Icon(Icons.seven_mp,
                                        size: 58, color: Colors.white),
                                  ],
                                  activeStep: _currentStep,
                                  activeStepColor: Color(0xFF156CC9),
                                  stepColor: Colors.grey,
                                  enableNextPreviousButtons: false,
                                  enableStepTapping: true,
                                  scrollingDisabled: true,

                                  steppingEnabled: true,
                                  stepRadius: 14.5, // Smaller step size
                                  lineLength: 25, // Shorter lines between steps
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                    ],
                  ),
                ), // Add some top padding
                Material(
                  color: Color(0xFFEDEEF0),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 3.0,
                      bottom: 5.0,
                      left: 0.0,
                      right: 0.0,
                    ),
                    child: Column(
                      children: [
                        Scrollbar(
                          thumbVisibility: true, // Show the scrollbar thumb
                          trackVisibility: true,
                          controller: widget.scrollController,
                          child: Form(
                            key: _formKeys[_currentStep],
                            child: _buildStepContent(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ]),
    );
  }
}
