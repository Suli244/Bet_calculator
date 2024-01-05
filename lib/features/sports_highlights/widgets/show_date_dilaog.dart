import 'package:bet_calculator/theme/app_colors.dart';
import 'package:bet_calculator/theme/app_text_styles.dart';
import 'package:bet_calculator/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

Future<DateTime> showDateDialog(
  BuildContext context,
  DateTime selectedDate,
) async {
  DateTime nowDate = selectedDate;
  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      insetPadding: EdgeInsets.zero,
      content: SizedBox(
        width: context.width,
        child: TableCalendar(
          daysOfWeekVisible: false,
          headerStyle: HeaderStyle(
            titleTextStyle: AppTextStylesBetCalculator.s25W500(
              color: Colors.black,
            ),
            formatButtonVisible: false,
            titleCentered: true,
          ),
          calendarStyle: CalendarStyle(
            defaultTextStyle: AppTextStylesBetCalculator.s12W400(),
            defaultDecoration: BoxDecoration(
              borderRadius: BorderRadius.zero,
              color: const Color(0xFF007BF6).withOpacity(0.1),
            ),
            weekNumberTextStyle: AppTextStylesBetCalculator.s12W400(),
            weekendDecoration: BoxDecoration(
              borderRadius: BorderRadius.zero,
              color: const Color(0xFF007BF6).withOpacity(0.1),
            ),
            todayDecoration: BoxDecoration(
              borderRadius: BorderRadius.zero,
              color: const Color(0xFF007BF6).withOpacity(0.1),
            ),
            todayTextStyle: AppTextStylesBetCalculator.s12W400(),
            selectedDecoration: const BoxDecoration(
              borderRadius: BorderRadius.zero,
              color: AppColors.color144D87,
            ),
            outsideDaysVisible: false,
          ),
          focusedDay: nowDate,
          selectedDayPredicate: (day) => isSameDay(nowDate, day),
          firstDay: DateTime.utc(2010, 01, 01),
          lastDay: DateTime.utc(2030, 12, 31),
          onDaySelected: (selectedDay, focusedDay) {
            nowDate = selectedDay;
            Navigator.pop(context);
          },
        ),
      ),
    ),
  );
  return nowDate;
}
