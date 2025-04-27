import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_code_blue/AppState/appState.dart';
import 'package:project_code_blue/ColorSchemas/AppColors.dart';
import 'package:project_code_blue/Navigation/appBar.dart';
import 'package:project_code_blue/screens/CollectorsCalendar/Data/calendarData.dart';
import 'package:project_code_blue/sidemenu/sidemenu.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CollectorsCalendar extends StatefulWidget {
  const CollectorsCalendar({super.key});

  @override
  State<CollectorsCalendar> createState() => _CollectorsCalendarState();
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay,
      this.reason);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
  String reason;
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

  @override
  String getReason(int index) => _getMeetingData(index).reason;

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    return meeting as Meeting;
  }
}

class _CollectorsCalendarState extends State<CollectorsCalendar> {
  final ScrollController _scrollController = ScrollController();
  String? _selectedValue;
  String? _selectedCollector;
  DateTime? _selectedDate;
  List<Meeting> _appointments = [];
  final List<String> items = [
    "All",
    "Newcastle City",
    "Sydney Office",
    "Melbourne Branch",
  ]; //

  final List<String> collectors = [
    "All",
    "Collector 1",
    "Collector 2",
    "Collector 3",
    "Collector 4",
  ]; //

  List<Meeting> _getDataSource() {
    return CalendarData().calendarData;
  }

  void initState() {
    super.initState();
    DateTime today = DateTime.now();
    _selectedValue = items.first;
    _selectedCollector = collectors.first;
    _selectedDate = today;
    _appointments = _getDataSource()
        .where((meeting) =>
            meeting.from.year == today.year &&
            meeting.from.month == today.month &&
            meeting.from.day == today.day)
        .toList();
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Dispose the controller when done
    super.dispose();
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
                            "Home / Collectors Availability",
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
                            "Collectors Availability",
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

              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                      top: 10.0,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 52.0),
                          child: Text(
                            "Service Office",
                            style: TextStyle(
                              color: Color(0xFF005277),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          width: 190,
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
                            value: _selectedValue,
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
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                      top: 10.0,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 52.0),
                          child: Text(
                            "Collector",
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
                          width: 190,
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
                            value: _selectedCollector,
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
                            items: collectors
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
                                _selectedCollector = value;
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
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: SfCalendar(
                  showTodayButton: true,
                  firstDayOfWeek: 1,
                  showNavigationArrow: true,
                  todayHighlightColor: Color(0xFF007AFF),
                  cellBorderColor: Colors.white,
                  backgroundColor: Colors.white,
                  headerStyle: CalendarHeaderStyle(
                    backgroundColor: Colors.white,
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  viewHeaderStyle: ViewHeaderStyle(
                    backgroundColor: Colors.white,
                    dayTextStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  view: CalendarView.month,
                  showDatePickerButton: true,
                  dataSource: MeetingDataSource(_getDataSource()),
                  onTap: _onCalendarTapped,
                  monthViewSettings: const MonthViewSettings(
                    appointmentDisplayMode:
                        MonthAppointmentDisplayMode.indicator,
                  ),
                  selectionDecoration: BoxDecoration(
                    color: Colors.blueAccent
                        .withOpacity(0.3), // Change the color here
                    border: Border.all(
                        color: Colors.blue, width: 2), // Optional border
                    borderRadius:
                        BorderRadius.circular(5), // Optional rounded corners
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),
              _appointments.isNotEmpty
                  ? ListView.builder(
                      padding: EdgeInsets.only(
                        bottom: 100,
                        top: 0,
                        left: 0,
                        right: 0,
                      ),
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
                                  height: 90,
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
                                      Row(
                                        children: [
                                          Image.asset(
                                            "assets/images/icons/newClient.png",
                                            width: 25,
                                            height: 25,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text("Mr. Rusira Rusira !!")
                                        ],
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        meeting.reason,
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
                                        fontSize: 14,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                      ),
                      child: const Center(
                        child: Text("No Unavailability or Leave this day."),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
