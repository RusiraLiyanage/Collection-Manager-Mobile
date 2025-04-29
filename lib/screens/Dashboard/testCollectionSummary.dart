import 'package:flutter/material.dart';
import 'package:project_code_blue/ColorSchemas/AppColors.dart';
import 'package:project_code_blue/Navigation/appBarGoBack.dart';
import 'package:project_code_blue/sidemenu/sidemenu.dart';

class TestCollectionSummary extends StatefulWidget {
  const TestCollectionSummary({super.key});

  @override
  State<TestCollectionSummary> createState() => _TestCollectionSummaryState();
}

class _TestCollectionSummaryState extends State<TestCollectionSummary> {
  final ScrollController _scrollController = ScrollController();
  String? _selectedLocation;
  String? _selectedTime;
  String? _selectedTime2;
  String? _selectedTheYear;
  String? _selectedTheMonth;
  String? _selectedTheDay;
  final List<String> locationValues = [
    "All",
    "Specific",
  ];
  final List<String> assignedCollectors = [
    "All",
    "Micheal Kikrinam",
    "Rusira Liyanage",
    "Vincent Paul",
  ];

  final List<String> locationFilter = ["All", "Onsite", "In-clinic"];

  final List<String> showValues = [
    "Today",
    "Current Week",
    "Current Month",
  ];

  final List<String> serviceOfficeFilter = [
    "All",
    "Sydney Office",
    "Melbourne",
    "Darwin"
  ];

  String? _selectedServiceOffice;

  String? _selectedShow;

  bool dateRangeOrSpecific = true;

  TextEditingController _testsSampleResultsStartDateController =
      TextEditingController();

  TextEditingController _testsSampleResultsEndDateController =
      TextEditingController();

  DateTime? _selectedTestSampleResultsStartDate;

  DateTime? _selectedTestSampleResultsEndDate;

  List<String> days = [];

  List<String> theYear = [];

  final List<String> theMonth = List.generate(
    12,
    (index) => (index + 1).toString(),
  ); // Months from 1 to 12

  Future<void> _selectTestSampleResultsStartDate(BuildContext context) async {
    DateTime initialDate =
        _selectedTestSampleResultsStartDate ?? DateTime.now();
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

    if (picked != null && picked != _selectedTestSampleResultsStartDate) {
      setState(() {
        _selectedTestSampleResultsStartDate = picked;
        _testsSampleResultsStartDateController.text =
            "${picked.day}/${picked.month}/${picked.year}"; // Display the selected date
      });
    }
  }

  Future<void> _selectTestSampleResultsEndDate(BuildContext context) async {
    if (_selectedTestSampleResultsStartDate == null) {
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
    DateTime initialDate = (_selectedTestSampleResultsStartDate != null)
        ? _selectedTestSampleResultsStartDate!.add(const Duration(days: 1))
        : DateTime(2000);
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: (_selectedTestSampleResultsStartDate != null)
          ? _selectedTestSampleResultsStartDate!.add(const Duration(days: 1))
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

    if (picked != null && picked != _selectedTestSampleResultsEndDate) {
      setState(() {
        _selectedTestSampleResultsEndDate = picked;
        _testsSampleResultsEndDateController.text =
            "${picked.day}/${picked.month}/${picked.year}"; // Display the selected date
      });
    }
  }

  void _updateDayList(int year, int month) {
    int daysInMonth = DateTime(year, month + 1, 0).day;
    setState(() {
      days = List.generate(daysInMonth, (index) => (index + 1).toString());
      // Ensure the selected day is valid
      if (!days.contains(_selectedTheDay)) {
        _selectedTheDay = days.first;
      }
    });
  }

  @override
  void initState() {
    DateTime now = DateTime.now();
    theYear = List.generate(10, (index) => (now.year - index).toString());
    // Set initial selections to the current date
    _selectedTheYear = now.year.toString();
    _selectedTheMonth = now.month.toString();
    _selectedTheDay = now.day.toString();
    _selectedLocation = locationFilter.first;
    _selectedTime = assignedCollectors.first;
    _selectedServiceOffice = serviceOfficeFilter.first;
    _selectedShow = showValues.first;
    _updateDayList(
      int.parse(_selectedTheYear!),
      int.parse(_selectedTheMonth!),
    );
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Dispose the controller when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.appWideBackground,
        extendBodyBehindAppBar: true, // Extends body behind the AppBar
        drawer: SideMenu(
          navigationType: "subPartNavigation",
        ),
        appBar: AppBarGoBack(),
        body: Scrollbar(
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
                              "Dashboard / Tests Collection Summary",
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
                              "Test Collection Summary",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: InkWell(
                                onTap: () {},
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: ClipRRect(
                                    child: Image.asset(
                                      "assets/images/icons/printIcon.png",
                                      width: 24,
                                      height: 24,
                                      color: Colors.black,
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
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      top: 10,
                    ),
                    child: Column(
                      children: [
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
                                    padding: const EdgeInsets.only(right: 60.0),
                                    child: Text(
                                      "Location",
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
                                          blurRadius:
                                              1, // How blurry the shadow is
                                          offset: Offset(0,
                                              0), // Offset for shadow position (x, y)
                                        ),
                                      ],
                                    ),
                                    child: DropdownButtonFormField<String>(
                                      dropdownColor: Colors.white,
                                      value: _selectedLocation,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 4),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 2),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 2), // Border colo
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                    padding: const EdgeInsets.only(right: 20.0),
                                    child: Text(
                                      "Service Office",
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
                                          blurRadius:
                                              1, // How blurry the shadow is
                                          offset: Offset(0,
                                              0), // Offset for shadow position (x, y)
                                        ),
                                      ],
                                    ),
                                    child: DropdownButtonFormField<String>(
                                      dropdownColor: Colors.white,
                                      value: _selectedServiceOffice,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 4),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 2),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 2), // Border colo
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                      items: serviceOfficeFilter
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
                                          _selectedServiceOffice = value;
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
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 75.0),
                                  child: Text(
                                    "Show",
                                    style: TextStyle(
                                      color: Color(0xFF005277),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Container(
                                  width: 159,
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
                                  child: DropdownButtonFormField<String>(
                                    dropdownColor: Colors.white,
                                    value: _selectedShow,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 4),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 2),
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
                              ],
                            ),
                          ),
                        ),
                        /* SizedBox(
                      height: 5,
                    ), */
                        /*  */
                        /*  SizedBox(
                      height: 12,
                    ), */
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      top: 15.0,
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Test Collection Summaries",
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
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Row(
                    children: [
                      !dateRangeOrSpecific
                          ? Text(
                              "Date Range",
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : Text(
                              "Date Range",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                      Transform.scale(
                        scale: 0.7,
                        child: Switch(
                          activeColor: Colors.white,
                          activeTrackColor: Color(0xFF1A8CFF),
                          value: dateRangeOrSpecific,
                          onChanged: (value) {
                            setState(() {
                              dateRangeOrSpecific = value;
                            });
                          },
                        ),
                      ),
                      dateRangeOrSpecific
                          ? Text(
                              "Specific Date",
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : Text(
                              "Specific Date",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ],
                  ),
                ),
                !dateRangeOrSpecific
                    ? Container(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 24.0, right: 24.0),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 80.0),
                                        child: Text(
                                          "Date From",
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
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                          controller:
                                              _testsSampleResultsStartDateController,
                                          readOnly: true,
                                          onTap: () =>
                                              _selectTestSampleResultsStartDate(
                                                  context),
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
                                            hintText:
                                                'Select start date', // Placeholder text
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
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 24.0, right: 24.0),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 80.0),
                                        child: Text(
                                          "Date To",
                                          style: TextStyle(
                                            color: Color(0xFF005277),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        width: 190,
                                        height: 28,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                          controller:
                                              _testsSampleResultsEndDateController,
                                          readOnly: true,
                                          onTap: () =>
                                              _selectTestSampleResultsEndDate(
                                                  context),
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
                                            hintText:
                                                'Select end date', // Placeholder text
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
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                          right: 16.0,
                        ),
                        child: Container(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 8.0,
                                      right: 8.0,
                                      top: 5.0,
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 20.0),
                                          child: Text(
                                            "Year",
                                            style: TextStyle(
                                              color: Color(0xFF005277),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Container(
                                          width: 190,
                                          height: 28,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8),
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
                                          child:
                                              DropdownButtonFormField<String>(
                                            dropdownColor: Colors.white,
                                            value: _selectedTheYear,
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 4),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 2),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 2), // Border colo
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
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
                                            items: theYear
                                                .map((year) => DropdownMenuItem(
                                                      value: year,
                                                      child: Text(
                                                        year,
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Color(0xFF007AFF),
                                                        ),
                                                      ),
                                                    ))
                                                .toList(),
                                            onChanged: (value) {
                                              setState(() {
                                                _selectedTheYear = value;
                                                _updateDayList(
                                                    int.parse(value!),
                                                    int.parse(
                                                        _selectedTheMonth!));
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
                                height: 5,
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
                                          padding: const EdgeInsets.only(
                                              right: 20.0),
                                          child: Text(
                                            "Month",
                                            style: TextStyle(
                                              color: Color(0xFF005277),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          width: 80,
                                          height: 28,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8),
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
                                          child:
                                              DropdownButtonFormField<String>(
                                            dropdownColor: Colors.white,
                                            value: _selectedTheMonth,
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 4),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 2),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 2), // Border colo
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
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
                                            items: theMonth
                                                .map((month) =>
                                                    DropdownMenuItem(
                                                      value: month,
                                                      child: Text(
                                                        month,
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Color(0xFF007AFF),
                                                        ),
                                                      ),
                                                    ))
                                                .toList(),
                                            onChanged: (value) {
                                              setState(() {
                                                _selectedTheMonth = value;
                                                _updateDayList(
                                                    int.parse(
                                                        _selectedTheYear!),
                                                    int.parse(value!));
                                              });
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 20.0),
                                          child: Text(
                                            "Day",
                                            style: TextStyle(
                                              color: Color(0xFF005277),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          width: 80,
                                          height: 28,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8),
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
                                          child:
                                              DropdownButtonFormField<String>(
                                            dropdownColor: Colors.white,
                                            value: _selectedTheDay,
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 4),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 2),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 2), // Border colo
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
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
                                            items: days
                                                .map((item) => DropdownMenuItem(
                                                      value: item,
                                                      child: Text(
                                                        item,
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Color(0xFF007AFF),
                                                        ),
                                                      ),
                                                    ))
                                                .toList(),
                                            onChanged: (value) {
                                              setState(() {
                                                _selectedTheDay = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Container(
                    child: Container(
                      width: double.infinity,
                      height: 510,
                      decoration: BoxDecoration(
                        color: Colors.white, // Background color
                        border: Border.all(
                            color: Colors.blue,
                            width: 2), // Border color & width
                        borderRadius: BorderRadius.circular(
                            0), // Optional: rounded corners
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3), // Shadow color
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 2), // Shadow position
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 40,
                            color: Colors.blue,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                                right: 8.0,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    "assets/images/icons/testsProcessed.png",
                                    width: 20,
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Tests Processed",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  /* Container(
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Image.asset(
                                            "assets/images/icons/locationIcon.png",
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Location",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          width: 95,
                                          height: 25,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8),
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
                                          child:
                                              DropdownButtonFormField<String>(
                                            value: _selectedLocation,
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 4,
                                                      vertical: 2),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 2),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 2), // Border colo
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
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
                                            items: locationValues
                                                .map((item) => DropdownMenuItem(
                                                      value: item,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 5.0),
                                                        child: Text(
                                                          item,
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            color: Color(
                                                                0xFF007AFF),
                                                          ),
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
                                          width: 5,
                                        ),
                                        Icon(
                                          Icons.print,
                                          size: 17.5,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ), */
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 40,
                            color: AppColors.headerColor,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 32.0,
                                    right: 16.0,
                                    top: 10.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Tests",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Divider(
                              height: 0.5,
                              color: Colors.blue,
                              thickness: 1,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 16.0,
                              right: 16.0,
                            ),
                            child: Container(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ClipPath(
                                        clipper: ArrowClipper(),
                                        child: Container(
                                          width: 185,
                                          height: 30,
                                          color: Colors.blue,
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 38.0),
                                            child: Text(
                                              "Urine Drug Screen",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 80, // Adjust as needed
                                        height: 30, // Adjust as needed
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade300,
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color:
                                              Colors.white, // Background color
                                        ),
                                        child: Text(
                                          "24",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ClipPath(
                                        clipper: ArrowClipper(),
                                        child: Container(
                                          width: 185,
                                          height: 30,
                                          color: Colors.blue,
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: Text(
                                              "Oral Fluid Drug Screen",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 80, // Adjust as needed
                                        height: 30, // Adjust as needed
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade300,
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color:
                                              Colors.white, // Background color
                                        ),
                                        child: Text(
                                          "24",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ClipPath(
                                        clipper: ArrowClipper(),
                                        child: Container(
                                          width: 185,
                                          height: 30,
                                          color: Colors.blue,
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 55.0),
                                            child: Text(
                                              "Urine Drug Test",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 80, // Adjust as needed
                                        height: 30, // Adjust as needed
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade300,
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color:
                                              Colors.white, // Background color
                                        ),
                                        child: Text(
                                          "10",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ClipPath(
                                        clipper: ArrowClipper(),
                                        child: Container(
                                          width: 185,
                                          height: 30,
                                          color: Colors.blue,
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: Text(
                                              "Breath Alcohol Screen",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 80, // Adjust as needed
                                        height: 30, // Adjust as needed
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade300,
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color:
                                              Colors.white, // Background color
                                        ),
                                        child: Text(
                                          "25",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 180, // Adjust as needed
                                        height: 30, // Adjust as needed
                                        alignment: Alignment.topRight,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade300,
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color:
                                              Colors.white, // Background color
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10.0, top: 2),
                                          child: Text(
                                            "Total",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 80, // Adjust as needed
                                        height: 30, // Adjust as needed
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade300,
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color:
                                              Colors.white, // Background color
                                        ),
                                        child: Text(
                                          "83",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ClipPath(
                                        clipper: ArrowClipper(),
                                        child: Container(
                                          width: 185,
                                          height: 30,
                                          color: Colors.blue,
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 95.0),
                                            child: Text(
                                              "Observed",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 80, // Adjust as needed
                                        height: 30, // Adjust as needed
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade300,
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color:
                                              Colors.white, // Background color
                                        ),
                                        child: Text(
                                          "30",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ClipPath(
                                        clipper: ArrowClipper(),
                                        child: Container(
                                          width: 185,
                                          height: 30,
                                          color: Colors.blue,
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 90.0),
                                            child: Text(
                                              "Witnessed",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 80, // Adjust as needed
                                        height: 30, // Adjust as needed
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade300,
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color:
                                              Colors.white, // Background color
                                        ),
                                        child: Text(
                                          "10",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ClipPath(
                                        clipper: ArrowClipper(),
                                        child: Container(
                                          width: 185,
                                          height: 30,
                                          color: Colors.blue,
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 120.0),
                                            child: Text(
                                              "Single",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 80, // Adjust as needed
                                        height: 30, // Adjust as needed
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade300,
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color:
                                              Colors.white, // Background color
                                        ),
                                        child: Text(
                                          "12",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ClipPath(
                                        clipper: ArrowClipper(),
                                        child: Container(
                                          width: 185,
                                          height: 30,
                                          color: Colors.blue,
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 105.0),
                                            child: Text(
                                              "Multiple",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 80, // Adjust as needed
                                        height: 30, // Adjust as needed
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade300,
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color:
                                              Colors.white, // Background color
                                        ),
                                        child: Text(
                                          "28",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ClipPath(
                                        clipper: ArrowClipper(),
                                        child: Container(
                                          width: 185,
                                          height: 30,
                                          color: Colors.blue,
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 105.0),
                                            child: Text(
                                              "Renewal",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 80, // Adjust as needed
                                        height: 30, // Adjust as needed
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade300,
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color:
                                              Colors.white, // Background color
                                        ),
                                        child: Text(
                                          "10",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Container(
                    child: Container(
                      width: double.infinity,
                      height: 650,
                      decoration: BoxDecoration(
                        color: Colors.white, // Background color
                        border: Border.all(
                            color: Colors.blue,
                            width: 2), // Border color & width
                        borderRadius: BorderRadius.circular(
                            0), // Optional: rounded corners
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3), // Shadow color
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 2), // Shadow position
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 40,
                            color: Colors.blue,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                                right: 8.0,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    "assets/images/icons/testsProcessed.png",
                                    width: 20,
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Patient Time",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 40,
                            color: AppColors.headerColor,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 32.0,
                                    right: 16.0,
                                    top: 10.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Tests",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Divider(
                              height: 0.5,
                              color: Colors.blue,
                              thickness: 1,
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 40,
                            color: Color(0xFFE6F7FA),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 32.0,
                                    right: 16.0,
                                    top: 5.0,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Collector",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Container(
                                        width: 180,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                        child: DropdownButtonFormField<String>(
                                          dropdownColor: Colors.white,
                                          value: _selectedTime,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 4, vertical: 2),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 2),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 2), // Border colo
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
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
                                          items: assignedCollectors
                                              .map((item) => DropdownMenuItem(
                                                    value: item,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5.0),
                                                      child: Text(
                                                        item,
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ))
                                              .toList(),
                                          onChanged: (value) {
                                            setState(() {
                                              _selectedTime = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Divider(
                              height: 0.5,
                              color: Colors.blue,
                              thickness: 1,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 16.0,
                              right: 16.0,
                            ),
                            child: Container(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ClipPath(
                                        clipper: ArrowClipper(),
                                        child: Container(
                                          width: 185,
                                          height: 30,
                                          color: Color(0xFF156CC9),
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 105.0),
                                            child: Text(
                                              "All Tests",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          right: 8.0,
                                        ),
                                        child: Text(
                                          "Minutes",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ClipPath(
                                        clipper: ArrowClipper(),
                                        child: Container(
                                          width: 185,
                                          height: 30,
                                          color: Colors.blue,
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 110.0),
                                            child: Text(
                                              "Average",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 80, // Adjust as needed
                                        height: 30, // Adjust as needed
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade300,
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color:
                                              Colors.white, // Background color
                                        ),
                                        child: Text(
                                          "21",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ClipPath(
                                        clipper: ArrowClipper(),
                                        child: Container(
                                          width: 185,
                                          height: 30,
                                          color: Colors.blue,
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 110.0),
                                            child: Text(
                                              "Shortest",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 80, // Adjust as needed
                                        height: 30, // Adjust as needed
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade300,
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color:
                                              Colors.white, // Background color
                                        ),
                                        child: Text(
                                          "10",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ClipPath(
                                        clipper: ArrowClipper(),
                                        child: Container(
                                          width: 185,
                                          height: 30,
                                          color: Colors.blue,
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 110.0),
                                            child: Text(
                                              "Longest",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 80, // Adjust as needed
                                        height: 30, // Adjust as needed
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade300,
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color:
                                              Colors.white, // Background color
                                        ),
                                        child: Text(
                                          "35",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Divider(
                                    height: 0.5,
                                    color: Colors.grey[400],
                                    thickness: 1,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ClipPath(
                                        clipper: ArrowClipper(),
                                        child: Container(
                                          width: 185,
                                          height: 30,
                                          color: Color(0xFF156CC9),
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 30.0),
                                            child: Text(
                                              "Rapid Urine Drug S",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          right: 8.0,
                                        ),
                                        child: Text(
                                          "Minutes",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ClipPath(
                                        clipper: ArrowClipper(),
                                        child: Container(
                                          width: 185,
                                          height: 30,
                                          color: Colors.blue,
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 110.0),
                                            child: Text(
                                              "Average",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 80, // Adjust as needed
                                        height: 30, // Adjust as needed
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade300,
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color:
                                              Colors.white, // Background color
                                        ),
                                        child: Text(
                                          "21",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ClipPath(
                                        clipper: ArrowClipper(),
                                        child: Container(
                                          width: 185,
                                          height: 30,
                                          color: Colors.blue,
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 110.0),
                                            child: Text(
                                              "Shortest",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 80, // Adjust as needed
                                        height: 30, // Adjust as needed
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade300,
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color:
                                              Colors.white, // Background color
                                        ),
                                        child: Text(
                                          "9",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ClipPath(
                                        clipper: ArrowClipper(),
                                        child: Container(
                                          width: 185,
                                          height: 30,
                                          color: Colors.blue,
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 110.0),
                                            child: Text(
                                              "Longest",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 80, // Adjust as needed
                                        height: 30, // Adjust as needed
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade300,
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color:
                                              Colors.white, // Background color
                                        ),
                                        child: Text(
                                          "25",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Divider(
                                    height: 0.5,
                                    color: Colors.grey[400],
                                    thickness: 1,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ClipPath(
                                        clipper: ArrowClipper(),
                                        child: Container(
                                          width: 185,
                                          height: 30,
                                          color: Color(0xFF156CC9),
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 30.0),
                                            child: Text(
                                              "Salvia Drug Screen",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          right: 8.0,
                                        ),
                                        child: Text(
                                          "Minutes",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ClipPath(
                                        clipper: ArrowClipper(),
                                        child: Container(
                                          width: 185,
                                          height: 30,
                                          color: Colors.blue,
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 110.0),
                                            child: Text(
                                              "Average",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 80, // Adjust as needed
                                        height: 30, // Adjust as needed
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade300,
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color:
                                              Colors.white, // Background color
                                        ),
                                        child: Text(
                                          "21",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ClipPath(
                                        clipper: ArrowClipper(),
                                        child: Container(
                                          width: 185,
                                          height: 30,
                                          color: Colors.blue,
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 110.0),
                                            child: Text(
                                              "Shortest",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 80, // Adjust as needed
                                        height: 30, // Adjust as needed
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade300,
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color:
                                              Colors.white, // Background color
                                        ),
                                        child: Text(
                                          "9",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ClipPath(
                                        clipper: ArrowClipper(),
                                        child: Container(
                                          width: 185,
                                          height: 30,
                                          color: Colors.blue,
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 110.0),
                                            child: Text(
                                              "Longest",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 80, // Adjust as needed
                                        height: 30, // Adjust as needed
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade300,
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color:
                                              Colors.white, // Background color
                                        ),
                                        child: Text(
                                          "35",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 90,
                ),
              ],
            ),
          ),
        ));
  }
}

class ArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0); // Top left
    path.lineTo(size.width - 10, 0); // Top right before arrow
    path.lineTo(size.width, size.height / 2); // Arrow point
    path.lineTo(size.width - 10, size.height); // Bottom right before arrow
    path.lineTo(0, size.height); // Bottom left
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
