import 'package:flutter/material.dart';
import '../themes.dart'; 

class ProgressCard extends StatelessWidget {
  final String title; 
  final int currentValue; 
  final int targetValue;
  final Color progressColor; 
  final bool shadow;
  final String Function(int currentValue, int targetValue) subtitleBuilder; 
  final String? adviceText; 
  const ProgressCard({
    super.key,
    required this.title,
    required this.currentValue,
    required this.targetValue,
    required this.progressColor,
    required this.subtitleBuilder,
    this.shadow = false,
    this.adviceText,
  });

  @override
  Widget build(BuildContext context) {
    double progress = targetValue > 0 ? (currentValue / targetValue) : 0;
    String subtitle = subtitleBuilder(currentValue, targetValue);

    return Container(
      padding: paddingInRecordingAlert, 
      decoration: BoxDecoration(
        color: Colors.white, 
        borderRadius: borderRadius, 
        boxShadow: shadow ? defaultBoxShadow : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: appTheme.textTheme.titleMedium
                    ?.copyWith(color: darkGray), 
              ),
              Text(
                "$currentValue/$targetValue",
                style: appTheme.textTheme.titleMedium
                    ?.copyWith(color: darkGray), 
              ),
            ],
          ),
          const SizedBox(height: 8),
          Stack(
            children: [
              Container(
                height: 8,
                decoration: BoxDecoration(
                  color: lightBlue, 
                  borderRadius: borderRadius, 
                ),
              ),
              FractionallySizedBox(
                widthFactor: progress, 
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: progressColor,
                    borderRadius: borderRadius, 
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: appTheme.textTheme.bodyMedium?.copyWith(color: black, fontWeight: FontWeight.w600),
          ),
          if (adviceText != null) ...[
            const SizedBox(height: 8),
            Text(
              adviceText!,
              style: appTheme.textTheme.labelSmall?.copyWith(color: darkGray),
            ),
          ],
        ],
      ),
    );
  }
}
