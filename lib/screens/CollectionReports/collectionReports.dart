import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_code_blue/ColorSchemas/AppColors.dart';
import 'package:project_code_blue/screens/CollectionReports/Data/collectionReportsData.dart';
import 'package:project_code_blue/screens/CollectionReports/invalidResultsReport.dart';
import 'package:project_code_blue/screens/CollectionReports/reportingCard.dart';
import 'package:provider/provider.dart';
import '../../AppState/appState.dart';
import 'package:project_code_blue/Navigation/appBar.dart';
import 'package:project_code_blue/sidemenu/sidemenu.dart';

class CollectionReports extends StatefulWidget {
  const CollectionReports({super.key});

  @override
  State<CollectionReports> createState() => _CollectionReportsState();
}

class _CollectionReportsState extends State<CollectionReports> {
  final ScrollController _scrollController = ScrollController();
  TextEditingController _theDateController = TextEditingController();
  DateTime? _selectTheDate;
  String? _selectedLocation;
  final List<String> locationFilter = ["Sydney", "Melbourne", "New Castle"];

  final List<Map<String, String>> reports = CollectionReportsData().reportsData;

  Future<void> _selectTheDateCall(BuildContext context) async {
    DateTime initialDate = _selectTheDate ?? DateTime.now();
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

    if (picked != null && picked != _selectTheDate) {
      setState(() {
        _selectTheDate = picked;
        _theDateController.text =
            "${picked.day}/0${picked.month}/${picked.year}"; // Display the selected date
      });
    }
  }

  @override
  void initState() {
    _theDateController.text = DateFormat('dd/MM/yyyy').format(
      DateTime.now(),
    );
    _selectedLocation = locationFilter.first;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    return Scaffold(
      backgroundColor: AppColors.appWideBackground,
      extendBodyBehindAppBar: true, // Extends body behind the AppBar
      drawer: SideMenu(
        navigationType: "bottomNavigation",
      ),
      onDrawerChanged: (isOpen) {
        appState.setDrawerState(isOpen); // Update global drawer state
      },
      appBar: MyAppBar(),
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
                            "Home / Collection Reports Home",
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
                            "Collection Reports",
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
                width: double.infinity,
                height: 75,
                color: AppColors.appWideBackground,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Text(
                          "Date",
                          style: TextStyle(
                            color: Color(0xFF005277),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6), // Adjust padding
                            decoration: BoxDecoration(
                              color: _theDateController.text ==
                                      DateFormat('dd/MM/yyyy').format(
                                        DateTime.now(),
                                      )
                                  ? Color(0xFF007AFF)
                                  : Colors.transparent, // Blue background
                              borderRadius:
                                  BorderRadius.circular(8), // Rounded corners
                              border: Border.all(
                                color:
                                    Colors.grey.shade300, // Light gray border
                                width: 1.5,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade400, // Shadow color
                                  blurRadius: 2,
                                  offset: Offset(0, 1), // Slight shadow below
                                ),
                              ],
                            ),
                            child: Text(
                              "Today",
                              style: TextStyle(
                                color: Colors.white, // White text
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 35,
                          ),
                          Container(
                            width: 195,
                            height: 35,
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
                              controller: _theDateController,
                              readOnly: true,
                              onTap: () => _selectTheDateCall(context),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 4),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: _theDateController.text,
                                hintStyle: TextStyle(
                                  color: Color(0xFF007AFF),
                                ),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Image.asset(
                                      'assets/images/icons/calendarDate.png',
                                      width: 25,
                                      height:
                                          24, // Replace with your asset path
                                    ),
                                  ),
                                ),

                                // **Icon at the End**
                              ),
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF007AFF),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 8.0,
                    top: 5.0,
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
                        width: 68,
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
                              spreadRadius: 1, // How much the shadow spreads
                              blurRadius: 1, // How blurry the shadow is
                              offset: Offset(
                                  0, 0), // Offset for shadow position (x, y)
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
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                ),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: reports.length,
                  itemBuilder: (context, index) {
                    final report = reports[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        right: 8.0,
                        bottom: 10.0,
                      ),
                      child: ReportingCard(
                        report: report,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const InvalidResultsReport(),
                          ),
                        );
                      });
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue.withOpacity(0.1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Invalid Result Reports",
                          style: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
