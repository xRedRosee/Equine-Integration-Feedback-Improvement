import 'package:flutter/material.dart';
import '../widgets/trophy_box.dart';
import '../widgets/leaderboard_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../global_variables.dart';

class TrophyCollection extends StatefulWidget {
  const TrophyCollection({super.key});

  @override
  State<TrophyCollection> createState() => _TrophyCollectionState();
}

class _TrophyCollectionState extends State<TrophyCollection> {
    final globalVars = GlobalVariables();

  // Selected year
  int selectedYear = 2025;

  @override
  Widget build(BuildContext context) {
    // Months (2025)
    List<Map<String, dynamic>> months = [
      {'monthName': 'January', 'trainingsCompleted': 31, 'monthDays': '31'},
      {'monthName': 'February', 'trainingsCompleted': 28, 'monthDays': '28'},
      {'monthName': 'March', 'trainingsCompleted': 24, 'monthDays': '31'},
      {'monthName': 'April', 'trainingsCompleted': 20, 'monthDays': '30'},
      {'monthName': 'May', 'trainingsCompleted': 15, 'monthDays': '31'},
      {'monthName': 'June', 'trainingsCompleted': 10, 'monthDays': '30'},
      {'monthName': 'July', 'trainingsCompleted': 5, 'monthDays': '31'},
      {'monthName': 'August', 'trainingsCompleted': 2, 'monthDays': '31'},
      {'monthName': 'September', 'trainingsCompleted': 0, 'monthDays': '30'},
      {'monthName': 'October', 'trainingsCompleted': 29, 'monthDays': '31'},
      {'monthName': 'November', 'trainingsCompleted': 22, 'monthDays': '30'},
      {'monthName': 'December', 'trainingsCompleted': 26, 'monthDays': '31'},
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12.0, top: 23.0),
                  child: Text(
                    'Ribbon collection',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: LeaderboardBar(
                  topPercentage: globalVars.trophyProgress,
                  month: 'January',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 23.0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SvgPicture.asset(
                    'assets/arrow-icon-left.svg',
                    width: 35,
                    height: 35,
                  ),
                  Text('$selectedYear',
                      style: Theme.of(context).textTheme.titleLarge),
                  SvgPicture.asset(
                    'assets/arrow-icon-right.svg',
                    width: 35,
                    height: 35,
                  ),
                ]),
              ),
              Wrap(
                spacing: 8.0, // x-as
                runSpacing: 8.0, // y-as
                children: months.map<Widget>((month) {
                  return TrophyBox(
                    monthName: month['monthName'],
                    trainingsCompleted: month['trainingsCompleted'],
                    monthDays: month['monthDays'],
                  );
                }).toList(),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
