import 'package:flutter/material.dart';
import 'package:project_code_blue/AppState/appState.dart';
import 'package:project_code_blue/ColorSchemas/AppColors.dart';
import 'package:project_code_blue/Navigation/appBarGoBack.dart';
import 'package:project_code_blue/screens/Accounting/invoiceCard.dart';
import 'package:project_code_blue/sidemenu/sidemenu.dart';
import 'package:provider/provider.dart';

class Invoices extends StatefulWidget {
  const Invoices({super.key});

  @override
  State<Invoices> createState() => _InvoicesState();
}

class _InvoicesState extends State<Invoices> {
  final ScrollController _scrollController = ScrollController();
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
  final List<String> displayYears = [
    "2023",
    "2024",
    "2025",
  ];
  String? _selectedInvoiceType;
  String? _selectedDisplayType;
  String? _selectedYear;
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
    _selectedInvoiceType = invoiceTypes.first;
    _selectedDisplayType = displayTypes.first;
    _selectedYear = displayYears.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    return Scaffold(
      backgroundColor: AppColors.appWideBackground,
      extendBodyBehindAppBar: false, // Ensure content starts below AppBar
      onDrawerChanged: (isOpen) {
        appState.setDrawerState(isOpen);
      },
      drawer: SideMenu(navigationType: "subPartNavigation"),
      appBar: AppBarGoBack(),
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
                                "Accounting / Invoices",
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
                              "Invoices",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 140,
                    color: AppColors.appWideBackground,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 12.0),
                                      child: Text(
                                        "Invoice Type",
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
                                        value: _selectedInvoiceType,
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
                                        items: invoiceTypes
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
                                            _selectedInvoiceType = value;
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
                                    left: 8.0, right: 8.0),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 12.0),
                                      child: Text(
                                        "Display",
                                        style: TextStyle(
                                          color: Color(0xFF005277),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 35,
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
                                        value: _selectedDisplayType,
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
                                        items: displayTypes
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
                                            _selectedDisplayType = value;
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
                                    left: 8.0, right: 8.0),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 12.0),
                                      child: Text(
                                        "Year",
                                        style: TextStyle(
                                          color: Color(0xFF005277),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 55,
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
                                        value: _selectedYear,
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
                                        items: displayYears
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
                                            _selectedYear = value;
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
                          height: 20,
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      bottom: 16.0,
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          Text(
                            "Advanced Drug Solutions",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 4), // Spacing between the two texts
                          Text(
                            " Customer ID: SAC-AU-123-456",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: invoicesData.length,
                    itemBuilder: (context, index) {
                      final invoice = invoicesData[index];
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 16.0,
                            right: 16.0,
                            bottom: 10.0,
                          ),
                          child: InvoiceCard(invoice: invoice),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 50,
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
