import 'package:flutter/material.dart';
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
  final List<String> locationValues = [
    "All",
    "Specific",
  ];
  final List<String> timeValues = [
    "Today",
    "Current Week",
    "Current Month",
    "Current Year"
  ];
  final List<String> timeValues2 = [
    "Today",
    "Current Week",
    "Current Month",
    "Current Year"
  ];
  @override
  void initState() {
    _selectedLocation = locationValues.first;
    _selectedTime = timeValues.first;
    // TODO: implement initState
    super.initState();
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
                          height: 10,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    "assets/images/icons/testsProcessed.png",
                                    width: 20,
                                    height: 20,
                                  ),
                                  Text(
                                    "Tests Processed",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
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
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 40,
                            color: Color(0xFFD9D9D9),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Tests",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
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
                                          items: timeValues
                                              .map((item) => DropdownMenuItem(
                                                    value: item,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5.0),
                                                      child: Text(
                                                        item,
                                                        style: TextStyle(
                                                          fontSize: 16,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    "assets/images/icons/testsProcessed.png",
                                    width: 20,
                                    height: 20,
                                  ),
                                  Text(
                                    "Patient Time",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
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
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 40,
                            color: Color(0xFFD9D9D9),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Tests",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
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
                                          items: timeValues2
                                              .map((item) => DropdownMenuItem(
                                                    value: item,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5.0),
                                                      child: Text(
                                                        item,
                                                        style: TextStyle(
                                                          fontSize: 16,
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
                                              _selectedTime2 = value;
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
                                            fontSize: 16),
                                      ),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(0),
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 0.0,
                                            ),
                                            child: Text(
                                              "Rusira Rusira !!",
                                              style: TextStyle(fontSize: 14),
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
