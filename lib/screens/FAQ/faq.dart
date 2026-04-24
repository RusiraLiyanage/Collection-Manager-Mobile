import 'package:flutter/material.dart';
import 'package:flutter_easy_faq/flutter_easy_faq.dart';
import 'package:project_code_blue/AppState/appState.dart';
import 'package:project_code_blue/ColorSchemas/AppColors.dart';
import 'package:project_code_blue/Navigation/appBar.dart';
import 'package:project_code_blue/screens/FAQ/Data/faqData.dart';
import 'package:project_code_blue/sidemenu/sidemenu.dart';
import 'package:provider/provider.dart';

class FAQ extends StatefulWidget {
  const FAQ({super.key});

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  @override
  void dispose() {
    _scrollController.dispose();
    _faqSearchController.dispose();
    super.dispose();
  }

  final ScrollController _scrollController = ScrollController();
  final TextEditingController _faqSearchController = TextEditingController();

  List<Map<String, dynamic>> faqData = FaqData().FAQsAndAnswers;

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    return Scaffold(
      backgroundColor: AppColors.appWideBackground,
      extendBodyBehindAppBar: true, // Extends body behind the AppBar
      drawer: SideMenu(
        navigationType: "sideNavigation",
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
                            "Home / FAQ",
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
                            "FAQ",
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
                height: 120,
                color: Color(0xFFE6F7FA),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset("assets/images/icons/FAQPage.png"),
                      Text(
                        "Frequently Asked Questions",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF00004C),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 250,
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
                        child: TextFormField(
                          controller: _faqSearchController,
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
                            hintText: 'Search FAQs', // Placeholder text
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(
                                  8.0), // Adjust the padding as needed
                              child: Image.asset(
                                "assets/images/icons/searchIcon.png", // Replace with your image path
                                width: 15, // Adjust the width of the image
                                height: 15, // Adjust the height of the image
                              ),
                            ),
                            hintStyle: TextStyle(
                              color: Color(0xFF007AFF),
                            ), // Style for the hint text
                          ),
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF007AFF),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _faqSearchController.text = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true, // ✅ Prevents unbounded height
                  padding: EdgeInsets.all(0),
                  itemCount: faqData.length,
                  itemBuilder: (context, platformIndex) {
                    var platform = faqData[platformIndex];
                    return Container(
                      // Background applied to the whole container
                      child: ExpansionTile(
                        collapsedBackgroundColor: Color(0xFF01B4D2),
                        backgroundColor: Color(0xFF01B4D2).withOpacity(0.5),
                        title: Text(platform['platform']),
                        tilePadding: EdgeInsets.symmetric(horizontal: 16),
                        childrenPadding:
                            EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                        children: [
                          ListView.builder(
                            padding: EdgeInsets.all(0),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: platform['subjects'].length,
                            itemBuilder: (context, subjectIndex) {
                              var subject = platform['subjects'][subjectIndex];
                              return Container(
                                color: Color(
                                    0xFFE4F6FB), // Background applied to the subject container
                                child: ExpansionTile(
                                  title: Text(subject['subject']),
                                  tilePadding:
                                      EdgeInsets.symmetric(horizontal: 16),
                                  childrenPadding: EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 8),
                                  children: subject['faqs'].map<Widget>((faq) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0, vertical: 4),
                                      child: Container(
                                        color: Colors
                                            .white, // Ensures each FAQ item has a white background
                                        child: EasyFaq(
                                          backgroundColor: Colors.white,
                                          question: faq['question'],
                                          answer: faq['answer'],
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
