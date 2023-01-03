import 'package:neatch/pages/calendar/widgets/notch.dart';
import 'package:flutter/material.dart';
import 'package:neatch/pages/calendar/widgets/options.dart';

import 'package:table_calendar/table_calendar.dart';

import 'package:neatch/config/palette.dart';
import 'package:neatch/config/size_config.dart';
import 'package:intl/intl.dart';

const _horizontalPadding = 40.0;

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final DateFormat dateFormat = DateFormat('dd MMMM yyyy');
  DateTime _chosenDate = DateTime.now();

  CalendarController _calendarController;
  Map<DateTime, List<dynamic>> _events = {};

  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: getProportionateScreenHeight(40)),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          getProportionateScreenWidth(_horizontalPadding)),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Container(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back,
                              color: Palette.kLightColor),
                        ),
                      )),
                      const Spacer(),
                      Text(
                        "Cleaner Calendar",
                        style: TextStyle(
                          color: Palette.kLightColor,
                          fontSize: getProportionateScreenWidth(34.0),
                          fontWeight: FontWeight.w700,
                          fontFamily: "Ubuntu",
                          height: 1.4,
                        ),
                      ),
                      const Spacer(flex: 2)
                    ],
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(40)),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          getProportionateScreenWidth(_horizontalPadding)),
                  child: TableCalendar(
                    calendarStyle: CalendarStyle(
                      canEventMarkersOverflow: true,
                      markersColor: Palette.kLightColor,
                      weekdayStyle: TextStyle(color: Palette.kLightColor),
                      todayColor: Palette.kSecondaryColor,
                      todayStyle: TextStyle(
                        color: Palette.kLightColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      selectedColor: Palette.kTertiaryColor,
                      outsideWeekendStyle: TextStyle(color: Palette.lightGrey),
                      outsideStyle: TextStyle(color: Palette.lightGrey),
                      weekendStyle: TextStyle(color: Palette.kLightColor),
                      renderDaysOfWeek: false,
                    ),
                    calendarController: _calendarController,
                    events: _events,
                    availableCalendarFormats: const {
                      CalendarFormat.twoWeeks: ''
                    },
                    initialCalendarFormat: CalendarFormat.twoWeeks,
                    onDaySelected: (date, events, e) {
                      setState(() {
                        _chosenDate = date;
                      });
                    },
                    headerStyle: HeaderStyle(
                      headerMargin: EdgeInsets.only(bottom: 10),
                      centerHeaderTitle: true,
                      formatButtonVisible: false,
                      leftChevronIcon: Icon(Icons.arrow_back_ios,
                          size: 15, color: Palette.kLightColor),
                      rightChevronIcon: Icon(Icons.arrow_forward_ios,
                          size: 15, color: Palette.kLightColor),
                      leftChevronMargin: EdgeInsets.only(left: 50),
                      rightChevronMargin: EdgeInsets.only(right: 50),
                      leftChevronPadding: EdgeInsets.all(0),
                      rightChevronPadding: EdgeInsets.all(0),
                      titleTextStyle:
                          TextStyle(color: Palette.kLightColor, fontSize: 16),
                      formatButtonDecoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      formatButtonTextStyle: TextStyle(
                          color: Colors.red,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(40)),
              ],
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Stack(
                children: <Widget>[
                  Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Palette.kPrimaryColor, width: 0),
                        color: Palette.kLightBackground,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                  height: getProportionateScreenHeight(40)),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: getProportionateScreenWidth(
                                        _horizontalPadding)),
                                child: Text(
                                  dateFormat.format(_chosenDate),
                                  style: TextStyle(
                                    fontSize: getProportionateScreenWidth(19.0),
                                    color: Palette.darkerGrey,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Ubuntu",
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                  height: getProportionateScreenHeight(30)),
                              AppointmentRadio(),
                              SizedBox(
                                  height: getProportionateScreenHeight(80)),
                            ]),
                      )),
                  Align(
                    alignment: Alignment.topCenter,
                    child: ClipPath(
                      clipper: AppClipper(),
                      child: Container(
                        width: 150,
                        height: 60,
                        color: Palette.kPrimaryColor,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Icon(
                      Icons.expand_more,
                      size: 20.0,
                      color: Palette.kLightColor,
                    ),
                  ), // your column
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
