import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_code_blue/ColorSchemas/AppColors.dart';
import 'package:provider/provider.dart';
import '../../AppState/appState.dart';
import 'package:project_code_blue/Navigation/appBar.dart';
import 'package:project_code_blue/sidemenu/sidemenu.dart';

class AccountingDashboard extends StatefulWidget {
  const AccountingDashboard({super.key});

  @override
  State<AccountingDashboard> createState() => _AccountingDashboardState();
}

class _AccountingDashboardState extends State<AccountingDashboard> {
  final ScrollController _scrollController = ScrollController();
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController =
      TextEditingController(); // Controller for the text field
  DateTime? _selectedStartDate;
  DateTime? _selectedEndDate;
  bool isMobileClinic = false;
  String? _selectedValue;
  String? _selectedDateRange;
  final List<String> exports = ['PDF', 'print'];
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

  Future<Map<String, List<Map<String, String>>>>
      fetchGroupConsumptionItems() async {
    //await Future.delayed(Duration(seconds: 1));
    return {
      'Tests': [
        {
          'name': 'Drug & Alcohol Tests',
          'amount': '\$1430.00',
          'date': '2024-05-15',
          'InClinic': '100',
          'OnSite': '160',
          'type': 'Donors',
          'gst': '\$10',
        },
        {
          'name': 'Requested Laboratory Tests',
          'amount': '\$105.00',
          'date': '2025-02-15',
          'InClinic': '7',
          'OnSite': '14',
          'type': 'Digital Chain of Cutody',
          'gst': '\$10',
        },
      ],
      'Licensing (Subscriptions)': [
        {
          'name': 'Collection Manager',
          'amount': '\$90.00',
          'date': '2024-06-9',
          'users': '10',
          'licences': '10',
          'gst': '\$10',
        },
        {
          'name': 'Collection Manager Mobile',
          'amount': '\$90.00',
          'date': '2025-01-15',
          'users': '10',
          'licences': '10',
          'gst': '\$10',
        },
        {
          'name': 'Collect Assist',
          'amount': '\$300.00',
          'date': '2024-12-15',
          'users': '10',
          'licences': '10',
          'gst': '\$10',
        },
        {
          'name': 'Secure Assist',
          'amount': '\$500.00',
          'date': '2024-03-15',
          'users': '10',
          'licences': '10',
          'gst': '\$10',
        },
        {
          'name': 'Report Assist',
          'amount': '\$100.00',
          'date': '2024-06-15',
          'users': '10',
          'licences': '10',
          'gst': '\$10',
        },
        {
          'name': 'Work Assist',
          'amount': '\$100.00',
          'date': '2024-07-15',
          'users': '10',
          'licences': '10',
          'gst': '\$10',
        },
        {
          'name': 'Welcome Assist',
          'amount': '\$90.00',
          'date': '2024-05-15',
          'users': '10',
          'licences': '10',
          'gst': '\$10',
        },
      ],
      'IT Services (Additional Services)': [
        {
          'name': 'Collect Assist',
          'amount': '\$300.00',
          'date': '2024-07-18',
          'gst': '\$10'
        },
        {
          'name': 'Secure Assist',
          'amount': '\$500.00',
          'date': '2024-05-05',
          'gst': '\$10'
        },
        {
          'name': 'Report Assist',
          'amount': '\$100.00',
          'date': '2024-03-16',
          'gst': '\$10'
        },
        {
          'name': 'Work Assist',
          'amount': '\$100.00',
          'date': '2024-07-13',
          'gst': '\$10'
        },
        {
          'name': 'Welcome Assist',
          'amount': '\$100.00',
          'date': '2024-05-01',
          'gst': '\$10'
        },
      ],
      'Client Onboarding (Setup)': [
        {
          'name': 'SA Service Establishment',
          'amount': '\$500.00',
          'date': '2024-05-15',
          'gst': '\$10'
        },
        {
          'name': 'SA Platform Training',
          'amount': '\$500.00',
          'date': '2024-05-15',
          'gst': '\$10'
        },
      ],
    };
  }

  final List<String> invoiceTypes = [
    "Tests",
    "Non Tests",
    "Default",
  ];
  final List<String> displayTypes = [
    "Calendar Year",
    "Non Calendar Year",
    "Default",
  ];
  final List<String> clients = [
    "All",
    "Specific",
  ];

  final List<String> serviceOffices = [
    "Newcastle City",
    "Sydney Office",
    "Melbourne Branch",
  ]; //

  final List<String> dateRange = [
    "This Week",
    "This Month",
    "This Year",
  ];

  String? _selectedServiceOffice;
  String? _selectedClient;
  String? _dateRange;
  bool isAtBottom = false;

  final List<Map<String, String>> invoicesData = [
    {
      "invoiceNumber": "1",
      "status": "NotPaid",
      "dateTime": "1st August 2024",
      "invoiceReference": "SAT24-123456",
      "plan": "Monthly",
      "amount": "\$3500",
    },
    {
      "invoiceNumber": "2",
      "status": "NotPaid",
      "dateTime": "1st August 2024",
      "invoiceReference": "SAT24-123456",
      "plan": "Monthly",
      "amount": "\$3500",
    },
    {
      "invoiceNumber": "3",
      "status": "NotPaid",
      "dateTime": "1st August 2024",
      "invoiceReference": "SAT24-123456",
      "plan": "Monthly",
      "amount": "\$3500",
    },
    {
      "invoiceNumber": "4",
      "status": "NotPaid",
      "dateTime": "1st August 2024",
      "invoiceReference": "SAT24-123456",
      "plan": "Monthly",
      "amount": "\$3500",
    },
    {
      "invoiceNumber": "5",
      "status": "NotPaid",
      "dateTime": "1st August 2024",
      "invoiceReference": "SAT24-123456",
      "plan": "Monthly",
      "amount": "\$3500",
    },
  ];

  @override
  void initState() {
    _selectedServiceOffice = serviceOffices.first;
    _selectedClient = clients.first;
    _dateRange = dateRange.first;
    _selectedValue = exports.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    return Scaffold(
      onDrawerChanged: (isOpen) {
        appState.setDrawerState(isOpen); // Update global drawer state
      },
      drawer: SideMenu(
        navigationType: "bottomNavigation",
      ),
      appBar: MyAppBar(),
      backgroundColor: AppColors.appWideBackground,
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
                  // Removed unnecessary SizedBox that was creating the gap

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
                                "Accounting / Accounting Dashboard",
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
                              "Acounting Dashboard",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  /* SizedBox(
                    height: 20,
                  ), */
                  Container(
                    width: double.infinity,
                    height: 180,
                    color: AppColors.appWideBackground,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 0.0, right: 8.0),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 12.0),
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
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.white.withOpacity(0.2),
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            offset: Offset(0, 0),
                                          ),
                                        ],
                                      ),
                                      child: DropdownButtonFormField<String>(
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
                                                width: 2),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 2),
                                          ),
                                          fillColor: Colors.white,
                                          filled: true,
                                        ),
                                        icon: Icon(
                                          Icons.arrow_drop_down_outlined,
                                          color: Color(0xFF71717A),
                                        ),
                                        items: serviceOffices
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
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 0.0, right: 8.0),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 12.0),
                                      child: Text(
                                        "Client",
                                        style: TextStyle(
                                          color: Color(0xFF005277),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 59,
                                    ),
                                    Container(
                                      width: 169,
                                      height: 28,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.white.withOpacity(0.2),
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            offset: Offset(0, 0),
                                          ),
                                        ],
                                      ),
                                      child: DropdownButtonFormField<String>(
                                        value: _selectedClient,
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
                                                width: 2),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 2),
                                          ),
                                          fillColor: Colors.white,
                                          filled: true,
                                        ),
                                        icon: Icon(
                                          Icons.arrow_drop_down_outlined,
                                          color: Color(0xFF71717A),
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
                                    SizedBox(
                                      height: 3,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 0.0, right: 8.0),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 12.0),
                                      child: Text(
                                        "Date Range",
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
                                      width: 169,
                                      height: 28,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.white.withOpacity(0.2),
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            offset: Offset(0, 0),
                                          ),
                                        ],
                                      ),
                                      child: DropdownButtonFormField<String>(
                                        value: _dateRange,
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
                                                width: 2),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 2),
                                          ),
                                          fillColor: Colors.white,
                                          filled: true,
                                        ),
                                        icon: Icon(
                                          Icons.arrow_drop_down_outlined,
                                          color: Color(0xFF71717A),
                                        ),
                                        items: dateRange
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
                                            _dateRange = value;
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
                            ],
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
                                padding: const EdgeInsets.only(right: 80.0),
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
                                      spreadRadius:
                                          1, // How much the shadow spreads
                                      blurRadius: 1, // How blurry the shadow is
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
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 70,
                    color: Color(0xFFEEEFEE),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 2.0,
                        left: 8.0,
                        right: 8.0,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "GST",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Row(
                                children: [
                                  isMobileClinic
                                      ? const Text(
                                          "excluasive",
                                        )
                                      : const Text(
                                          "excluasive",
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 28, 33, 39),
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
                                  isMobileClinic
                                      ? const Text(
                                          "inclusive",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 26, 26),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      : const Text(
                                          "inclusive",
                                        )
                                ],
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              //const Divider(),
                              Expanded(
                                child: Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Text(
                                        'Export',
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 12, 14, 15),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    FittedBox(
                                      fit: BoxFit.contain,
                                      child: Image.asset(
                                          "assets/images/icons/downloadInvoice.png"),
                                    ),
                                    /* Expanded(
                                      child: Container(
                                        height: 28,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.white.withOpacity(0.2),
                                              spreadRadius: 1,
                                              blurRadius: 1,
                                              offset: Offset(0, 0),
                                            ),
                                          ],
                                        ),
                                        child: DropdownButtonFormField<String>(
                                          value: _selectedValue,
                                          isExpanded: true,
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
                                                  width: 2),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 2),
                                            ),
                                            fillColor: Colors.white,
                                            filled: true,
                                          ),
                                          icon: const Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.black),
                                          items: exports
                                              .map((item) => DropdownMenuItem(
                                                    value: item,
                                                    child: FittedBox(
                                                      fit: BoxFit.scaleDown,
                                                      child: Text(
                                                        item,
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                          color: Color.fromARGB(
                                                              255, 27, 29, 31),
                                                        ),
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
                                    ) */
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Divider(
                            thickness: 1,
                            indent: 0,
                            endIndent: 0,
                            color: Color.fromARGB(255, 51, 171, 211),
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
                      ),
                      child: Card(
                        color: Color(0xFFFFFFFF),
                        elevation: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 16.0,
                              right: 16.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 8),
                                const Text(
                                  'Advanced Drug Solutions',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                _buildRow('Customer ID:', "0SAC-AU-123-456"),
                                _buildRow('Service Office:', "ALL"),
                                _buildRow('Client:', "ALL"),
                                _buildRow('Currency:', "AUD \$"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  FutureBuilder<Map<String, List<Map<String, String>>>>(
                    future: fetchGroupConsumptionItems(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text("Error: ${snapshot.error}");
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Text("No Data Available");
                      }

                      final data = snapshot.data!; // 获取数据
                      DateTime selectedStartDate =
                          _selectedStartDate ?? DateTime.now();
                      DateTime selectedEndDate =
                          _selectedEndDate ?? DateTime.now();

                      Map<String, List<Map<String, String>>> filteredData =
                          data;
                      /* data.forEach((category, items) {
                        List<Map<String, String>> filteredItems =
                            items.where((item) {
                          if (item.containsKey('date')) {
                            try {
                              DateTime itemDate =
                                  DateFormat("yyyy-MM-dd").parse(item['date']!);
                              return !itemDate.isBefore(selectedStartDate) &&
                                  !itemDate.isAfter(selectedEndDate);
                            } catch (e) {
                              return false;
                            }
                          }
                          return false;
                        }).toList();
                        filteredData[category] = filteredItems; */
                      //});

                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 1.0,
                          right: 1.0,
                        ),
                        child: Card(
                          color: Color(0xFFFFFFFF),
                          elevation: 0,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0)
                                    .copyWith(top: 32.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      "Summary",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    /* Text(
                                      "${DateFormat('dd/MM/yyyy').format(selectedStartDate)} - ${DateFormat('dd/MM/yyyy').format(selectedEndDate)} | GST ${isMobileClinic ? "inclusive" : "exclusive"}",
                                      style: TextStyle(color: Colors.black),
                                    ), */
                                  ],
                                ),
                                const Divider(
                                  thickness: 1,
                                  indent: 0,
                                  endIndent: 0,
                                  color: Colors.black,
                                ),
                                ...filteredData.entries.map((entry) {
                                  final String category = entry.key;
                                  final List<Map<String, String>> items =
                                      entry.value;

                                  if (items.isEmpty) return const SizedBox();

                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 8.0, horizontal: 8),
                                            child: Text(
                                              category,
                                              style: const TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 8.0, horizontal: 16),
                                            child: category == "Tests"
                                                ? Text(
                                                    "Sub Total",
                                                    style: const TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  )
                                                : SizedBox(
                                                    height: 0,
                                                  ),
                                          ),
                                        ],
                                      ),
                                      ...items.map((item) {
                                        // **修正拼写错误 & 计算 finalAmount**
                                        String amountStr = item['amount']
                                                ?.replaceAll(
                                                    RegExp(r'[^\d.]'), '') ??
                                            '0';
                                        double amount =
                                            double.tryParse(amountStr) ?? 0.0;

                                        String gstStr = item['gst']?.replaceAll(
                                                RegExp(r'[^\d.]'), '') ??
                                            '0';
                                        double gst =
                                            double.tryParse(gstStr) ?? 0.0;

                                        double finalAmount = isMobileClinic
                                            ? (amount - gst)
                                            : amount;
                                        String displayedAmount =
                                            "\$${finalAmount.toStringAsFixed(2)}";

                                        return Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4.0,
                                                      horizontal: 16),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    item['name'] ?? 'Unknown',
                                                    style: const TextStyle(
                                                        fontSize: 14.0,
                                                        color: Colors.black),
                                                  ),
                                                  Text(
                                                    displayedAmount,
                                                    style: const TextStyle(
                                                        fontSize: 14.0,
                                                        color: Colors.black),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            /* const Divider(
                                          thickness: 1,
                                          color: Colors.black,
                                          height: 5,
                                        ), */
                                          ],
                                        );
                                      }).toList(),
                                    ],
                                  );
                                }).toList(),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  //Total Card
                  const SizedBox(height: 10),
                  FutureBuilder<Map<String, List<Map<String, String>>>>(
                    future: fetchGroupConsumptionItems(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text("Error: ${snapshot.error}");
                      }
                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Text("No Data Available");
                      }

                      final data = snapshot.data!;
                      DateTime selectedStartDate =
                          _selectedStartDate ?? DateTime.now();
                      DateTime selectedEndDate =
                          _selectedEndDate ?? DateTime.now();

                      // 🔹 过滤数据
                      double totalAmount = 0.0;
                      double totalGst = 0.0;

                      data.forEach((category, items) {
                        for (var item in items) {
                          try {
                            DateTime itemDate =
                                DateFormat("yyyy-MM-dd").parse(item['date']!);
                            if (!itemDate.isBefore(selectedStartDate) &&
                                !itemDate.isAfter(selectedEndDate)) {
                              String amountStr = item['amount']
                                      ?.replaceAll(RegExp(r'[^\d.]'), '') ??
                                  '0';
                              double amount = double.tryParse(amountStr) ?? 0.0;

                              String gstStr = item['gst']
                                      ?.replaceAll(RegExp(r'[^\d.]'), '') ??
                                  '0';
                              double gst = double.tryParse(gstStr) ?? 0.0;

                              totalAmount += amount;
                              totalGst += gst;
                            }
                          } catch (e) {
                            continue;
                          }
                        }
                      });

                      // 🔹 Calculate the final amount
                      double finalAmount = isMobileClinic
                          ? (totalAmount - totalGst)
                          : totalAmount;
                      String displayedAmount =
                          "\$${finalAmount.toStringAsFixed(2)}";

                      return Card(
                        color: Color(0xFFFFFFFF),
                        elevation: 0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0)
                              .copyWith(top: 22.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "Total",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Text(
                                    "${DateFormat('dd/MM/yyyy').format(selectedStartDate)} - ${DateFormat('dd/MM/yyyy').format(selectedEndDate)} | GST ${isMobileClinic ? "inclusive" : "exclusive"}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                color: Colors.black,
                                thickness: 1,
                                indent: 0,
                                endIndent: 0,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "\$4905.00",
                                style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              SizedBox(width: 5),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 150,
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

Widget _buildRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ),
      ],
    ),
  );
}
