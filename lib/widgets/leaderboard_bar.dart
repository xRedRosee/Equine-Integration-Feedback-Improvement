import 'package:flutter/material.dart';
import '../themes.dart';

class LeaderboardBar extends StatelessWidget {
  final double topPercentage;
  final String month;

  const LeaderboardBar({
    super.key,
    required this.topPercentage,
    required this.month,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: orange,
            borderRadius: borderRadius,
            boxShadow: defaultBoxShadow,
          ),
          padding: paddingInRecordingAlert,
          child: Row(
            children: [
              Icon(Icons.emoji_events, color: yellow, size: 30.0),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'You belonged to the top ${(topPercentage * 100).toInt()}%',
                      style: appTheme.textTheme.labelLarge
                          ?.copyWith(color: Colors.white),
                    ),
                    Text(
                      'of active users in the month $month.',
                      style: appTheme.textTheme.bodyMedium
                          ?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
