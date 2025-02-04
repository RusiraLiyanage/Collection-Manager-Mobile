import 'dart:io';

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:project_code_blue/AppState/appState.dart';
import 'package:project_code_blue/Navigation/appBar.dart';
import 'package:project_code_blue/screens/OnsiteJobs/newJobAndroid.dart';
import 'package:project_code_blue/screens/OnsiteJobs/newJobIOS.dart';
import 'package:project_code_blue/sidemenu/sidemenu.dart';
import 'package:provider/provider.dart';

// Sticky Header Delegate for Filters
class _StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String selectedCity;
  final ValueChanged<String> onCityChanged;
  @override
  double get minExtent => 100;
  @override
  double get maxExtent => 100;

  _StickyHeaderDelegate({
    required this.selectedCity,
    required this.onCityChanged,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.lightBlue[100],
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButton<String>(
            value: selectedCity,
            onChanged: (value) {
              if (value != null) onCityChanged(value);
            },
            items: ["Newcastle City", "Sydney", "Melbourne"]
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
          ),
          DropdownButton<String>(
            value: "Newcastle City Council",
            onChanged: (value) {},
            items: ["Newcastle City Council", "Other Council"]
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
          ),
          SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true; // Ensures the UI updates when values change
  }
}

// Custom Header Section (Replaces SliverAppBar)
class _HeaderSectionDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 80; // Minimum height when collapsed
  @override
  double get maxExtent => 120; // Expanded height

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.blue,
      padding: const EdgeInsets.only(left: 135.0, top: 20),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: InkWell(
              onTap: () {
                _showBottomSheet(context);
              },
              child: ClipRRect(
                child: Image.asset("assets/images/icons/newJob_icon.png"),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              print("On tapped");
            },
            child: ClipRRect(
              child: Image.asset("assets/images/icons/newCallOutJob_icon.png"),
            ),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    if (Platform.isAndroid) {
      showModalBottomSheet(
        isScrollControlled: true,
        isDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.93,
            minChildSize: 0.93,
            maxChildSize: 0.93,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: NewJobAndroid(scrollController: scrollController),
              );
            },
          );
        },
      );
    } else if (Platform.isIOS) {
      showCupertinoModalBottomSheet(
        transitionBackgroundColor: Colors.transparent,
        enableDrag: false,
        isDismissible: false,
        expand: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.985,
          minChildSize: 0.985,
          maxChildSize: 0.985,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: const NewJob(),
            );
          },
        ),
      );
    }
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class OnsiteJobsNewHome extends StatefulWidget {
  const OnsiteJobsNewHome({super.key});

  @override
  State<OnsiteJobsNewHome> createState() => _OnsiteJobsNewHomeState();
}

// Job Card Widget
class JobCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Shoalhaven City Council",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text("Authorised Rep: Olivia Lopez"),
            Text("Mobile: 0451 226 338"),
            Text("Email: example@email.com"),
            Text("Callout: No"),
          ],
        ),
      ),
    );
  }
}

class _OnsiteJobsNewHomeState extends State<OnsiteJobsNewHome> {
  final ScrollController _scrollController = ScrollController();

  bool showMainJobs = true;

  bool archieveJobsOpened = false;

  // Add state variables for dropdown selections
  String selectedCity = "Newcastle City";
  String selectedCouncil = "Newcastle City Council";

  void updateCity(String newValue) {
    setState(() {
      selectedCity = newValue;
    });
  }

  @override
  void initState() {
    super.initState();
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
        setState(() {
          showMainJobs = true;
          archieveJobsOpened = false;
        });
      }
    });
  }

  bool isAtBottom = false;
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
      appBar: const MyAppBar(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          bottom: 85.0,
          left: 3.0,
        ),
        child: Container(
          height: 40.0,
          width: 40.0,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {
                if (isAtBottom) {
                  // Scroll to the top
                  _scrollController.animateTo(
                    0,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeOut,
                  );
                } else {
                  // Scroll to the bottom
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
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            // Collapsible Header (First Section)
            SliverPersistentHeader(
              delegate: _HeaderSectionDelegate(),
              pinned: false, // Disappears when scrolling down
              floating: false,
            ),

            // Sticky Filter Section
            SliverPersistentHeader(
              pinned: false, // Stays at the top when scrolling
              delegate: _StickyHeaderDelegate(
                selectedCity: selectedCity,
                onCityChanged: updateCity,
              ),
            ),
          ];
        },
        body: ListView.builder(
          padding: EdgeInsets.only(top: 8),
          itemCount: 15, // Example count
          itemBuilder: (context, index) {
            return JobCard();
          },
        ),
      ),
    );
  }
}
