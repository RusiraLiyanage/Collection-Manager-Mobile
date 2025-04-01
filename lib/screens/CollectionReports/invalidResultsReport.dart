import 'package:flutter/material.dart';
import 'package:project_code_blue/Navigation/appBar.dart';
import 'package:project_code_blue/Navigation/appBarGoBack.dart';
import 'package:project_code_blue/Navigation/appBarGoBack2.dart';
import 'package:project_code_blue/sidemenu/sidemenu.dart';

class InvalidResultsReport extends StatefulWidget {
  const InvalidResultsReport({super.key});

  @override
  State<InvalidResultsReport> createState() => _InvalidResultsReportState();
}

class MyDataTableSource extends DataTableSource {
  final List<Map<String, String>> _data = List.generate(
    50, // Dummy data
    (index) => {
      "Date": "03/05/24",
      "Time": "09:00 am",
      "Device Name": "Sure-Step Cup",
      "Lot Number": "C1120402",
      "Reason": "Insufficient Specimen",
      "Type of Test": "Urine Drug Screen",
      "Reported By": "{collector}",
    },
  );

  @override
  DataRow getRow(int index) {
    final item = _data[index];
    return DataRow(cells: [
      DataCell(Text(item["Date"]!)),
      DataCell(Text(item["Time"]!)),
      DataCell(Text(item["Device Name"]!)),
      DataCell(Text(item["Lot Number"]!)),
      DataCell(Text(item["Reason"]!)),
      DataCell(Text(item["Type of Test"]!)),
      DataCell(Text(item["Reported By"]!)),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}

class _InvalidResultsReportState extends State<InvalidResultsReport> {
  final ScrollController _scrollController = ScrollController();
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();
  int _rowsPerPage = 5; // Default page size
  final MyDataTableSource _data = MyDataTableSource();
  String? _selectedShow;
  String? _selectedReason;
  DateTime? _selectedStartDate;
  DateTime? _selectedEndDate;
  final List<String> showValues = [
    "All",
    "Specific",
  ];

  final List<String> showReasons = [
    "All",
    "Specific",
  ];

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
  void initState() {
    _selectedShow = showValues.first;
    _selectedReason = showReasons.first;
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose(); // Dispose the controller when done
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      extendBodyBehindAppBar: true, // Extends body behind the AppBar
      drawer: SideMenu(
        navigationType: "subPartNavigation",
      ),
      appBar: AppBarGoBack2(),
      body: Scrollbar(
        thumbVisibility: true,
        interactive: true,
        trackVisibility: true,
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: SizedBox(
            height: _rowsPerPage == 5
                ? 940
                : _rowsPerPage == 10
                    ? 1200
                    : _rowsPerPage == 15
                        ? 1490
                        : 0,
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
                              "Collection Reports / Invalid Results Report",
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
                          bottom: 2.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Invalid Results Reports",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 12.0,
                                top: 2.0,
                              ),
                              child: InkWell(
                                onTap: () {
                                  print("On tapped");
                                },
                                child: ClipRRect(
                                  child: Image.asset(
                                    "assets/images/icons/excelExport.png",
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
                  width: double.infinity,
                  height: 65,
                  color: Color(0xFFF2F2F2),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 45.0),
                          child: Text(
                            "Show",
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
                                spreadRadius: 1, // How much the shadow spreads
                                blurRadius: 1, // How blurry the shadow is
                                offset: Offset(
                                    0, 0), // Offset for shadow position (x, y)
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
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 45,
                  color: Color(0xFFF2F2F2),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 25.0),
                          child: Text(
                            "Reasons",
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
                                spreadRadius: 1, // How much the shadow spreads
                                blurRadius: 1, // How blurry the shadow is
                                offset: Offset(
                                    0, 0), // Offset for shadow position (x, y)
                              ),
                            ],
                          ),
                          child: DropdownButtonFormField<String>(
                            value: _selectedReason,
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
                            items: showReasons
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
                                _selectedReason = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 50.0),
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
                              spreadRadius: 1, // How much the shadow spreads
                              blurRadius: 1, // How blurry the shadow is
                              offset: Offset(
                                  0, 0), // Offset for shadow position (x, y)
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
                                  width: 2), // Default border with thickness
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
                                spreadRadius: 1, // How much the shadow spreads
                                blurRadius: 1, // How blurry the shadow is
                                offset: Offset(
                                    0, 0), // Offset for shadow position (x, y)
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
                                    width: 2), // Default border with thickness
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
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 5.0,
                    bottom: 8.0,
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Scroll Left and Right to see the hidden table data",
                      style: TextStyle(fontSize: 14, color: Colors.redAccent),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 2.0,
                    right: 2.0,
                  ),
                  child: Expanded(
                    child: Scrollbar(
                      child: SingleChildScrollView(
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            dataTableTheme: DataTableThemeData(
                              headingRowColor:
                                  WidgetStateProperty.resolveWith<Color>(
                                      (Set<WidgetState> states) {
                                // Set color for heading row
                                return Colors.white; // example color
                              }),
                              dataRowColor:
                                  WidgetStateProperty.resolveWith<Color>(
                                (Set<WidgetState> states) {
                                  // Set color for data rows
                                  return Colors.white; // example color
                                },
                              ),

                              // Add other customizations here
                            ),
                            cardTheme: const CardTheme(color: Colors.white),
                            dropdownMenuTheme: DropdownMenuThemeData(
                              menuStyle: MenuStyle(
                                backgroundColor: WidgetStateProperty.all(Colors
                                    .white), // Set dropdown background color
                              ),
                            ),
                          ),
                          child: PaginatedDataTable(
                            columns: const [
                              DataColumn(label: Text('Date')),
                              DataColumn(label: Text('Time')),
                              DataColumn(label: Text('Device Name')),
                              DataColumn(label: Text('Lot Number')),
                              DataColumn(label: Text('Reason')),
                              DataColumn(label: Text('Type of Test')),
                              DataColumn(label: Text('Reported By')),
                            ],
                            source: _data,
                            rowsPerPage: _rowsPerPage,
                            availableRowsPerPage: [5, 10, 15],
                            onRowsPerPageChanged: (value) {
                              setState(() {
                                _rowsPerPage = value!;
                              });
                            },
                            showCheckboxColumn:
                                false, // Hide the checkbox column
                          ),
                        ),
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
      ),
    );
  }
}
