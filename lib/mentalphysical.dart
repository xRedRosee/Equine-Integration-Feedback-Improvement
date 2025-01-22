import 'package:flutter/material.dart';
import 'themes.dart'; 

class MentalPhysicalWidget extends StatefulWidget {
  final String isPhysicallyPositive; 
  final bool isMentallyPositive;  

  const MentalPhysicalWidget({
    super.key,
    required this.isPhysicallyPositive, 
    required this.isMentallyPositive,  
  });

  @override
  MentalPhysicalWidgetState createState() => MentalPhysicalWidgetState();
}

class MentalPhysicalWidgetState extends State<MentalPhysicalWidget> {
  @override
  Widget build(BuildContext context) {
    // Bepaal het fysieke icoon en kleur
    IconData physicalIcon;
    Color physicalIconColor;

    if (widget.isPhysicallyPositive == "happy") {
      physicalIcon = Icons.sentiment_satisfied_alt;
      physicalIconColor = brightGreen;
    } else if (widget.isPhysicallyPositive == "sad") {
      physicalIcon = Icons.sentiment_dissatisfied;
      physicalIconColor = Colors.red;
    } else {
      physicalIcon = Icons.sentiment_very_dissatisfied;
      physicalIconColor = recordingAlertRed;
    }

    return Padding(
      padding: paddingBetweenBlocks,
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Left box horse physically
              Flexible(
                child: Container(
                  height: 170.0,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: borderRadius,
                    boxShadow: defaultBoxShadow,
                  ),
                  padding: paddingInBlock,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Horse physically",
                        style: appTheme.textTheme.bodyMedium?.copyWith(
                          color: darkGray,
                        ),
                      ),
                      const Spacer(),
                      Center(
                        child: Icon(
                          physicalIcon,
                          color: physicalIconColor,
                          size: 80.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 18.0),
              // Right box horse mentally
              Flexible(
                child: Container(
                  height: 170.0,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: borderRadius,
                    boxShadow: defaultBoxShadow,
                  ),
                  padding: paddingInBlock,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Horse mentally",
                        style: appTheme.textTheme.bodyMedium?.copyWith(
                          color: darkGray,
                        ),
                      ),
                      const Spacer(),
                      Center(
                        child: Icon(
                          widget.isMentallyPositive
                              ? Icons.sentiment_satisfied_alt
                              : Icons.sentiment_very_dissatisfied,
                          color: widget.isMentallyPositive
                              ? brightGreen
                              : recordingAlertRed,
                          size: 80.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
