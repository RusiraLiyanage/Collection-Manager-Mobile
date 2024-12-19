import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../AppState/appState.dart';
import 'package:project_code_blue/sidemenu/sidemenu.dart';
import '../../Navigation/appBar.dart';

class OnsiteJobsHome extends StatefulWidget {
  const OnsiteJobsHome({super.key});

  @override
  State<OnsiteJobsHome> createState() => _onSiteJobsHomeState();
}

class _onSiteJobsHomeState extends State<OnsiteJobsHome> {
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController =
      TextEditingController(); // Controller for the text field
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

  final List<String> status = ["Show", "Hide"];
  String? _selectedStatus; // State variable for selected value
  @override
  void initState() {
    super.initState();
    _selectedValue = items.first;
    _selectedClient = clients.first;
    _selectedStatus = status.first; // Initialize selected value
  }

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose(); // Dispose the controller when done
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
              flex: 3, // Adjust the flex value to control space distribution
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
                            print("On tapped");
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
                        padding: const EdgeInsets.only(right: 8.0),
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
                        padding: const EdgeInsets.only(right: 60.0),
                        child: Text(
                          "Client",
                          style: TextStyle(
                            color: Color(0xFF005277),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        width: 240,
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
                        padding: const EdgeInsets.only(right: 70.0),
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
                        padding: const EdgeInsets.only(right: 60.0),
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
              child: Text(
                "1 - 15 out of 100 records",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 45.0),
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
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                                    padding: const EdgeInsets.only(top: 8.0),
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
                                4, // Adjust the flex value to control space distribution
                            child: Align(
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  Text("Job Status"),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 3, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 4,
                                        ),
                                      ],
                                    ),
                                    child: const Text(
                                      'Draft',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
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
                                mainAxisAlignment: MainAxisAlignment.end,
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
                                  const Text(
                                    '1',
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
                          iconPath: 'assets/images/icons/dafault_icon.png',
                          title: 'Date / Time',
                          value: '30 Apr 2025 10:00'),
                      _buildInfoRow(
                          iconPath: 'assets/images/icons/dafault_icon.png',
                          title: 'Client',
                          value: 'Rail NSW'),
                      _buildInfoRow(
                          iconPath: 'assets/images/icons/dafault_icon.png',
                          title: 'Authorized Rep',
                          value: 'John Roberts',
                          isBold: false),
                      _buildInfoRow(
                          iconPath: 'assets/images/icons/dafault_icon.png',
                          title: 'Location',
                          value: 'Parramatta'),
                      _buildInfoRow(
                          iconPath: 'assets/images/icons/dafault_icon.png',
                          title: 'Service',
                          value: 'Random Testing'),
                      _buildInfoRow(
                          iconPath: 'assets/images/icons/dafault_icon.png',
                          title: 'Callout Job',
                          value: 'Callout'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
