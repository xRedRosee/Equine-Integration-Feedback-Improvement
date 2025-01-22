import 'package:flutter/material.dart';
import '../themes.dart';
import '../widgets/recording_alert.dart';
import '../widgets/title_with_list_component.dart';
import '../widgets/training_result.dart';
import '../widgets/top_bar_component.dart';
import '../widgets/progress_cards.dart';
import '../widgets/progress_training_bar.dart';
import '../calender/calender_widget.dart';
import '../global_variables.dart';

class TrainingPage extends StatefulWidget {
  const TrainingPage({super.key});

  @override
  State<TrainingPage> createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPage> {
  final globalVars = GlobalVariables();

  // Lijst voor de selectable items list.
  final List<SelectableItem> improvementTips = [
    SelectableItem(text: "Phone on left side of pocket"),
    SelectableItem(text: "Bluetooth connected to sensor"),
    SelectableItem(text: "Sensor attached to horse"),
    SelectableItem(text: "Dry horse"),
  ];

  final List<SelectableItem> trainingGoalsList = [
    SelectableItem(text: "Hit 150 bpm 3 times"),
    SelectableItem(text: "2 minute trot between intervals"),
    SelectableItem(text: "20 minute warm-up"),
  ];
  // Lijst voor de secondary tabs en de content van de secondary tabs.
  final List<String> secondaryTabs = ["Daily", "Weekly"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12.0, top: 23.0),
                  child: Text(
                    'Training statistics',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
              TopBar(
                secondaryTabs,
                showTitle: false,
                secondaryTabContents: [
                  // daily tab
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CalendarWidget(
                        background: false,
                        days: 7,
                      ),
                      RecordingAlert(
                        isSuccess: globalVars.recordingStatus,
                        title: globalVars.recordingStatus
                            ? "Recording was successful"
                            : "Something went wrong",
                        subtitle: globalVars.recordingStatus
                            ? "Your data will be more accurate"
                            : "There is no or incorrect data.",
                      ),
                      if (!globalVars.recordingStatus) ...[
                        SizedBox(height: paddingBetweenBlocks.vertical),
                        SelectableList(
                          title: "Tips for improvement",
                          items: improvementTips,
                          boxShadowEnabled: true,
                        ),
                        SizedBox(height: paddingBetweenBlocks.vertical),
                      ] else ...[
                        const SizedBox(height: 20),
                        TrainingResult(
                          title: "Targets hit during training:",
                        ),
                        ProgressCardsWidget(
                            lungingTrainingState: "12:33 minutes"),
                        SizedBox(
                          height: 30.0,
                        ),
                      ],
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            globalVars.recordingStatus =
                                !globalVars.recordingStatus;
                          });
                        },
                        child: const Text("Toggle Success/Error"),
                      ),
                    ],
                  ),
                  //weekly tab
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12.0, top: 23.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ProgressCard(
                              title: "Targets hit during training:",
                              shadow: true,
                              currentValue: globalVars.target,
                              targetValue: globalVars.progress,
                              progressColor: orange,
                              subtitleBuilder: (current, target) {
                                double percentage = (current / target) * 100;
                                return "Good job, you reached ${percentage.toStringAsFixed(0)}% of your target during the last training!";
                              },
                            ),
                            SizedBox(height: paddingBetweenBlocks.vertical),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: borderRadius,
                                boxShadow: defaultBoxShadow,
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 8, left: 16),
                                    child: Text(
                                      "Goals for next week:",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                  ),
                                  SelectableList(
                                    title: "Training Goals",
                                    items: trainingGoalsList,
                                    boxShadowEnabled: false,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: paddingBetweenBlocks.vertical),
                            ProgressCardsWidget(
                              variationState: globalVars.intensity,
                              workloadState: "medium",
                              consistencyState: 'high',
                            ),
                            SizedBox(
                              height: 60.0,
                            ),
                          ],
                        ),
                      ),
                    ],
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
