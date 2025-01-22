import 'package:flutter/material.dart';
import 'package:tech_prototype_equine_integration/themes.dart';
import 'widgets/trophy_box.dart';
import 'app/trophy_collection.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TrophyPopup extends StatefulWidget {
  const TrophyPopup({super.key});

  @override
  State<TrophyPopup> createState() => _TrophyPopupState();
}

class _TrophyPopupState extends State<TrophyPopup> {
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

  // Selected month
  String selectedMonth = 'January';
  int trainingsCompleted = 21;

  @override
  Widget build(BuildContext context) {
    // Ribbon image
    final ribbonImage = getRibbonImage(trainingsCompleted);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, 93, 30, 93),
          child: Column(
            children: <Widget>[
              Padding(
                padding: paddingBetweenSecions,
                child: Text(
                  'Good job!',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              Padding(
                padding: paddingBetweenSecions,
                child: Column(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'During the month ',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                          TextSpan(
                            text: selectedMonth,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'you collected the ribbon:',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: paddingBetweenSecions,
                child: Image.asset(
                  ribbonImage,
                  height: 200,
                ),
              ),
              Padding(
                padding: paddingBetweenSecions,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'By recording ',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                      TextSpan(
                        text: trainingsCompleted.toString(),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      TextSpan(
                          text: ' trainings.',
                          style: Theme.of(context).textTheme.titleLarge),
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: paddingBetweenSecions,
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TrophyCollection()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(300, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(43),
                            side: BorderSide(color: thunderBlue),
                          ),
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ),
                        child: Text(
                          'See collection',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(color: thunderBlue),
                        ),
                      ),
                      SizedBox(height: 26),
                      ElevatedButton(
                        onPressed: () {
                          print('Continue!');
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(300, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(43),
                          ),
                          backgroundColor: thunderBlue,
                        ),
                        child: Text(
                          'Continue',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
