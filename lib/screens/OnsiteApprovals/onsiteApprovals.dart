import 'package:flutter/material.dart';
import 'package:project_code_blue/AppState/appState.dart';
import 'package:project_code_blue/ColorSchemas/AppColors.dart';
import 'package:project_code_blue/Navigation/appBar.dart';
import 'package:project_code_blue/screens/OnsiteApprovals/Data/onSiteApprovalsData.dart';
import 'package:project_code_blue/screens/OnsiteApprovals/onSiteApprovalsCard.dart';
import 'package:project_code_blue/sidemenu/sidemenu.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class OnsiteApprovals extends StatefulWidget {
  const OnsiteApprovals({super.key});

  @override
  State<OnsiteApprovals> createState() => _OnsiteApprovalsState();
}

class _OnsiteApprovalsState extends State<OnsiteApprovals> {
  final ScrollController _scrollController = ScrollController();
  TextEditingController _theDateController = TextEditingController();

  DateTime? _selectTheDate;
  bool isAtBottom = false;
  int currentPage = 1; // Tracks the current page
  int itemsPerPage = 5; // Default items per page

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

  String get displayRange {
    int start = ((currentPage - 1) * itemsPerPage) + 1;
    int end = currentPage * itemsPerPage;
    end = end > approvalData.length ? approvalData.length : end;
    return "$start - $end";
  }

  // Filtered jobs to display based on pagination
  List<Map<String, String>> get paginatedapprovalData {
    int startIndex = (currentPage - 1) * itemsPerPage;
    int endIndex = startIndex + itemsPerPage;
    endIndex = endIndex > approvalData.length ? approvalData.length : endIndex;
    return approvalData.sublist(startIndex, endIndex);
  }

  int get totalPages => (approvalData.length / itemsPerPage).ceil();

  final List<String> status = ["Show", "Hide"];
  final List<String> filteringAmounts = ["5", "10", "15"];
  final List<Map<String, String>> approvalData =
      OnsiteApprovalsData().onSiteApprovalsData;

  String? _selectedFilteringValue; // State variable for selected value

  @override
  void initState() {
    super.initState();
    _theDateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());

    _selectedFilteringValue = filteringAmounts.first;
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
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    return Scaffold(
      backgroundColor: AppColors.appWideBackground,
      extendBodyBehindAppBar: true,
      onDrawerChanged: (isOpen) {
        appState.setDrawerState(isOpen);
      },
      drawer: SideMenu(navigationType: "subPartNavigation"),
      appBar: const MyAppBar(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 110.0, left: 3.0),
        child: SizedBox(
          height: 40.0,
          width: 40.0,
          child: FittedBox(
            child: FloatingActionButton(
              backgroundColor:
                  AppColors.floatingActionBarColor.withOpacity(0.6),
              onPressed: () {
                if (isAtBottom) {
                  _scrollController.animateTo(
                    0,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeOut,
                  );
                } else {
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
      body: Stack(
        children: [
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
                    height: kToolbarHeight +
                        MediaQuery.of(context).padding.top +
                        11,
                  ),
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
                                "Home / Onsite Approvals",
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 16.0, top: 8.0),
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
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16.0, right: 10.0, bottom: 10.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Onsite Approvals",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 80,
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
                                    horizontal: 12,
                                    vertical: 6), // Adjust padding
                                decoration: BoxDecoration(
                                  color: _theDateController.text ==
                                          DateFormat('dd/MM/yyyy')
                                              .format(DateTime.now())
                                      ? Color(0xFF007AFF)
                                      : Colors.transparent, // Blue background
                                  borderRadius: BorderRadius.circular(
                                      8), // Rounded corners
                                  border: Border.all(
                                    color: Colors
                                        .grey.shade300, // Light gray border
                                    width: 1.5,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          Colors.grey.shade400, // Shadow color
                                      blurRadius: 2,
                                      offset:
                                          Offset(0, 1), // Slight shadow below
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
                  //SizedBox(height: 5),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 18.0, bottom: 5.0),
                      child: Text(
                        "$displayRange out of ${approvalData.length} records",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 70.0),
                    child: Column(
                      children: [
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: paginatedapprovalData.length,
                          itemBuilder: (context, index) {
                            final approval = paginatedapprovalData[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 5.0),
                              child: OnSiteApprovalsCard(approval: approval),
                            );
                          },
                        ),
                        SizedBox(height: 20),
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
                                      contentPadding:
                                          const EdgeInsets.symmetric(
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
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
