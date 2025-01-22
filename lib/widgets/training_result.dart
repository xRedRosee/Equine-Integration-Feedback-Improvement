import 'package:flutter/material.dart';
import 'progress_training_bar.dart';
import 'title_with_list_component.dart';
import '../themes.dart';
import 'dart:math';

class TrainingResult extends StatefulWidget {
  final String title;

  const TrainingResult({
    super.key,
    required this.title,
  });

  @override
  TrainingResultState createState() => TrainingResultState();
}

class TrainingResultState extends State<TrainingResult> {
  final List<SelectableItem> trainingGoalsList = [
    SelectableItem(text: "Hit 150 bpm 3 times"),
    SelectableItem(text: "2 minute trot between intervals"),
    SelectableItem(text: "20 minute warm-up"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: paddingBetweenBlocks,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ProgressBar en SelectableList in één block
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: borderRadius,
              boxShadow: defaultBoxShadow,
            ),
            // padding: paddingInBlock,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProgressCard(
                  title: widget.title,
                  currentValue:
                      trainingGoalsList.where((item) => item.isSelected).length,
                  targetValue: trainingGoalsList.length,
                  progressColor: orange,
                  subtitleBuilder: (current, target) {
                    double percentage = (current / target) * 100;
                    return "Good job, you reached ${percentage.toStringAsFixed(0)}% of your target during the last training!";
                  },
                ),
                SelectableList(
                  title: "Training Goals",
                  items: trainingGoalsList,
                  boxShadowEnabled: false,
                ),
              ],
            ),
          ),
          // Button for adding random checkbox
          // ElevatedButton(
          //   onPressed: () {
          //     setState(() {
          //       if (trainingGoalsList.isNotEmpty) {
          //         final randomIndex =
          //             Random().nextInt(trainingGoalsList.length);
          //         // Wissel de isSelected waarde
          //         trainingGoalsList[randomIndex].isSelected =
          //             !trainingGoalsList[randomIndex].isSelected;
          //       }
          //     });
          //   },
          //   child: const Text("Toggle Random Item"),
          // ),
        ],
      ),
    );
  }
}
