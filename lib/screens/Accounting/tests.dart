import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_code_blue/AppState/appState.dart';
import 'package:project_code_blue/Navigation/appBarGoBack.dart';
import 'package:project_code_blue/sidemenu/sidemenu.dart';
import 'package:provider/provider.dart';

class Tests extends StatefulWidget {
  const Tests({super.key});

  @override
  State<Tests> createState() => _TestsState();
}

class _TestsState extends State<Tests> {
  late Future<Map<String, String>> _latestTestData;

  String? _selectedValue;

  String? _selectedBillingCycle;

  bool isMobileClinic = false;

  final TextEditingController _endDateController = TextEditingController();

  final ScrollController _scrollController = ScrollController();

  final TextEditingController _startDateController = TextEditingController();

  final List<String> BillingDate = [
    "Monthly",
    "Forthnightly",
  ];

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
          'type': 'Tested Donors',
          'gst': '\$10',
          'BillingDate': 'Fortnightly',
        },
        {
          'name': 'Requested Laboratory Tests',
          'amount': '\$105.00',
          'date': '2025-02-15',
          'InClinic': '7',
          'OnSite': '14',
          'type': 'Digital Chain of Cutody',
          'gst': '\$10',
          'BillingDate': 'Monthly',
        },
      ],
      'licensing': [
        {
          'name': 'Collection Manager',
          'amount': '\$90.00',
          'date': '2024-06-9',
          'users': '10',
          'licences': '10',
          'gst': '\$10',
          'BillingDate': 'Monthly',
        },
        {
          'name': 'Collection Manager Mobile',
          'amount': '\$90.00',
          'date': '2025-01-15',
          'users': '10',
          'licences': '10',
          'gst': '\$10',
          'BillingDate': 'Fortnightly',
        },
        {
          'name': 'Collect Assist',
          'amount': '\$300.00',
          'date': '2024-12-15',
          'users': '10',
          'licences': '10',
          'gst': '\$10',
          'BillingDate': 'Monthly',
        },
        {
          'name': 'Secure Assist',
          'amount': '\$500.00',
          'date': '2024-03-15',
          'users': '10',
          'licences': '10',
          'gst': '\$10',
          'BillingDate': 'Fortnightly',
        },
        {
          'name': 'Report Assist',
          'amount': '\$100.00',
          'date': '2024-06-15',
          'users': '10',
          'licences': '10',
          'gst': '\$10',
          'BillingDate': 'Monthly',
        },
        {
          'name': 'Work Assist',
          'amount': '\$100.00',
          'date': '2024-07-15',
          'users': '10',
          'licences': '10',
          'gst': '\$10',
          'BillingDate': 'Fortnightly',
        },
        {
          'name': 'Welcome Assist',
          'amount': '\$90.00',
          'date': '2024-05-15',
          'users': '10',
          'licences': '10',
          'gst': '\$10',
          'BillingDate': 'Fortnightly',
        },
      ],
      'IT Services (Additional Services)': [
        {
          'name': 'Collect Assist',
          'amount': '\$300.00',
          'date': '2024-07-18',
          'gst': '\$10',
          'BillingDate': 'Monthly',
        },
        {
          'name': 'Secure Assist',
          'amount': '\$500.00',
          'date': '2024-05-05',
          'gst': '\$10',
          'BillingDate': 'Monthly',
        },
        {
          'name': 'Report Assist',
          'amount': '\$100.00',
          'date': '2024-03-16',
          'gst': '\$10',
          'BillingDate': 'Fortnightly',
        },
        {
          'name': 'Work Assist',
          'amount': '\$100.00',
          'date': '2024-07-13',
          'gst': '\$10',
          'BillingDate': 'Fortnightly',
        },
        {
          'name': 'Welcome Assist',
          'amount': '\$100.00',
          'date': '2024-05-01',
          'gst': '\$10',
          'BillingDate': 'Fortnightly',
        },
      ],
      'Client Onboarding (Setup)': [
        {
          'name': 'Setsadee',
          'amount': '\$1153.00',
          'date': '2024-05-15',
          'gst': '\$10',
          'BillingDate': 'Fortnightly',
        },
        {
          'name': 'Setasfe',
          'amount': '\$14210.00',
          'date': '2024-04-15',
          'gst': '\$10',
          'BillingDate': 'Fortnightly',
        },
        {
          'name': 'Setasde',
          'amount': '\$1240.00',
          'date': '2024-03-15',
          'gst': '\$10',
          'BillingDate': 'Fortnightly',
        },
        {
          'name': 'SeasfFee',
          'amount': '\$3220.00',
          'date': '2024-01-01',
          'gst': '\$10',
          'BillingDate': 'Monthly',
        },
        {
          'name': 'SetasdFee',
          'amount': '\$5320.00',
          'date': '2024-09-14',
          'gst': '\$10',
          'BillingDate': 'Fortnightly',
        },
        {
          'name': 'Setup Fee',
          'amount': '\$2425.00',
          'date': '2024-07-15',
          'gst': '\$10',
          'BillingDate': 'Monthly',
        },
      ],
    };
  }

  Future<List<Map<String, String>>> _fetchFilteredtestsItems() async {
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

  DateTime? _parseDate(String dateStr) {
    try {
      return DateFormat("yyyy-MM-dd").parse(dateStr);
    } catch (e) {
      print("error");
      return null;
    }
  }

  String formatDate(DateTime date) {
    return DateFormat('d MMMM yyyy').format(date);
  }

  Future<List<Map<String, String>>>? _filteredtestsFuture;

  Future<void> debugFetchData() async {
    Map<String, List<Map<String, String>>> data =
        await fetchGroupConsumptionItems();
    print("Fetched Data: $data");
  }

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose(); // Dispose the controller when done
    _scrollController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    _selectedBillingCycle = "";
    _latestTestData = _fetchLatestTestData();
    _filteredtestsFuture = _fetchFilteredtestsItems();
    _selectedBillingCycle = BillingDate.first;
    debugFetchData();
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      extendBodyBehindAppBar: false, // Ensure content starts below AppBar
      onDrawerChanged: (isOpen) {
        appState.setDrawerState(isOpen);
      },
      drawer: SideMenu(navigationType: "subPartNavigation"),
      appBar: AppBarGoBack(),
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
                        color: Color(0xFFD9D9D9),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Text(
                                    "Accounting / Tests",
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
                                  "Tests",
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
                  future: _filteredtestsFuture, // ✅ 监听 Future 变量
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Text("Error: ${snapshot.error}");
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Text("No Data Available");
                    }

                    final List<Map<String, String>> testsItems = snapshot.data!;

                    return Column(
                      children: testsItems.map((test) {
                        String name = test['name'] ?? 'Unknown Test';
                        String amount = test['amount'] ?? '\$0.00';
                        String type = test['type'] ?? 'Unknown Type';
                        int inClinic =
                            int.tryParse(test['InClinic'] ?? '0') ?? 0;
                        int onSite = int.tryParse(test['OnSite'] ?? '0') ?? 0;
                        int total = inClinic + onSite; // ✅ 计算总数
                        // 获取金额字符串，去掉 "$" 和 逗号
                        String amountStr =
                            test['amount']?.replaceAll(RegExp(r'[^\d.]'), '') ??
                                '0';
                        double originalAmount =
                            double.tryParse(amountStr) ?? 0.0;
                        // 解析 GST 价格
                        String gstStr =
                            test['gst']?.replaceAll(RegExp(r'[^\d.]'), '') ??
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // ✅ 测试项目标题
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    "$name TESTS",
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                // ✅ 1. "Tested Type" 和 "Type of Collection"
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '$type',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 15), // ✅ 增加间隔
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Type of Collection',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Text(
                                      'Tested Donors',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                // ✅ 2. In-Clinic Collection
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "In-Clinic Collection",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),
                                    ),
                                    const Divider(
                                        color: Color.fromARGB(255, 36, 28, 28),
                                        thickness: 0.5,
                                        height: 16),
                                    Text(
                                      "$inClinic",
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.black),
                                    ),
                                    const Divider(
                                        color: Color.fromARGB(255, 31, 28, 28),
                                        thickness: 0.5,
                                        height: 16),
                                  ],
                                ),

                                // ✅ 3. On-Site Collection
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "On-Site Collection",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),
                                    ),
                                    const Divider(
                                        color: Color.fromARGB(255, 37, 33, 33),
                                        thickness: 0.5,
                                        height: 16),
                                    Text(
                                      "$onSite",
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.black),
                                    ),
                                    const Divider(
                                        color: Color.fromARGB(255, 20, 16, 16),
                                        thickness: 0.5,
                                        height: 16),
                                  ],
                                ),
                                const SizedBox(height: 15),
                                // ✅ 4. 总计
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Spacer(),
                                    const Text(
                                      "Total",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(width: 80),
                                    Container(
                                      width: 150,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 0.0, horizontal: 12.0),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFCCF0F6),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "$total",
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 10),
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
                                              fontSize: 16,
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
