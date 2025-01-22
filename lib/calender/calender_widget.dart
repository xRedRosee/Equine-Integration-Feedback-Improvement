import 'package:flutter/material.dart';
import '../themes.dart';

class CalendarWidget extends StatefulWidget {
  final bool background;
  final int days;
  const CalendarWidget(
      {super.key, required this.background, required this.days});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  List<DateTime> daysList = [];
  bool showInfo = true;

  @override
  void initState() {
    showInfo = widget.background;
    dateList();
    streakList();
  }

  void dateList() {
    var currentDay = DateTime.now();

    for (int i = widget.days; i > 0; i--) {
      if (currentDay.weekday == 1) {
        for (int i = widget.days; i > 0; i--) {
          daysList.add(currentDay);
          currentDay = currentDay.add(const Duration(hours: 24));
        }
        break;
      } else {
        currentDay = currentDay.subtract(const Duration(hours: 24));
      }
    }
  }

  void streakList() {}

  String checkDay(int weekday) {
    switch (weekday) {
      case 1:
        return 'Ma';
      case 2:
        return 'Di';
      case 3:
        return 'Wo';
      case 4:
        return 'Do';
      case 5:
        return 'Vr';
      case 6:
        return 'Za';
      case 7:
        return 'Zo';
      default:
        return 'Zo';
    }
  }

  String checkMonth() {
    switch (DateTime.now().month) {
      case 1:
        return 'Januari';
      case 2:
        return 'Februari';
      case 3:
        return 'Maart';
      case 4:
        return 'April';
      case 5:
        return 'Mei';
      case 6:
        return 'Juni';
      case 7:
        return 'Juli';
      case 8:
        return 'Augustus';
      case 9:
        return 'Spetember';
      case 10:
        return 'Oktober';
      case 11:
        return 'November';
      default:
        return 'December';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingBetweenBlocks,
      child: Column(
        spacing: 12,
        children: [
          if (widget.background) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Calendar', style: Theme.of(context).textTheme.titleLarge),
                !showInfo
                    ? Container(
                        width: 26,
                        height: 26,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: darkGray,
                        ),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                showInfo = true;
                              });
                            },
                            child: Icon(Icons.question_mark,
                                color: white, size: 16)),
                      )
                    : Container()
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(checkMonth(),
                    style: TextStyle(
                        color: darkGray, fontWeight: FontWeight.w900)),
                Row(
                  children: [
                    Image.asset(
                      'assets/ribbon-gold.png',
                      width: 40,
                      height: 40,
                    ),
                    Text(
                      'check-ins: 24/31',
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ],
                )
              ],
            ),
          ],
          Container(
            padding: EdgeInsets.fromLTRB(18, 12, 18, 12),
            decoration: widget.background
                ? BoxDecoration(
                    color: white,
                    borderRadius: borderRadius,
                    boxShadow: defaultBoxShadow,
                  )
                : null,
            child: showInfo ? calendarInfoView() : calenderStreakView(context),
          ),
        ],
      ),
    );
  }

  Column calendarInfoView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 26,
          height: 26,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: darkGray,
          ),
          child: GestureDetector(
              onTap: () {
                setState(() {
                  showInfo = false;
                });
              },
              child: Icon(Icons.close, color: white, size: 16)),
        ),
        Column(
          spacing: 20,
          children: [
            Row(
              spacing: 30,
              children: [
                IconGreen(),
                Text('Good recording of training',
                    style:
                        TextStyle(color: darkGray, fontWeight: FontWeight.w900))
              ],
            ),
            Row(
              spacing: 30,
              children: [
                IconBlue(),
                Text('Resting day',
                    style:
                        TextStyle(color: darkGray, fontWeight: FontWeight.w900))
              ],
            ),
            Row(
              spacing: 30,
              children: [
                IconGray(),
                Text('Active/upcomming day',
                    style:
                        TextStyle(color: darkGray, fontWeight: FontWeight.w900))
              ],
            ),
            Row(
              spacing: 30,
              children: [
                IconRed(),
                Text('Recording error/horse injury',
                    style:
                        TextStyle(color: darkGray, fontWeight: FontWeight.w900))
              ],
            ),
            Row(
              spacing: 30,
              children: [
                IconBlack(),
                Text('No check-in',
                    style:
                        TextStyle(color: darkGray, fontWeight: FontWeight.w900))
              ],
            ),
          ],
        ),
      ],
    );
  }

  Row calenderStreakView(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        for (var e in daysList)
          Column(
            spacing: 8,
            children: [
              Text("${e.day}", style: Theme.of(context).textTheme.titleSmall),
              CalendarIconCase(
                e: e,
              ),
              Text(checkDay(e.weekday),
                  style: Theme.of(context).textTheme.bodySmall)
            ],
          ),
      ],
    );
  }
}

class IconBlack extends StatelessWidget {
  const IconBlack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 3, color: black),
            color: black.withAlpha(180)),
        child: Icon(Icons.remove, color: white));
  }
}

class IconRed extends StatelessWidget {
  const IconRed({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 3, color: red),
            color: red.withAlpha(150)),
        child: Icon(Icons.close, color: white));
  }
}

class IconGray extends StatelessWidget {
  const IconGray({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 3, color: darkGray40),
          color: darkGray.withAlpha(40)),
    );
  }
}

class IconBlue extends StatelessWidget {
  const IconBlue({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 3, color: Colors.blueAccent),
            color: Colors.blueAccent.withAlpha(150)),
        child: Icon(Icons.pause_rounded, color: Colors.blueAccent));
  }
}

class IconGreen extends StatelessWidget {
  const IconGreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 3, color: brightGreen),
            color: brightGreen.withAlpha(40)),
        child: Icon(Icons.check, color: brightGreen));
  }
}

class CalendarIconCase extends StatelessWidget {
  const CalendarIconCase({
    super.key,
    required this.e,
  });

  final DateTime e;

  bool checkIfHistory() {
    if (e.day <= DateTime.now().day) {
      return true;
    }
    return false;
  }

  bool checkIfCheckedIn() {
    if (e.day.isOdd) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (checkIfHistory()) {
        if (checkIfCheckedIn()) {
          return IconGreen();
        }
        return IconRed();
      }
      return IconGray();
    });
  }
}
