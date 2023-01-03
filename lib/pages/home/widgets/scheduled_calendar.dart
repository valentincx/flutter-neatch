import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:neatch/config/size_config.dart';
import 'package:neatch/config/palette.dart';

const _horizontalPadding = 40.0;
const _animDuration = 500;

class CalendarWidget extends StatefulWidget {
  CalendarWidget({Key key}) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget>
    with TickerProviderStateMixin {
  Map<DateTime, List> _events;
  List _selectedEvents;
  AnimationController _animationController;
  CalendarController _calendarController;

  final DateFormat dateFormat = DateFormat('MM.dd.yy');
  DateTime _chosenDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('en_US', null);

    final _selectedDay = DateTime.now();

    _events = {
      _selectedDay.subtract(Duration(days: 28)): [
        {
          "name": "Michael Hamilton",
          "schedule": "8AM - 11AM",
          "image": "assets/images/profile2.png",
          "type": "Initial Cleaning",
        },
      ],
      _selectedDay.subtract(Duration(days: 14)): [
        {
          "name": "Alexandra Johnson",
          "schedule": "5PM - 7PM",
          "image": "assets/images/profile.png",
          "type": "Upkeep Cleaning",
        },
      ],
      _selectedDay: [
        {
          "name": "Michael Hamilton",
          "schedule": "10AM - 11AM",
          "image": "assets/images/profile2.png",
          "type": "Upkeep Cleaning",
        },
        {
          "name": "Alexandra Johnson",
          "schedule": "7AM - 8AM",
          "image": "assets/images/profile.png",
          "type": "Upkeep Cleaning",
        },
        {
          "name": "Michael Hamilton",
          "schedule": "7PM - 8PM",
          "image": "assets/images/profile2.png",
          "type": "Upkeep Cleaning",
        },
      ],
      _selectedDay.add(Duration(days: 7)): [
        {
          "name": "Michael Hamilton",
          "schedule": "2PM - 4PM",
          "image": "assets/images/profile2.png",
          "type": "Upkeep Cleaning",
        },
      ],
      _selectedDay.add(Duration(days: 13)): [
        {
          "name": "Alexandra Johnson",
          "schedule": "8AM - 9AM",
          "image": "assets/images/profile.png",
          "type": "Upkeep Cleaning",
        },
      ],
      _selectedDay.add(Duration(days: 21)): [
        {
          "name": "Michael Hamilton",
          "schedule": "3PM - 5PM",
          "image": "assets/images/profile2.png",
          "type": "Upkeep Cleaning",
        },
      ],
      _selectedDay.add(Duration(days: 28)): [
        {
          "name": "Alexandra Johnson",
          "schedule": "7AM - 8AM",
          "image": "assets/images/profile.png",
          "type": "Upkeep Cleaning",
        },
      ],
    };
    _selectedEvents = _events[_selectedDay] ?? [];
    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events, List holidays) {
    //print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
      _chosenDate = day;
    });
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    //print('CALLBACK: _onVisibleDaysChanged');
  }

  void _onCalendarCreated(
      DateTime first, DateTime last, CalendarFormat format) {
    //print('CALLBACK: _onCalendarCreated');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildEventList(),
        _buildTableCalendarWithBuilders(),
      ],
    );
  }

  // More advanced TableCalendar configuration (using Builders & Styles)
  Widget _buildTableCalendarWithBuilders() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(_horizontalPadding)),
      child: Container(
          padding: EdgeInsets.all(
              getProportionateScreenWidth(_horizontalPadding / 2)),
          decoration: BoxDecoration(
            color: Palette.kPrimaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              TableCalendar(
                calendarController: _calendarController,
                events: _events,
                initialCalendarFormat: CalendarFormat.month,
                formatAnimation: FormatAnimation.slide,
                startingDayOfWeek: StartingDayOfWeek.monday,
                availableGestures: AvailableGestures.all,
                availableCalendarFormats: const {
                  CalendarFormat.month: '',
                  //CalendarFormat.twoWeeks: '',
                  //CalendarFormat.week: '',
                },
                calendarStyle: CalendarStyle(
                  outsideDaysVisible: false,
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
                  weekendStyle: TextStyle(color: Palette.darkerGrey),
                  renderDaysOfWeek: false,
                  eventDayStyle: TextStyle().copyWith(
                    color: Palette.kTertiaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                builders: CalendarBuilders(
                  selectedDayBuilder: (context, date, _) {
                    return FadeTransition(
                      opacity: Tween(begin: 0.0, end: 1.0)
                          .animate(_animationController),
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Palette.kTertiaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            '${date.day}',
                            style: TextStyle()
                                .copyWith(color: Palette.kLightColor),
                          ),
                        ),
                      ),
                    );
                  },
                  todayDayBuilder: (context, date, _) {
                    return Container(
                      margin: const EdgeInsets.all(5.0),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Palette.kSecondaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          '${date.day}',
                          style:
                              TextStyle().copyWith(color: Palette.kLightColor),
                        ),
                      ),
                    );
                  },
                  markersBuilder: (context, date, events, holidays) {
                    final children = <Widget>[];

                    if (events.isNotEmpty) {
                      children.add(
                        Positioned(
                          right: 1,
                          bottom: 1,
                          child: _buildEventsMarker(date, events),
                        ),
                      );
                    }

                    if (holidays.isNotEmpty) {
                      children.add(
                        Positioned(
                          right: -2,
                          top: -2,
                          child: _buildHolidaysMarker(),
                        ),
                      );
                    }

                    return children;
                  },
                ),
                onDaySelected: (date, events, holidays) {
                  _onDaySelected(date, events, holidays);
                  _animationController.forward(from: 0.0);
                },
                onVisibleDaysChanged: _onVisibleDaysChanged,
                onCalendarCreated: _onCalendarCreated,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Palette.kPrimaryColor,
                    textStyle: TextStyle(
                      fontSize: getProportionateScreenWidth(24.0),
                      fontFamily: "Ubuntu",
                    ),
                    backgroundColor: Palette.kLightColor,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'plan');
                  },
                  child: const Text('Schedule'),
                ),
              )
            ],
          )),
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _calendarController.isSelected(date)
            ? Palette.kSecondaryColor
            : _calendarController.isToday(date)
                ? Palette.kTertiaryColor
                : Palette.kSecondaryColor,
      ),
      width: 14.0,
      height: 14.0,
      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 11.0,
          ),
        ),
      ),
    );
  }

  Widget _buildHolidaysMarker() {
    return Icon(
      Icons.add_box,
      size: 20.0,
      color: Colors.blueGrey[800],
    );
  }

  Widget _buildEventList() {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: _animDuration),
      reverseDuration: const Duration(milliseconds: _animDuration),
      firstCurve: Curves.bounceInOut,
      secondCurve: Curves.easeInBack,
      firstChild: SizedBox(),
      secondChild: Container(
        padding: EdgeInsets.only(
            left: getProportionateScreenWidth(_horizontalPadding)),
        margin: EdgeInsets.only(bottom: getProportionateScreenHeight(40)),
        height: getProportionateScreenHeight(260.0),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _selectedEvents.length,
            itemExtent: getProportionateScreenWidth(285),
            itemBuilder: (context, index) {
              return Container(
                child: Card(
                  margin: EdgeInsets.only(
                      right:
                          getProportionateScreenWidth(_horizontalPadding / 2)),
                  color: (index % 2 == 0)
                      ? Palette.kSecondaryColor
                      : Palette.kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(30.0)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            _selectedEvents[index]['image'].toString(),
                            height: getProportionateScreenWidth(45),
                            width: getProportionateScreenWidth(45),
                          ),
                          SizedBox(height: getProportionateScreenHeight(10)),
                          Text(
                            _selectedEvents[index]['name'].toString(),
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(21.0),
                              color: (index % 2 == 0)
                                  ? Palette.kDarkColor
                                  : Palette.kLightColor,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Ubuntu",
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: getProportionateScreenHeight(10)),
                          Text(
                            _selectedEvents[index]['type'].toString(),
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(16.0),
                              color: Palette.kLightColor,
                              fontFamily: "Ubuntu",
                            ),
                          ),
                          SizedBox(height: getProportionateScreenHeight(30)),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: <Widget>[
                                Text(
                                  dateFormat.format(_chosenDate),
                                  style: TextStyle(
                                    fontSize: getProportionateScreenWidth(22.0),
                                    color: (index % 2 == 0)
                                        ? Palette.kDarkColor
                                        : Palette.kSecondaryColor,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Ubuntu",
                                  ),
                                ),
                                Text(
                                  _selectedEvents[index]['schedule'].toString(),
                                  style: TextStyle(
                                    fontSize: getProportionateScreenWidth(14.0),
                                    color: Palette.kLightColor,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Ubuntu",
                                  ),
                                ),
                              ]),
                        ]),
                  ),
                ),
              );
            }),
      ),
      crossFadeState: (_selectedEvents.length == 0)
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
    );
  }
}
