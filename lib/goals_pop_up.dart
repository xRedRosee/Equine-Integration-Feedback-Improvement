import 'package:flutter/material.dart';
import 'themes.dart';

class GoalsPopUpWidget extends StatefulWidget {
  const GoalsPopUpWidget({super.key});

  @override
  _GoalsPopUpWidgetState createState() => _GoalsPopUpWidgetState();
}

// Goal card context set up
class _GoalsPopUpWidgetState extends State<GoalsPopUpWidget> {
  final List<Map<String, dynamic>> goals = [
    {'title': 'Dressage', 'description': 'Advice: 3x per week', 'progress': 1, 'total': 3},
    {'title': 'Lunging', 'description': 'Advice: 3x per week', 'progress': 2, 'total': 3},
  ];

  void _showAddGoalDialog() {
    String? selectedType;
    int? sessions;
    
    // Pop up screen to add a new goal
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            padding: paddingInBlock,
            decoration: BoxDecoration(
              color: white,
              borderRadius: borderRadius,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(Icons.cancel, color: darkGray),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),

                // Drop down menu to choose a type of training
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'Select Type of Training'),
                  items: ['Dressage', 'Lunging', 'Jumping'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    selectedType = value;
                  },
                ),
                
                // Drop down menu to choose the amount of sessions
                DropdownButtonFormField<int>(
                  decoration: InputDecoration(labelText: 'Select Amount of Sessions'),
                  items: List.generate(6, (index) => index).map((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                  onChanged: (value) {
                    sessions = value;
                  },
                ),

                // Exchange of user imput into goal card
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (selectedType != null && sessions != null) {
                      setState(() {
                        goals.add({
                          'title': selectedType,
                          'description': 'Advice: ${sessions}x per week',
                          'progress': 0,
                          'total': sessions,
                        });
                      });
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text('Create'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...goals.map((goal) => _buildGoalBox(goal['title'], goal['description'], goal['progress'], goal['total'])).toList(),
            Padding(
              padding: paddingBetweenSecions,

              // Button to add goal to current list, and start goal pop up
              child: Align(
                alignment: Alignment.bottomCenter,
                child: IconButton(
                  icon: Icon(Icons.add_circle, color: darkGray, size: 40),
                  onPressed: _showAddGoalDialog,
                ),
              ),
            ),
          ],
      ),
    );
  }

  // Creation of the goal card
  Widget _buildGoalBox(String title, String description, int progress, int total) {
    double progressRatio = progress / total;
    return Padding(
      padding: paddingBetweenBlocks,
      child: Container(
        width: 373,
        decoration: BoxDecoration(
          color: white,
          borderRadius: borderRadius,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        padding: paddingInBlock,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: appTheme.textTheme.titleMedium?.copyWith(color: darkGray)),
                  SizedBox(height: 8),
                  Text(description, style: appTheme.textTheme.titleMedium?.copyWith(color: purple)),
                ],
              ),
            ),
            SizedBox(width: 16),
            _buildProgressCircle(progressRatio, '$progress/$total'),
          ],
        ),
      ),
    );
  }

  // Creation of the ring chart
  Widget _buildProgressCircle(double progress, String label) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 70,
          height: 70,
          child: CircularProgressIndicator(
            value: progress,
            strokeWidth: 6,
            backgroundColor: lightBlue,
            valueColor: AlwaysStoppedAnimation<Color>(
              progress == 1.0 ? brightGreen : (progress >= 0.66 ? orange : red),
            ),
          ),
        ),
        Text(label, style: appTheme.textTheme.titleMedium?.copyWith(color: darkGray)),
      ],
    );
  }
}

