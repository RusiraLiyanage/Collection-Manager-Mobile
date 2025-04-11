import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_code_blue/ColorSchemas/AppColors.dart';
import 'package:project_code_blue/Navigation/appBarGoBack.dart';
import 'package:project_code_blue/screens/Accounting/Data/licensingData.dart';
import 'package:project_code_blue/sidemenu/sidemenu.dart';

class Licensing extends StatefulWidget {
  const Licensing({super.key});

  @override
  State<Licensing> createState() => _LicensingState();
}

class _LicensingState extends State<Licensing> {
  final ScrollController _scrollController = ScrollController();
  late Future<Map<String, String>> _latestTestData;
  String? _selectedBillingCycle;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    _selectedBillingCycle = BillingDate.first;
    _latestTestData = _fetchLatestTestData();
    _filteredLicensingFuture = _fetchFilteredLicensingItems();
    debugFetchData();
  }

  Future<Map<String, List<Map<String, String>>>>
      fetchGroupConsumptionItems() async {
    //await Future.delayed(Duration(seconds: 1));
    return LicensingData().licensingData;
  }

  Future<void> debugFetchData() async {
    Map<String, List<Map<String, String>>> data =
        await fetchGroupConsumptionItems();
    print("Fetched Data: $data");
  }

  Future<List<Map<String, String>>>? _filteredLicensingFuture;

  final List<String> BillingDate = [
    "Monthly",
    "Forthnightly",
  ];

  String formatDate(DateTime date) {
    return DateFormat('d MMMM yyyy').format(date);
  }

  Future<List<Map<String, String>>>? _filteredtestsFuture;

  Future<List<Map<String, String>>> _fetchFilteredLicensingItems() async {
    Map<String, List<Map<String, String>>> allData =
        await fetchGroupConsumptionItems();
    List<Map<String, String>> testsItems = allData['Tests'] ?? [];
    if (_selectedBillingCycle == null || _selectedBillingCycle!.isEmpty) {
      return testsItems;
    }

    return testsItems.where((item) {
      return item['BillingDate'] == _selectedBillingCycle;
    }).toList();
  }

  DateTime? _parseDate(String dateStr) {
    try {
      return DateFormat("yyyy-MM-dd").parse(dateStr);
    } catch (e) {
      print("error");
      return null;
    }
  }

  Future<Map<String, String>> _fetchLatestTestData() async {
    Map<String, List<Map<String, String>>> data =
        await fetchGroupConsumptionItems();
    DateTime today = DateTime.now();
    today = DateTime(today.year, today.month, today.day);

    if (data.containsKey('Tests')) {
      List<Map<String, String>> testItems = data['Tests']!;

      List<DateTime> dates = testItems
          .map((item) => _parseDate(item['date'] ?? ''))
          .whereType<DateTime>()
          .toList();

      if (dates.isNotEmpty) {
        DateTime _latestDate = dates.reduce((a, b) => a.isAfter(b) ? a : b);

        DateTime _nextInvoiceDate = today.add(Duration(days: 1));

        DateTime startOfMonth = DateTime(today.year, today.month, 1);
        DateTime endOfMonth = DateTime(today.year, today.month + 1, 0);

        return {
          "_currentDate": formatDate(_latestDate),
          "_nextInvoiceDate": formatDate(_nextInvoiceDate),
          "billingPeriod":
              "${formatDate(startOfMonth)} - ${formatDate(endOfMonth)}"
        };
      }
    }
    return {
      "_currentDate": "No Data",
      "_nextInvoiceDate": formatDate(today.add(Duration(days: 1))), // 默认明天
      "_billingPeriod": "No Data"
    };
  }

  bool isMobileClinic = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(
        navigationType: "subPartNavigation",
      ),
      appBar: AppBarGoBack(),
      backgroundColor: AppColors.appWideBackground,
      body: Stack(children: [
        Scrollbar(
          thumbVisibility: true,
          interactive: true,
          trackVisibility: true,
          controller: _scrollController,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 120,
                  color: const Color.fromARGB(255, 236, 229, 229),
                  child: Column(
                    children: [
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
                                    "Accounting / Licensing",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 16.0, top: 8.0),
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
                                  "Licensing",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
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
                  height: 220,
                  color: const Color(0xFFF7F8F8).withOpacity(0.5),
                  child: FutureBuilder(
                      future: _latestTestData,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: Text("Loading...",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black)),
                          );
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return const Center(
                              child: Text("No Data Available",
                                  style: TextStyle(fontSize: 16)));
                        } else {
                          String _currentDate =
                              snapshot.data?["_currentDate"] ?? "No Data";
                          String nextInvoiceDate =
                              snapshot.data?["_nextInvoiceDate"] ?? "No Data";
                          String billingPeriod =
                              snapshot.data?["billingPeriod"] ?? "No Data";

                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 16.0),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                                right: 8.0,
                              ),
                              child: Column(
                                // ✅ 用 Column 包裹多个 Row
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // 第一行：Current Date
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        width: 200,
                                        child: Text(
                                          "Current Date",
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 26, 27, 27),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          height: 16,
                                          width: 200,
                                          child: Text(
                                            _currentDate,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 20),

                                  // Billing Cycle
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        width: 200,
                                        child: Text(
                                          "Billing Cycle",
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 26, 27, 27),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 145,
                                        height: 28,
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
                                          value: _selectedBillingCycle,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 8, vertical: 4),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 2,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 2,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 2,
                                              ),
                                            ),
                                            fillColor: Colors.white,
                                            filled: true,
                                          ),
                                          items: BillingDate.map((cycle) =>
                                              DropdownMenuItem(
                                                value: cycle,
                                                child: Text(
                                                  cycle,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xFF007AFF),
                                                  ),
                                                ),
                                              )).toList(),
                                          onChanged: (value) {
                                            if (value == "Forthnightly") {
                                              _showBillingChangeDialog(
                                                  context, value!);
                                            } else {
                                              _selectedBillingCycle =
                                                  value; // Directly update if it's not "Forthnightly"
                                            }
                                          },
                                          icon: Icon(Icons.arrow_drop_down,
                                              color: Colors
                                                  .black), // Show dropdown arrow
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        width: 200,
                                        child: Text(
                                          "Next Invoice Issue Date",
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 26, 27, 27),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          height: 28,
                                          width: 200,
                                          child: Text(
                                            nextInvoiceDate,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        width: 200,
                                        child: Text(
                                          "Billing Period",
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 26, 27, 27),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          height: 50,
                                          width: 200,
                                          child: Text(billingPeriod),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      }),
                ),
                const SizedBox(height: 5),
                Container(
                  width: double.infinity,
                  height: 80,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 5.0, right: 5.0, bottom: 2.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16.0,
                            right: 16.0,
                          ),
                          child: Row(
                            children: [
                              const Text(
                                "GST",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              isMobileClinic
                                  ? const Text(
                                      "excluasive",
                                    )
                                  : const Text(
                                      "excluasive",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 28, 33, 39),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                              Transform.scale(
                                scale: 0.7,
                                child: Switch(
                                  activeColor: Colors.white,
                                  activeTrackColor: Colors.blueAccent,
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
                                        color: Color.fromARGB(255, 255, 26, 26),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  : const Text(
                                      "inclusive",
                                    )
                            ],
                          ),
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
                //update mune
                Container(
                  width: double.infinity,
                  height: 40,
                  color: Color(0xFFF7F8F8),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Current costs as of today",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "(updated daily 12:00 am)",
                              style: TextStyle(
                                  color: Color.fromARGB(234, 17, 12, 12),
                                  fontWeight: FontWeight.normal),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                //Tests Card
                const SizedBox(height: 10),
                FutureBuilder<List<Map<String, String>>>(
                  future: _filteredLicensingFuture, // ✅ 监听 Future 变量
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Text("Error: ${snapshot.error}");
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Text("No Data Available");
                    }

                    final List<Map<String, String>> licensingItems =
                        snapshot.data!; //

                    return Column(
                      children: licensingItems.map((licensing) {
                        String name = licensing['name'] ?? 'Unknown Test';
                        String amount = licensing['amount'] ?? '\$0.00';
                        String users = licensing['users'] ?? '0.00';
                        String licences = licensing['licences'] ?? '\$0.00';
                        String amountStr = licensing['amount']
                                ?.replaceAll(RegExp(r'[^\d.]'), '') ??
                            '0';
                        double originalAmount =
                            double.tryParse(amountStr) ?? 0.0;
                        // 解析 GST 价格
                        String gstStr = licensing['gst']
                                ?.replaceAll(RegExp(r'[^\d.]'), '') ??
                            '0';
                        double gstAmount = double.tryParse(gstStr) ?? 0.0;
                        // 计算最终金额
                        double finalAmount = isMobileClinic
                            ? (originalAmount - gstAmount)
                            : originalAmount;
                        // 格式化成字符串
                        String displayedAmount =
                            "\$${finalAmount.toStringAsFixed(2)}";

                        return Card(
                          color: Colors.white, // ✅ 轻灰色背景
                          elevation: 0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    "$name",
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                // ✅ 1. "Tested Type" 和 "Type of Collection"
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '$name',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 15),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "No. of Users",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),
                                    ),
                                    const SizedBox(
                                      width: 50,
                                    ),
                                    Text(
                                      "No. of Licences",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),
                                    ),
                                  ],
                                ),

                                // ✅ 3. On-Site Collection
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Container(
                                        width: 90,
                                        height: 40,
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          color: Color(0xFFCCF0F6),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          users,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 50),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Container(
                                        width: 90,
                                        height: 40,
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          color: Color(0xFFCCF0F6),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          licences,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "One Licence per Day",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(width: 40),
                                    Container(
                                      child: const Text(
                                        "\$ 1.00 ",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    const Icon(
                                      Icons.info_outline,
                                      color: Colors.blue,
                                      size: 20,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Center(
                                  child: Container(
                                    width: 300,
                                    height: 80,
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFCCF0F6),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center, // ✅ 保持整体居中
                                      crossAxisAlignment: CrossAxisAlignment
                                          .center, // ✅ 确保 GST Inclusive 在右侧
                                      children: [
                                        // ✅ 价格（始终居中）
                                        Expanded(
                                          child: Text(
                                            displayedAmount,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),

                                        // ✅ GST Inclusive（如果 isMobileClinic 为 true 才显示）
                                        if (isMobileClinic)
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                top: 15, right: 50),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .center, // ✅ 让 GST 和 Inclusive 保持居中
                                              children: [
                                                Text(
                                                  "GST",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.red, // ✅ 红色高亮
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  "Inclusive",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.red, // ✅ 红色高亮
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
                SizedBox(
                  height: 100,
                ),
                //Total Card
              ],
            ),
          ),
        ),
      ]),
    );
  }

  void _showBillingChangeDialog(BuildContext context, String newValue) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent closing by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white, // Set background color to white
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Column(
            children: [
              Icon(Icons.error, color: Colors.red, size: 40),
              SizedBox(height: 10),
              Text(
                "Changing Your Billing Cycle",
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          content: Text(
            "You're about to update your billing cycle.\n\n"
            "This will impact all your subscriptions. Would you like to continue?",
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _selectedBillingCycle = "Monthly"; // Update selection
                });
                Navigator.of(context).pop(); // Close dialog
              },
              child: Text("Cancel", style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF007AFF), // Confirm button color
              ),
              onPressed: () {
                _selectedBillingCycle = newValue; // Update selection
                Navigator.of(context).pop(); // Close dialog
                _showSuccessDialog(context, newValue); // Show success message
              },
              child: Text("Confirm"),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog(BuildContext context, String billingCycle) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent closing by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Column(
            children: [
              Icon(Icons.check_circle,
                  color: Colors.blue, size: 40), // Blue checkmark icon
              SizedBox(height: 10),
              Text(
                "Your billing cycle has been successfully updated to ${billingCycle}.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          content: Text(
            "It will be effective from your next billing period.\n\n"
            "Note: If there are any prorated charges or credits, they will be applied to your next bill.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF007AFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop(); // Close dialog
                },
                child: Text("Close"),
              ),
            ),
          ],
        );
      },
    );
  }
}
