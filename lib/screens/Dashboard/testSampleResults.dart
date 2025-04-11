import 'package:card_swiper/card_swiper.dart';
import 'package:easy_pie_chart/easy_pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chartx/components/ChartLabeledData.dart';
import 'package:flutter_chartx/components/types.dart';
import 'package:flutter_chartx/widgets/ColumnChart.dart';
import 'package:project_code_blue/ColorSchemas/AppColors.dart';
import 'package:project_code_blue/Navigation/appBarGoBack.dart';
import 'package:project_code_blue/screens/Dashboard/Data/sampleResultsData.dart';
import 'package:project_code_blue/screens/Dashboard/Definitions/sampleResults.dart';
import 'package:project_code_blue/sidemenu/sidemenu.dart';

class TestSampleResults extends StatefulWidget {
  const TestSampleResults({super.key});

  @override
  State<TestSampleResults> createState() => _TestSampleResultsState();
}

class _TestSampleResultsState extends State<TestSampleResults> {
  final ScrollController _scrollController = ScrollController();
  String? _selectedLocation;
  final List<String> locationFilter = ["In Clinic", "Out Clinic", "Default"];
  List<String> theYear = [];
  final List<String> theMonth = List.generate(
    12,
    (index) => (index + 1).toString(),
  ); // Months from 1 to 12
  List<String> days = [];
  bool dateRangeOrSpecific = false;
  TextEditingController _testProcessedStartDateController =
      TextEditingController();

  TextEditingController _testProcessedEndDateController =
      TextEditingController();

  final List<Map<String, dynamic>> legendItems =
      SampleResultsData().sampleResultslegendItems;

  DateTime? _selectedTestSampleResultsStartDate;
  DateTime? _selectedTestSampleResultsEndDate;
  String? _selectedTheYear;
  String? _selectedTheMonth;
  String? _selectedTheDay;
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
        _testProcessedStartDateController.text =
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
        _testProcessedEndDateController.text =
            "${picked.day}/${picked.month}/${picked.year}"; // Display the selected date
      });
    }
  }

  List<SampleResults> sampleResults = SampleResultsData().sampleResultsData;
  @override
  void initState() {
    // TODO: implement initState
    DateTime now = DateTime.now();
    //_generateYears();
    // Generate the last 10 years dynamically
    theYear = List.generate(10, (index) => (now.year - index).toString());
    // Set initial selections to the current date
    _selectedTheYear = now.year.toString();
    _selectedTheMonth = now.month.toString();
    _selectedTheDay = now.day.toString();
    _selectedLocation = locationFilter.first;
    // Populate the day list based on current month & year
    _updateDayList(
      int.parse(_selectedTheYear!),
      int.parse(_selectedTheMonth!),
    );
    super.initState();
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

  /*  void _generateDays() {
    if (_selectedTheYear != null && _selectedTheMonth != null) {
      int year = int.parse(_selectedTheYear!);
      int month = int.parse(_selectedTheMonth!);
      int numDays =
          DateTime(year, month + 1, 0).day; // Get last day of the month
      setState(() {
        days = List.generate(numDays, (index) => (index + 1).toString());
        _selectedTheDay =
            null; // Reset the selected day when month/year changes
      });
    }
  } */

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
          child: Column(children: [
            SizedBox(
              height: kToolbarHeight + MediaQuery.of(context).padding.top + 11,
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
                          "Dashboard / Tests Sample Results",
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
                          "Tests Sample Results",
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
                                padding: const EdgeInsets.only(right: 54.0),
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
                  top: 20,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Test Sample Results",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
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
                      height: 2,
                    ),
                    Row(
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
                    !dateRangeOrSpecific
                        ? Container(
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 80.0),
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
                                                  _testProcessedStartDateController,
                                              readOnly: true,
                                              onTap: () =>
                                                  _selectTestSampleResultsStartDate(
                                                      context),
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
                                                      width:
                                                          2), // Default border with thickness
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width:
                                                          3), // Border color when enabled
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
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
                                          left: 8.0, right: 8.0),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 80.0),
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
                                                  _testProcessedEndDateController,
                                              readOnly: true,
                                              onTap: () =>
                                                  _selectTestSampleResultsEndDate(
                                                      context),
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
                                                      width:
                                                          2), // Default border with thickness
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width:
                                                          3), // Border color when enabled
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
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
                        : Container(
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
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 2), // Border colo
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
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
                                                  .map((year) =>
                                                      DropdownMenuItem(
                                                        value: year,
                                                        child: Text(
                                                          year,
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            color: Color(
                                                                0xFF007AFF),
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
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 2), // Border colo
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
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
                                                            color: Color(
                                                                0xFF007AFF),
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
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 2), // Border colo
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
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
                                                  .map((item) =>
                                                      DropdownMenuItem(
                                                        value: item,
                                                        child: Text(
                                                          item,
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            color: Color(
                                                                0xFF007AFF),
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
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 0.0,
                        right: 0.0,
                        top: 20.0,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 610,
                        child: Swiper(
                          loop: false,
                          itemBuilder: (context, index) {
                            final processedTest = sampleResults[index];
                            return Padding(
                              padding: const EdgeInsets.only(
                                top: 1,
                              ),
                              child: Card(
                                color: Colors.white,
                                elevation: 0,
                                // Removed unnecessary padding
                                child: Container(
                                  height: 500,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.transparent, // Blue border
                                      width: 2.0, // Border width
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 28.0),
                                          child: EasyPieChart(
                                            animateDuration:
                                                Duration(milliseconds: 500),
                                            key: const Key('Tests Processed'),
                                            children: processedTest.pies,
                                            showValue: false,
                                            pieType: PieType.crust,
                                            onTap: null,
                                            gap: 0,
                                            start: 0,
                                            borderWidth: 23,
                                            animateFromEnd: true,
                                            size: 100,
                                            child: Center(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top:
                                                        25.0), // Reduced padding
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      processedTest.maxValue
                                                          .toInt()
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      "Total",
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                          top: 15,
                                          left: 8.0,
                                          right: 8.0,
                                        ), // Reduced padding
                                        alignment: Alignment.center,
                                        child: ColumnChart(
                                          height: 230,
                                          isVisibleLabel: false,
                                          isVisibleBarText: true,
                                          isVisibleSeparatedText: false,
                                          markType: ChartMarkType.integer,
                                          maxValue: processedTest.maxValue,
                                          separatedBorderWidth: 0,
                                          separatedLineColor: Colors.white,
                                          datas: processedTest.datas,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Center(
                                        child: Text(
                                          processedTest.chartName,
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 16.0,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: legendItems.map((item) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 4.0),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width: 16,
                                                      height: 16,
                                                      decoration: BoxDecoration(
                                                        color: item['color'],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(3),
                                                      ),
                                                    ),
                                                    SizedBox(width: 8),
                                                    Text(
                                                      item['text'],
                                                      style: TextStyle(
                                                          fontSize: 14),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          indicatorLayout: PageIndicatorLayout.COLOR,
                          autoplay: false,
                          itemCount: sampleResults.length,
                          pagination: SwiperPagination(
                            margin: EdgeInsets.zero,
                            builder: SwiperCustomPagination(
                              builder: (context, config) {
                                return ConstrainedBox(
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child:
                                              const DotSwiperPaginationBuilder(
                                                      color: Colors.black12,
                                                      activeColor:
                                                          Color(0xFF00B4D1),
                                                      size: 10.0,
                                                      activeSize: 20.0)
                                                  .build(context, config),
                                        ),
                                      )
                                    ],
                                  ),
                                  constraints:
                                      const BoxConstraints.expand(height: 50.0),
                                );
                              },
                            ),
                          ),
                          control: const SwiperControl(
                            iconNext: Icons.arrow_forward_ios,
                            iconPrevious: Icons.arrow_back_ios,
                            color: Color(0xFF01B4D2),
                            size: 25.0,
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    10.0), // Adds left and right padding),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80,
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
