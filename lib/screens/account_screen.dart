// ignore_for_file: library_private_types_in_public_api, unused_element

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'bottomnavigation.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    today = day;
  }

  int _selectedIndex = 0;

  void _handleSelectionChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20.0, top: 60),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Keep tabs on your hydration levels",
                  style: TextStyle(
                    wordSpacing: 1,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .001),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "with our tracker",
                  style: TextStyle(
                    wordSpacing: 1,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .05),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 30),
              child: Row(
                children: [
                  const Text(
                    'Water Consumption Tracker',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  const Expanded(
                    child: SizedBox.shrink(),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF9DCEFF),
                          Color(0xFF87A6FF),
                        ],
                      ),
                      border: Border.all(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
                      child: Text(
                        'Weekly',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Text(today.toString().split(" ")[0]),
                    TableCalendar(
                      rowHeight: 43,
                      headerStyle: const HeaderStyle(
                      formatButtonVisible: false, titleCentered: false),
                      availableGestures: AvailableGestures.all,
                      selectedDayPredicate: (day)=>isSameDay(day,today),
                      focusedDay: today,
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 9, 20),
                      onDaySelected: _onDaySelected,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onIndexChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
