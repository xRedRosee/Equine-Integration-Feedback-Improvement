import 'package:flutter/material.dart';
import '../themes.dart';

class HorseReadinessWidget extends StatelessWidget {

  final bool horseHealth;  

  const HorseReadinessWidget({
    super.key,
    required this.horseHealth,  
  });

  @override
  Widget build(BuildContext context) {

    Color flagColor;

    // Green or red flag based on horseHealth
    if (horseHealth) {
      flagColor = recordingAlertGreen;  
    } else {
      flagColor = recordingAlertRed;  
    }

    return Column(
      children: [
        // Title for Horse Readiness
      Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Horse readiness',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),

        // Upper box for red or green flag based on horseHealth
        Padding(
          padding: paddingBetweenSecions,
          child: Container(
            width: 377,
            height: 301,
            padding: paddingInBlock,
            decoration: BoxDecoration(
              color: white,
              borderRadius: borderRadius,
              boxShadow: defaultBoxShadow,
            ),
            child: Column(
              children: [
                // Red or Green flag icon based on horseHealth
                Icon(
                  Icons.flag,
                  size: 120,
                  color: flagColor,
                ),
                Spacer(),
                // Flag description based on horseHealth
                if (horseHealth)
                  Text(
                    'There are currently no red flags, your horse is ready to train!', // Green flag message
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  )
                else
                  Text(
                    'There is currently one red flag, your horse is not ready to train!', // Red flag message
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
              ],
            ),
          ),
        ),

        // Lower box with warning for red flag
        if (!horseHealth)
          Padding(
            padding: paddingBetweenSecions,
            child: Container(
              width: 378,
              height: 340,
              padding: paddingInBlock,
              decoration: BoxDecoration(
                color: recordingAlertRed,
                borderRadius: borderRadius,
                boxShadow: defaultBoxShadow,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // Warning Icon
                      Icon(
                        Icons.warning_amber,
                        size: 30,
                        color: white,
                      ),
                      SizedBox(width: 10),
                      // Warning title
                      Text(
                        'Watch out!',
                        style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: white),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  // Cause of warning text
                  RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(color: white),
                      children: [
                        TextSpan(
                          text: 'During the last training ', // Regular
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: white,
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        TextSpan(
                          text: 'the heart rate ', // Semi-bold
                        ),
                        TextSpan(
                          text: 'was ', // Regular
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: white,
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        TextSpan(
                          text: '15 bpm higher than normal', // Semi-bold
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  // Information on how to proceed text
                  Text(
                    'You should consider contacting your veterinarian for a check up to make sure everything is ok.',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(color: white),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      // Phone icon
                      Icon(
                        Icons.call,
                        size: 30,
                        color: white, // Set icon color to white
                      ),
                      SizedBox(width: 10),
                      // Person to contact text
                      Text(
                        '+31 (0)412 745500',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
      ],
    );

  }
}