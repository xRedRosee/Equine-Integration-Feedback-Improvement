import 'package:flutter/material.dart';
import 'package:tech_prototype_equine_integration/themes.dart';

class TrophyBox extends StatelessWidget {
  const TrophyBox({
    super.key,
    required this.monthName,
    required this.trainingsCompleted,
    required this.monthDays,
  });

  final String monthName;
  final int trainingsCompleted;
  final String monthDays;

  String getRibbonImage(int completed) {
    if (completed >= 25) {
      return 'assets/ribbon-gold.png';
    } else if (completed >= 20) {
      return 'assets/ribbon-silver.png';
    } else if (completed > 0) {
      return 'assets/ribbon-bronze.png';
    } else {
      return 'assets/ribbon-no-trainings.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Set ribbon image based on completed trainings
    final ribbonImage = getRibbonImage(trainingsCompleted);

    return Container(
      width: 111,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            monthName,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          Image.asset(
            ribbonImage,
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                trainingsCompleted.toString(),
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text(
                '/',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text(
                monthDays,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
