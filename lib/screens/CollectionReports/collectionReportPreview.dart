import 'package:flutter/material.dart';
import 'package:project_code_blue/ColorSchemas/AppColors.dart';
import 'package:project_code_blue/Navigation/appBarCollectionReports.dart';
import 'package:project_code_blue/sidemenu/sidemenu.dart';

class CollectionReportPreview extends StatefulWidget {
  final String reportID;
  final String currentStatus;
  const CollectionReportPreview({
    super.key,
    required this.reportID,
    required this.currentStatus,
  });

  @override
  State<CollectionReportPreview> createState() =>
      _CollectionReportPreviewState();
}

class MyDataTableSource extends DataTableSource {
  final List<Map<String, String>> _data = List.generate(
    50, // Dummy data
    (index) => {
      "No": (index + 1).toString(),
      "First Name": "Andrew",
      "Last Name": "KIM",
      "Email": "emailaddress@email.com",
      "Mobile": "0401333444",
      "Uploaded": "09:00 am",
      "Collector": "Martin Smith",
    },
  );

  @override
  DataRow getRow(int index) {
    final item = _data[index];
    return DataRow(cells: [
      DataCell(Text(item["No"]!)),
      DataCell(Text(item["First Name"]!)),
      DataCell(Text(item["Last Name"]!)),
      DataCell(Text(item["Email"]!)),
      DataCell(Text(item["Mobile"]!)),
      DataCell(Text(item["Uploaded"]!)),
      DataCell(Text(item["Collector"]!)),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}

class _CollectionReportPreviewState extends State<CollectionReportPreview> {
  final ScrollController _scrollController = ScrollController();
  int _rowsPerPage = 5; // Default page size
  final MyDataTableSource _data = MyDataTableSource();

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
      appBar: AppBarGoBack2(),
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
                            "Collection Report / Report Summary",
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
                            "Report Summary",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 8.0,
                              top: 2.0,
                            ),
                            child: InkWell(
                              onTap: () {
                                print("On tapped");
                              },
                              child: ClipRRect(
                                child: Image.asset(
                                  "assets/images/icons/download.png",
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
                color: AppColors.appWideBackground,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 2.0,
                        right: 2.0,
                        top: 5.0,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Card(
                          surfaceTintColor: Colors.white,
                          color: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              bottom: 12.0,
                              left: 1.0,
                              right: 1.0,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFCBF5FC),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(
                                              12.0), // Added some padding
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              widget.currentStatus ==
                                                      "Send By Collector"
                                                  ? Image.asset(
                                                      'assets/images/icons/sendByCollector.png',
                                                      width: 40,
                                                      height: 40,
                                                    )
                                                  : widget.currentStatus ==
                                                          "Successfully Sent"
                                                      ? Image.asset(
                                                          'assets/images/icons/successfullySent.png',
                                                          width: 40,
                                                          height: 40,
                                                        )
                                                      : widget.currentStatus ==
                                                              "Error Sending Report"
                                                          ? Image.asset(
                                                              'assets/images/icons/errorSendingReport.png',
                                                              width: 40,
                                                              height: 40,
                                                            )
                                                          : SizedBox(
                                                              height: 0,
                                                            ),
                                              const SizedBox(width: 12),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 8.0,
                                                ),
                                                child: Text(
                                                  widget.currentStatus,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 16.0,
                                        right: 16.0,
                                        top: 10,
                                      ),
                                      child: Expanded(
                                        child: Text.rich(
                                          TextSpan(
                                            text:
                                                "The Collection Batch Results Report will be sent by Collector at the end of job.",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                            ), // Regular text style
                                            children: [],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 32.0,
                                        right: 32.0,
                                        top: 10,
                                      ),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "Client Details",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                          Divider(
                                            thickness: 1,
                                            color: Colors.black,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Client Name",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF4C859F),
                                                  fontSize: 14,
                                                ),
                                              ),
                                              Text(
                                                "BBB - Mt Arthur",
                                                style: TextStyle(fontSize: 14),
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
                                              Text(
                                                "Location",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF4C859F),
                                                  fontSize: 14,
                                                ),
                                              ),
                                              Text(
                                                "Mt Arthur",
                                                style: TextStyle(
                                                  fontSize: 14,
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
                                              Text(
                                                "Job Ref",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF4C859F),
                                                  fontSize: 14,
                                                ),
                                              ),
                                              Text(
                                                "{Job Reference No.}",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "Authorized Representative",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                          Divider(
                                            thickness: 1,
                                            color: Colors.black,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Representative",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF4C859F),
                                                  fontSize: 14,
                                                ),
                                              ),
                                              Text(
                                                "Olivia Lopez",
                                                style: TextStyle(fontSize: 14),
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
                                              Text(
                                                "Mobile",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF4C859F),
                                                  fontSize: 14,
                                                ),
                                              ),
                                              Text(
                                                "0418549596",
                                                style: TextStyle(fontSize: 14),
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
                                              Text(
                                                "Email",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF4C859F),
                                                  fontSize: 14,
                                                ),
                                              ),
                                              Text(
                                                "rusira.senath@gmail.com",
                                                style: TextStyle(fontSize: 14),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "Site Contact",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                          Divider(
                                            thickness: 1,
                                            color: Colors.black,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Contact Personal",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF4C859F),
                                                  fontSize: 14,
                                                ),
                                              ),
                                              Text(
                                                "John Snow",
                                                style: TextStyle(fontSize: 14),
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
                                              Text(
                                                "Mobile",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF4C859F),
                                                  fontSize: 14,
                                                ),
                                              ),
                                              Text(
                                                "0418549596",
                                                style: TextStyle(fontSize: 14),
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
                                              Text(
                                                "Email",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF4C859F),
                                                  fontSize: 14,
                                                ),
                                              ),
                                              Text(
                                                "rusira.senath@gmail.com",
                                                style: TextStyle(fontSize: 14),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 190,
                        child: Card(
                          surfaceTintColor: Colors.white,
                          color: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              bottom: 12.0,
                              left: 1.0,
                              right: 1.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(height: 2),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 32.0,
                                        right: 64.0,
                                        top: 10,
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 0.0),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: TextButton(
                                                onPressed: () {
                                                  setState(() {});
                                                },
                                                style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      Color(0xFF1A8CFF)
                                                          .withOpacity(0.1),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 8),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      "View Report",
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF1A8CFF),
                                                        fontWeight:
                                                            FontWeight.w600,
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
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/icons/date_calendar.png",
                                                    width: 18,
                                                    height: 18,
                                                  ),
                                                  SizedBox(width: 10),
                                                  Text(
                                                    "Date",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xFF4C859F),
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "Thu 02/05/24",
                                                style: TextStyle(fontSize: 14),
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
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/icons/sent_time.png",
                                                    width: 18,
                                                    height: 18,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    "Sent At",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xFF4C859F),
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "10.00 am",
                                                style: TextStyle(fontSize: 14),
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
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/icons/sent_by.png",
                                                    width: 18,
                                                    height: 18,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    "Sent By",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xFF4C859F),
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "John Snow",
                                                style: TextStyle(fontSize: 14),
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
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/icons/people.png",
                                                    width: 18,
                                                    height: 18,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    "Total",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xFF4C859F),
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "11",
                                                style: TextStyle(fontSize: 16),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
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
                          style:
                              TextStyle(fontSize: 14, color: Colors.redAccent),
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
                                  DataColumn(
                                    label: Text('No'),
                                  ),
                                  DataColumn(
                                    label: Text('First Name'),
                                  ),
                                  DataColumn(
                                    label: Text('Last Name'),
                                  ),
                                  DataColumn(
                                    label: Text('Email'),
                                  ),
                                  DataColumn(
                                    label: Text('Mobile'),
                                  ),
                                  DataColumn(
                                    label: Text('Uploaded'),
                                  ),
                                  DataColumn(
                                    label: Text('Collector'),
                                  ),
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
                  ],
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
