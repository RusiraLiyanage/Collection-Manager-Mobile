import 'package:easy_pie_chart/easy_pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chartx/components/ChartLabeledData.dart';
import 'package:flutter_chartx/components/types.dart';
import 'package:flutter_chartx/widgets/ColumnChart.dart';
import 'package:project_code_blue/Navigation/appBar.dart';
import 'package:project_code_blue/Navigation/appBarGoBack.dart';
import 'package:project_code_blue/screens/Dashboard/processedTests.dart';
import 'package:project_code_blue/sidemenu/sidemenu.dart';
import 'package:card_swiper/card_swiper.dart';

class TestsProcessed extends StatefulWidget {
  const TestsProcessed({super.key});

  @override
  State<TestsProcessed> createState() => _TestsProcessedState();
}

class _TestsProcessedState extends State<TestsProcessed> {
  final ScrollController _scrollController = ScrollController();
  TextEditingController _testProcessedStartDateController =
      TextEditingController();

  TextEditingController _testProcessedEndDateController =
      TextEditingController();

  String? _selectedLocation;

  String? _selectedColorScheme;

  final List<String> locationFilter = ["In Clinic", "Out Clinic", "Default"];

  final List<String> colorSchemeFilter = ["Normal", "Specific", "Default"];

  final List<Map<String, dynamic>> legendItems = [
    {'color': Color(0xFF1F5890), 'text': 'Breath Alcohol Screen'},
    {'color': Color(0xFF0091D5), 'text': 'Urine Drug Screen'},
    {'color': Color(0xFFA5D8DD), 'text': 'Oral Fluid Drug Screen'},
    {'color': Color(0xFFBBEDF5), 'text': 'Urine Drug Test'},
    {'color': Color(0xFFA6DEBD), 'text': 'Oral Fluid Collection'},
    {'color': Color(0xFFA6B6DE), 'text': 'Hair Drug Test'},
  ];

  final List<String> showValues = [
    "All",
    "Specific",
  ];

  List<ProcessedTests> processedTests = [
    ProcessedTests(
      pies: [
        PieData(
          value: 19,
          color: Color(0xFF1F5890),
        ),
        PieData(
          value: 13,
          color: Color(0xFF0091D5),
        ),
        PieData(
          value: 16,
          color: Color(0xFFA5D8DD),
        ),
        PieData(
          value: 11,
          color: Color(0xFFBBEDF5),
        ),
        PieData(
          value: 8,
          color: Color(0xFFA6DEBD),
        ),
        PieData(
          value: 4,
          color: Color(0xFFA6B6DE),
        ),
      ],
      maxValue: 59,
      datas: [
        ChartLabeledData(
          label: "Breath Alcohol Screen",
          value: 19,
          color: Color(0xFF1F5890),
        ),
        ChartLabeledData(
          label: "Urine Drug Screen",
          value: 13,
          color: Color(0xFF0091D5),
        ),
        ChartLabeledData(
          label: "Oral Fluid Drug Screen",
          value: 16,
          color: Color(0xFFA5D8DD),
        ),
        ChartLabeledData(
          label: "Urine Drug Test",
          value: 11,
          color: Color(0xFFBBEDF5),
        ),
        ChartLabeledData(
          label: "Oral Fluid Collection",
          value: 8,
          color: Color(0xFFA6DEBD),
        ),
        ChartLabeledData(
          label: "Hair Drug Test",
          value: 4,
          color: Color(0xFFA6B6DE),
        ),
      ],
      chartDate: '24/03/25',
    ),
    ProcessedTests(
      pies: [
        PieData(
          value: 22,
          color: Color(0xFF1F5890),
        ),
        PieData(
          value: 10,
          color: Color(0xFF0091D5),
        ),
        PieData(
          value: 14,
          color: Color(0xFFA5D8DD),
        ),
        PieData(
          value: 9,
          color: Color(0xFFBBEDF5),
        ),
        PieData(
          value: 7,
          color: Color(0xFFA6DEBD),
        ),
        PieData(
          value: 5,
          color: Color(0xFFA6B6DE),
        ),
      ],
      maxValue: 67,
      datas: [
        ChartLabeledData(
          label: "Breath Alcohol Screen",
          value: 22,
          color: Color(0xFF1F5890),
        ),
        ChartLabeledData(
          label: "Urine Drug Screen",
          value: 10,
          color: Color(0xFF0091D5),
        ),
        ChartLabeledData(
          label: "Oral Fluid Drug Screen",
          value: 14,
          color: Color(0xFFA5D8DD),
        ),
        ChartLabeledData(
          label: "Urine Drug Test",
          value: 9,
          color: Color(0xFFBBEDF5),
        ),
        ChartLabeledData(
          label: "Oral Fluid Collection",
          value: 7,
          color: Color(0xFFA6DEBD),
        ),
        ChartLabeledData(
          label: "Hair Drug Test",
          value: 5,
          color: Color(0xFFA6B6DE),
        ),
      ],
      chartDate: '25/03/25',
    ),
    ProcessedTests(
      pies: [
        PieData(
          value: 15,
          color: Color(0xFF1F5890),
        ),
        PieData(
          value: 12,
          color: Color(0xFF0091D5),
        ),
        PieData(
          value: 18,
          color: Color(0xFFA5D8DD),
        ),
        PieData(
          value: 10,
          color: Color(0xFFBBEDF5),
        ),
        PieData(
          value: 6,
          color: Color(0xFFA6DEBD),
        ),
        PieData(
          value: 3,
          color: Color(0xFFA6B6DE),
        ),
      ],
      maxValue: 64,
      datas: [
        ChartLabeledData(
          label: "Breath Alcohol Screen",
          value: 15,
          color: Color(0xFF1F5890),
        ),
        ChartLabeledData(
          label: "Urine Drug Screen",
          value: 12,
          color: Color(0xFF0091D5),
        ),
        ChartLabeledData(
          label: "Oral Fluid Drug Screen",
          value: 18,
          color: Color(0xFFA5D8DD),
        ),
        ChartLabeledData(
          label: "Urine Drug Test",
          value: 10,
          color: Color(0xFFBBEDF5),
        ),
        ChartLabeledData(
          label: "Oral Fluid Collection",
          value: 6,
          color: Color(0xFFA6DEBD),
        ),
        ChartLabeledData(
          label: "Hair Drug Test",
          value: 3,
          color: Color(0xFFA6B6DE),
        ),
      ],
      chartDate: '26/03/25',
    ),
    ProcessedTests(
      pies: [
        PieData(
          value: 22,
          color: Color(0xFF1F5890),
        ),
        PieData(
          value: 10,
          color: Color(0xFF0091D5),
        ),
        PieData(
          value: 14,
          color: Color(0xFFA5D8DD),
        ),
        PieData(
          value: 12,
          color: Color(0xFFBBEDF5),
        ),
        PieData(
          value: 9,
          color: Color(0xFFA6DEBD),
        ),
        PieData(
          value: 6,
          color: Color(0xFFA6B6DE),
        ),
      ],
      maxValue: 63,
      datas: [
        ChartLabeledData(
          label: "Breath Alcohol Screen",
          value: 22,
          color: Color(0xFF1F5890),
        ),
        ChartLabeledData(
          label: "Urine Drug Screen",
          value: 10,
          color: Color(0xFF0091D5),
        ),
        ChartLabeledData(
          label: "Oral Fluid Drug Screen",
          value: 14,
          color: Color(0xFFA5D8DD),
        ),
        ChartLabeledData(
          label: "Urine Drug Test",
          value: 12,
          color: Color(0xFFBBEDF5),
        ),
        ChartLabeledData(
          label: "Oral Fluid Collection",
          value: 9,
          color: Color(0xFFA6DEBD),
        ),
        ChartLabeledData(
          label: "Hair Drug Test",
          value: 6,
          color: Color(0xFFA6B6DE),
        ),
      ],
      chartDate: '27/03/25',
    ),
    ProcessedTests(
      pies: [
        PieData(
          value: 18,
          color: Color(0xFF1F5890),
        ),
        PieData(
          value: 15,
          color: Color(0xFF0091D5),
        ),
        PieData(
          value: 17,
          color: Color(0xFFA5D8DD),
        ),
        PieData(
          value: 10,
          color: Color(0xFFBBEDF5),
        ),
        PieData(
          value: 7,
          color: Color(0xFFA6DEBD),
        ),
        PieData(
          value: 5,
          color: Color(0xFFA6B6DE),
        ),
      ],
      maxValue: 62,
      datas: [
        ChartLabeledData(
          label: "Breath Alcohol Screen",
          value: 18,
          color: Color(0xFF1F5890),
        ),
        ChartLabeledData(
          label: "Urine Drug Screen",
          value: 15,
          color: Color(0xFF0091D5),
        ),
        ChartLabeledData(
          label: "Oral Fluid Drug Screen",
          value: 17,
          color: Color(0xFFA5D8DD),
        ),
        ChartLabeledData(
          label: "Urine Drug Test",
          value: 10,
          color: Color(0xFFBBEDF5),
        ),
        ChartLabeledData(
          label: "Oral Fluid Collection",
          value: 7,
          color: Color(0xFFA6DEBD),
        ),
        ChartLabeledData(
          label: "Hair Drug Test",
          value: 5,
          color: Color(0xFFA6B6DE),
        ),
      ],
      chartDate: '28/03/25',
    ),
  ];

  String? _selectedShow;

  String? totalTests = "59";

  /* final List<PieData> pies = [
    PieData(
      value: 19,
      color: Color(0xFF1F5890),
    ),
    PieData(
      value: 13,
      color: Color(0xFF0091D5),
    ),
    PieData(
      value: 16,
      color: Color(0xFFA5D8DD),
    ),
    PieData(
      value: 11,
      color: Color(0xFFBBEDF5),
    ),
    PieData(
      value: 8,
      color: Color(0xFFA6DEBD),
    ),
    PieData(
      value: 4,
      color: Color(0xFFA6B6DE),
    ),
  ]; */

  final List<String> titles = [
    'Flutter Swiper is awesome',
    'Really nice',
    'Yeah'
  ];

  DateTime? _selectedTestsProcessedStartDate;
  DateTime? _selectedTestsProcessedEndDate;
  Future<void> _selectTestProcessedStartDate(BuildContext context) async {
    DateTime initialDate = _selectedTestsProcessedStartDate ?? DateTime.now();
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

    if (picked != null && picked != _selectedTestsProcessedStartDate) {
      setState(() {
        _selectedTestsProcessedStartDate = picked;
        _testProcessedStartDateController.text =
            "${picked.day}/${picked.month}/${picked.year}"; // Display the selected date
      });
    }
  }

  Future<void> _selectTestProcessedEndDate(BuildContext context) async {
    if (_selectedTestsProcessedStartDate == null) {
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
    DateTime initialDate = (_selectedTestsProcessedStartDate != null)
        ? _selectedTestsProcessedStartDate!.add(const Duration(days: 1))
        : DateTime(2000);
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: (_selectedTestsProcessedStartDate != null)
          ? _selectedTestsProcessedStartDate!.add(const Duration(days: 1))
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

    if (picked != null && picked != _selectedTestsProcessedEndDate) {
      setState(() {
        _selectedTestsProcessedEndDate = picked;
        _testProcessedEndDateController.text =
            "${picked.day}/${picked.month}/${picked.year}"; // Display the selected date
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedLocation = locationFilter.first;
    _selectedColorScheme = colorSchemeFilter.first;
    _selectedShow = showValues.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
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
              color: Color(0xFFD9D9D9),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          "Dashboard / Tests Processed",
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
                          "Tests Processed",
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
                              SizedBox(
                                width: 5,
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
                                padding: const EdgeInsets.only(right: 20.0),
                                child: Text(
                                  "Color Scheme",
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
                                  value: _selectedColorScheme,
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
                                  items: colorSchemeFilter
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
                                      _selectedColorScheme = value;
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
                      height: 12,
                    ),
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
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
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Tests Processed",
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
                                  controller: _testProcessedStartDateController,
                                  readOnly: true,
                                  onTap: () =>
                                      _selectTestProcessedStartDate(context),
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
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 80.0),
                                child: Text(
                                  "Date To",
                                  style: TextStyle(
                                    color: Color(0xFF005277),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 18,
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
                                  controller: _testProcessedEndDateController,
                                  readOnly: true,
                                  onTap: () =>
                                      _selectTestProcessedEndDate(context),
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
              ),
            ),
            SizedBox(
              height: 10,
            ),
            /* Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: 8, right: 8),
              child: Container(
                height: 500,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFF1A8CFF), // Blue border
                    width: 2.0, // Border width
                  ),
                ),
                child: Column(
                  children: [
                    // Spacer to push the pie chart up a bit
                    SizedBox(
                        height: 30), // Adjust the height to your preference
                    Align(
                      alignment: Alignment.center,
                      child: EasyPieChart(
                        key: const Key('Tests'),
                        children: pies,
                        showValue: false,
                        pieType: PieType.crust,
                        onTap: null,
                        gap: 0,
                        start: 0,
                        borderWidth: 23,
                        animateFromEnd: true,
                        size: 130,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 38.0),
                            child: Column(
                              children: [
                                Text(
                                  totalTests!,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Total",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceBetween, // Center the arrows horizontally
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Image.asset(
                              "assets/images/icons/navigateLeft.png",
                            ),
                          ),
                        ),
                        SizedBox(width: 16), // Space between the two arrows
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Image.asset(
                              "assets/images/icons/navigateRight.png",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ), */
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
              ),
              child: Container(
                width: double.infinity,
                height: 610,
                child: Swiper(
                  loop: false,
                  itemBuilder: (context, index) {
                    final processedTest = processedTests[index];
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
                                  padding: const EdgeInsets.only(top: 28.0),
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
                                            top: 25.0), // Reduced padding
                                        child: Column(
                                          children: [
                                            Text(
                                              processedTest.maxValue
                                                  .toInt()
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "Total",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
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
                                  processedTest.chartDate,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: legendItems.map((item) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4.0),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 16,
                                              height: 16,
                                              decoration: BoxDecoration(
                                                color: item['color'],
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                              ),
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              item['text'],
                                              style: TextStyle(fontSize: 14),
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
                  itemCount: processedTests.length,
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
                                  child: const DotSwiperPaginationBuilder(
                                          color: Colors.black12,
                                          activeColor: Color(0xFF00B4D1),
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
                        horizontal: 10.0), // Adds left and right padding),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 100,
            ),
          ]),
        ),
      ),
    );
  }
}
