import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_code_blue/AppState/appState.dart';
import 'package:project_code_blue/Navigation/appBar.dart';
import 'package:project_code_blue/sidemenu/sidemenu.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CollectorsCalendar extends StatefulWidget {
  const CollectorsCalendar({super.key});

  @override
  State<CollectorsCalendar> createState() => _CollectorsCalendarState();
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) => _getMeetingData(index).from;

  @override
  DateTime getEndTime(int index) => _getMeetingData(index).to;

  @override
  String getSubject(int index) => _getMeetingData(index).eventName;

  @override
  Color getColor(int index) => _getMeetingData(index).background;

  @override
  bool isAllDay(int index) => _getMeetingData(index).isAllDay;

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    return meeting as Meeting;
  }
}

class _CollectorsCalendarState extends State<CollectorsCalendar> {
  final ScrollController _scrollController = ScrollController();
  DateTime? _selectedDate;
  List<Meeting> _appointments = [];

  List<Meeting> _getDataSource() {
    return [
      Meeting('Team Meeting', DateTime(2025, 4, 2, 10, 0),
          DateTime(2025, 4, 2, 11, 0), const Color(0xFF0F8644), false),
      Meeting('Extended Meeting', DateTime(2025, 4, 2, 12, 0),
          DateTime(2025, 4, 2, 13, 0), const Color(0xFF00B4D1), false),
      Meeting('Project Deadline', DateTime(2025, 4, 5, 9, 0),
          DateTime(2025, 4, 5, 10, 0), const Color(0xFFD32F2F), false),
      Meeting('Client Call', DateTime(2025, 4, 8, 14, 0),
          DateTime(2025, 4, 8, 15, 0), const Color(0xFF1976D2), false),
      Meeting('Workshop', DateTime(2025, 4, 12, 13, 0),
          DateTime(2025, 4, 12, 16, 0), const Color(0xFFFFA000), false),
      Meeting('Conference', DateTime(2025, 4, 15, 9, 0),
          DateTime(2025, 4, 15, 17, 0), const Color(0xFF8E24AA), false),
    ];
  }

  void initState() {
    super.initState();
    DateTime today = DateTime.now();
    _selectedDate = today;
    _appointments = _getDataSource()
        .where((meeting) =>
            meeting.from.year == today.year &&
            meeting.from.month == today.month &&
            meeting.from.day == today.day)
        .toList();
  }

  void _onCalendarTapped(CalendarTapDetails details) {
    if (details.targetElement == CalendarElement.calendarCell &&
        details.date != null) {
      setState(() {
        _selectedDate = details.date!;
        _appointments = _getDataSource()
            .where((meeting) =>
                meeting.from.year == _selectedDate!.year &&
                meeting.from.month == _selectedDate!.month &&
                meeting.from.day == _selectedDate!.day)
            .toList();
      });
    }
  }

  // Helper function to format time (HH:mm AM/PM)
  String _formatTime(DateTime dateTime) {
    return DateFormat.jm().format(dateTime); // Example: 10:00 AM
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
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
                color: Color(0xFFD9D9D9),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            "Home / Collectors Calendar",
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
                            "Collectors Calendar",
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
              /* SizedBox(
                height: 10,
              ), */
              Container(
                child: SfCalendar(
                  showNavigationArrow: true,
                  todayHighlightColor: Color(0xFF007AFF),
                  cellBorderColor: Colors.white,
                  backgroundColor: Colors.white,
                  view: CalendarView.month,
                  dataSource: MeetingDataSource(_getDataSource()),
                  onTap: _onCalendarTapped,
                  monthViewSettings: const MonthViewSettings(
                    appointmentDisplayMode:
                        MonthAppointmentDisplayMode.indicator,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              _appointments.isNotEmpty
                  ? ListView.builder(
                      padding: EdgeInsets.all(0),
                      shrinkWrap: true,
                      physics:
                          NeverScrollableScrollPhysics(), // Prevents nested scroll issues
                      itemCount: _appointments.length,
                      itemBuilder: (context, index) {
                        final meeting = _appointments[index];

                        return Card(
                          color: Colors.white,
                          margin:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Vertical color bar
                                Container(
                                  width: 5,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: meeting.background,
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                                SizedBox(width: 12),

                                // Event details
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        meeting.eventName,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        "Reason", // Placeholder for a reason (can be replaced with real data)
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),

                                // Event times
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "${_formatTime(meeting.from)}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "${_formatTime(meeting.to)}",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : const Center(child: Text("No appointments for this day.")),
            ],
          ),
        ),
      ),
    );
  }
}
