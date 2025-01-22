import 'package:flutter/material.dart';
import '../themes.dart';

class RecordingAlert extends StatelessWidget {
  final bool isSuccess;
  final String title;
  final String subtitle;

  const RecordingAlert({
    super.key,
    required this.isSuccess,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isSuccess ? recordingAlertGreen : recordingAlertRed,
            borderRadius: borderRadius, 
            boxShadow: defaultBoxShadow,
          ),
        padding: paddingInRecordingAlert, 
          child: Row(
            children: [
              Icon(
                isSuccess ? Icons.check_circle : Icons.error,
                color: Colors.white,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: appTheme.textTheme.labelLarge
                          ?.copyWith(color: Colors.white), 
                    ),
                    Text(
                      subtitle,
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
