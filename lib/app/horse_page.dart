import 'package:flutter/material.dart';
import '../themes.dart';
import '../widgets/recording_alert.dart';
import '../widgets/title_with_list_component.dart';
import '../widgets/training_result.dart';
import '../widgets/top_bar_component.dart';
import '../widgets/horse_readiness.dart';
import '../widgets/progress_cards.dart';
import '../calender/calender_widget.dart';
import '../mentalphysical.dart';
import '../goals_pop_up.dart';
import '../global_variables.dart';

class HorsePage extends StatefulWidget {
  @override
  State<HorsePage> createState() => _HorsePage();
}

class _HorsePage extends State<HorsePage> {
  @override
  Widget build(BuildContext context) {
    final globalVars = GlobalVariables();

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Horse Readiness Section
                HorseReadinessWidget(horseHealth: true),
                SizedBox(height: 16),

                // Calendar Section
                CalendarWidget(
                  background: true,
                  days: 7,
                ),
                SizedBox(height: 32),

                // Goals Section
                Text(
                  'Goals',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 16),
                GoalsPopUpWidget(),

                // Horse Status Section
                Text(
                  'Horse Statistics',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 16),
                Column(
                  children: [
                    MentalPhysicalWidget(
                      isPhysicallyPositive: globalVars.feeling,
                      isMentallyPositive: false,
                    ),
                    ProgressCardsWidget(injuryState: 'medium'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
