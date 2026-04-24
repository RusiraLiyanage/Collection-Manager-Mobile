import 'dart:ui';

import 'package:project_code_blue/screens/CollectorsCalendar/collectorsCalendar.dart';

class CalendarData {
  List<Meeting> calendarData = [
    Meeting(
        'Unavailable',
        DateTime(2025, 4, 2, 10, 0),
        DateTime(2025, 4, 2, 11, 0),
        const Color(0xFFD32F2F),
        false,
        "Due to unforseen circumstances, my attendance will no longer be proceeding"),
    Meeting(
        'Unavailable',
        DateTime(2025, 4, 2, 12, 0),
        DateTime(2025, 4, 2, 13, 0),
        const Color(0xFFD32F2F),
        false,
        "Due to unforseen circumstances, my attendance will no longer be proceeding"),
    Meeting(
        'Unavailable',
        DateTime(2025, 4, 2, 12, 0),
        DateTime(2025, 4, 2, 13, 0),
        const Color(0xFFD32F2F),
        false,
        "Due to unforseen circumstances, my attendance will no longer be proceeding"),
    Meeting(
        'Unavailable',
        DateTime(2025, 4, 5, 9, 0),
        DateTime(2025, 4, 5, 10, 0),
        const Color(0xFFD32F2F),
        false,
        "Due to unforseen circumstances, my attendance will no longer be proceeding"),
    Meeting(
        'Unavailable',
        DateTime(2025, 4, 8, 14, 0),
        DateTime(2025, 4, 8, 15, 0),
        const Color(0xFFD32F2F),
        false,
        "Due to unforseen circumstances, my attendance will no longer be proceeding"),
    Meeting('Leave', DateTime(2025, 4, 12, 13, 0), DateTime(2025, 4, 12, 16, 0),
        const Color(0xFFEB41E4), false, "I am on leave as I am not doing well"),
    Meeting(
        'Leave',
        DateTime(2025, 4, 15, 9, 0),
        DateTime(2025, 4, 15, 17, 0),
        const Color(0xFFEB41E4),
        false,
        "I am on leave as the babysitters in Australia are so expensive"),
    Meeting(
        'Leave',
        DateTime(2025, 4, 2, 13, 0),
        DateTime(2025, 4, 2, 14, 0),
        const Color(0xFFEB41E4),
        false,
        "I am on leave as the babysitters in Australia are so expensive"),
  ];
}
