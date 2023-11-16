import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime? selectedDay;
  DateTime focusedDay = DateTime.now();

  String memo = '';

  TextEditingController memoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final defaultBoxDeco = BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(6.0),
    );

    final defaultTextStyle = TextStyle(
      color: Colors.grey[600],
      fontWeight: FontWeight.w700,
    );

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              TableCalendar(
                focusedDay: focusedDay,
                firstDay: DateTime(1800),
                lastDay: DateTime(3000),
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle:
                      TextStyle(fontWeight: FontWeight.w700, fontSize: 16.0),
                ),
                calendarStyle: CalendarStyle(
                  isTodayHighlighted: false,
                  defaultDecoration: defaultBoxDeco,
                  weekendDecoration: defaultBoxDeco,
                  outsideDecoration: BoxDecoration(shape: BoxShape.rectangle),
                  selectedDecoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6.0),
                    border: Border.all(
                        color: Color.fromARGB(255, 12, 161, 70), width: 3.0),
                  ),
                  defaultTextStyle: defaultTextStyle,
                  weekendTextStyle: defaultTextStyle,
                  selectedTextStyle: defaultTextStyle.copyWith(
                      color: Color.fromARGB(255, 12, 161, 70)),
                ),
                onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                  setState(() {
                    this.selectedDay = selectedDay;
                    this.focusedDay = focusedDay;
                  });
                },
                selectedDayPredicate: (DateTime date) {
                  if (selectedDay == null) {
                    return false;
                  }

                  return date.year == selectedDay!.year &&
                      date.month == selectedDay!.month &&
                      date.day == selectedDay!.day;
                },
              ),
              SizedBox(
                height: 50.0,
              ),
              if (selectedDay != null)
                Column(
                  children: [
                    Text('Selected Day: ${selectedDay!.toLocal()}'),
                    SizedBox(height: 8.0),
                    Text('Memo:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextFormField(
                      initialValue: memo,
                      onChanged: (value) {
                        setState(() {
                          memo = value;
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Read data here...',
                      ),
                      maxLines: 3,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      initialValue: memo,
                      onChanged: (value) {
                        setState(() {
                          memo = value;
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Read data here...',
                      ),
                      maxLines: 3,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      initialValue: memo,
                      onChanged: (value) {
                        setState(() {
                          memo = value;
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Write your memo here...',
                      ),
                      maxLines: 3,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
