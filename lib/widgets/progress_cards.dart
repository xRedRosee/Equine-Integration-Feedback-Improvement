import 'package:flutter/material.dart';
import '../themes.dart';

class ProgressCardsWidget extends StatelessWidget {
  const ProgressCardsWidget({
    super.key,

    // State parameters
    this.injuryState,
    this.variationState,
    this.workloadState,
    this.consistencyState,
    this.lungingTrainingState,
  });

  final String? injuryState;
  final String? variationState;
  final String? workloadState;
  final String? consistencyState;
  final String? lungingTrainingState;

  @override
  Widget build(BuildContext context) {
    final List<Widget> cards = [];
    if (injuryState != null) {
      cards.add(_buildInjuryCard());
    }

    if (variationState != null) {
      cards.add(_buildVariationCard());
    }

    if (workloadState != null) {
      cards.add(_buildWorkloadCard());
    }

    if (consistencyState != null) {
      cards.add(_buildConsistencyCard());
    }

    if (lungingTrainingState != null) {
      cards.add(_buildLungingTrainingCard());
    }

    return Padding(
      padding: paddingBetweenBlocks,
      child: Column(
        children: cards,
      ),
    );
  }

  // Progress card for Injury Status
  Widget _buildInjuryCard() {
    return Padding(
      padding: paddingBetweenBlocks,
      child: Container(
        width: 374,
        height: 168,
        padding: paddingInBlock,
        decoration: BoxDecoration(
          color: white,
          borderRadius: borderRadius,
          boxShadow: defaultBoxShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card title Injury Status
            Row(
              children: [
                Icon(
                  Icons.healing,
                  color: _getInjuryColor(injuryState!),
                ),
                SizedBox(width: 8),
                Text(
                  'Injury status',
                  style:
                      appTheme.textTheme.titleMedium?.copyWith(color: darkGray),
                ),
              ],
            ),

            // Heart and text next to each other
            Padding(
              padding: EdgeInsets.only(top: 4, left: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.favorite_border,
                    color: _getInjuryColor(injuryState!),
                    size: 75,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: 'Your horse is currently in a ',
                        style: appTheme.textTheme.bodyMedium
                            ?.copyWith(color: darkGray),
                        children: <TextSpan>[
                          TextSpan(
                            text: _getInjuryText(injuryState),
                            style: appTheme.textTheme.bodyMedium
                                ?.copyWith(color: _getInjuryColor(injuryState)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Progress card for Variation
  Widget _buildVariationCard() {
    return Padding(
      padding: paddingBetweenBlocks,
      child: Container(
        width: 374,
        height: 168,
        padding: paddingInBlock,
        decoration: BoxDecoration(
          color: white,
          borderRadius: borderRadius,
          boxShadow: defaultBoxShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card title Variation
            Row(
              children: [
                Icon(
                  Icons.bolt,
                  color: _getVariationColor(variationState!),
                ),
                SizedBox(width: 8),
                Text(
                  'Variation',
                  style:
                      appTheme.textTheme.titleMedium?.copyWith(color: darkGray),
                ),
              ],
            ),

            // Progress graph and text next to each other
            Padding(
              padding: EdgeInsets.only(top: 4, left: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.signal_cellular_alt,
                    color: _getVariationColor(variationState!),
                    size: 75,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: _getVariationText(variationState),
                        style: appTheme.textTheme.bodyMedium?.copyWith(
                            color: _getVariationColor(variationState)),
                        children: <TextSpan>[
                          TextSpan(
                            text: _getVariationTextHighlight(variationState),
                            style: appTheme.textTheme.bodyMedium
                                ?.copyWith(color: darkGray),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Progress card for Workload
  Widget _buildWorkloadCard() {
    return Padding(
      padding: paddingBetweenBlocks,
      child: Container(
        width: 374,
        height: 168,
        padding: paddingInBlock,
        decoration: BoxDecoration(
          color: white,
          borderRadius: borderRadius,
          boxShadow: defaultBoxShadow,
        ),
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Card title Workload
              Row(
                children: [
                  Icon(
                    Icons.fitness_center,
                    color: _getWorkloadColor(workloadState!),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Workload',
                    style: appTheme.textTheme.titleMedium
                        ?.copyWith(color: darkGray),
                  ),
                ],
              ),

              // Progress graph and text next to each other
              Padding(
                padding: EdgeInsets.only(top: 4, left: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.signal_cellular_alt,
                      color: _getWorkloadColor(workloadState!),
                      size: 75,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: _getWorkloadText(workloadState),
                          style: appTheme.textTheme.bodyMedium?.copyWith(
                              color: _getWorkloadColor(workloadState)),
                          children: <TextSpan>[
                            TextSpan(
                              text: _getWorkloadTextHighlight(workloadState),
                              style: appTheme.textTheme.bodyMedium
                                  ?.copyWith(color: darkGray),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Progress card for Consistency
  Widget _buildConsistencyCard() {
    return Padding(
      padding: paddingBetweenBlocks,
      child: Container(
        width: 374,
        height: 168,
        padding: paddingInBlock,
        decoration: BoxDecoration(
          color: white,
          borderRadius: borderRadius,
          boxShadow: defaultBoxShadow,
        ),
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Card title Consistency
                  Icon(
                    Icons.repeat,
                    color: _getConsistencyColor(consistencyState!),
                  ),

                  SizedBox(width: 8),

                  Text(
                    'Consistency',
                    style: appTheme.textTheme.titleMedium
                        ?.copyWith(color: darkGray),
                  ),
                ],
              ),

              // Progress graph and text next to each other
              Padding(
                padding: EdgeInsets.only(top: 4, left: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.signal_cellular_alt,
                      color: _getConsistencyColor(consistencyState!),
                      size: 75,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: _getConsistencyText(consistencyState),
                          style: appTheme.textTheme.bodyMedium?.copyWith(
                              color: _getConsistencyColor(consistencyState)),
                          children: <TextSpan>[
                            TextSpan(
                              text: _getConsistencyTextHighlight(
                                  consistencyState),
                              style: appTheme.textTheme.bodyMedium
                                  ?.copyWith(color: darkGray),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Lunging training card
  Widget _buildLungingTrainingCard() {
    return Padding(
      padding: paddingBetweenBlocks,
      child: Container(
        width: 374,
        height: 168,
        padding: paddingInBlock,
        decoration: BoxDecoration(
          color: white,
          borderRadius: borderRadius,
          boxShadow: defaultBoxShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Card title Lunging training
                Icon(
                  Icons.gesture,
                  color: fullBlue,
                ),
                SizedBox(width: 8),
                Text(
                  'Lunging training',
                  style:
                      appTheme.textTheme.titleMedium?.copyWith(color: darkGray),
                ),
              ],
            ),
            Padding(
              // Clock and text next to each other
              padding: EdgeInsets.only(top: 4, left: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.alarm,
                    color: fullBlue,
                    size: 75,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: 'You trained with your horse for ',
                        style: appTheme.textTheme.bodyMedium
                            ?.copyWith(color: darkGray),
                        children: [
                          TextSpan(
                            text: '12:33 minutes',
                            style: appTheme.textTheme.bodyMedium
                                ?.copyWith(color: fullBlue),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Check for states with results
  Color _getInjuryColor(String? state) {
    if (state == 'low') return yellow;
    if (state == 'medium') return orange;
    return brightGreen;
  }

  String _getInjuryText(String? state) {
    if (state == 'low') return 'bad condition';
    if (state == 'medium') return 'average condition';
    return 'peak condition';
  }

  Color _getVariationColor(String? state) {
    if (state == 'low') return yellow;
    if (state == 'medium') return orange;
    return brightGreen;
  }

  String _getVariationText(String? state) {
    if (state == 'low') return 'Low intensity';
    if (state == 'medium') return 'Medium intensity';
    return 'High intensity';
  }

  String _getVariationTextHighlight(String? state) {
    if (state == 'low') return ' means a less chance of injuries.';
    if (state == 'medium') return ' means a average chance of injuries.';
    return ' means a high chance of injuries.';
  }

  Color _getWorkloadColor(String? state) {
    if (state == 'low') return yellow;
    if (state == 'medium') return orange;
    return brightGreen;
  }

  String _getWorkloadText(String? state) {
    if (state == 'low') return 'Low workload';
    if (state == 'medium') return 'Medium workload';
    return 'High workload';
  }

  String _getWorkloadTextHighlight(String? state) {
    if (state == 'low') return ' means a low chance of exhaustion';
    if (state == 'medium') return ' means an average chance of exhaustion';
    return ' means a very high chance of exhaustion';
  }

  Color _getConsistencyColor(String? state) {
    if (state == 'low') return yellow;
    if (state == 'medium') return orange;
    return brightGreen;
  }

  String _getConsistencyText(String? state) {
    if (state == 'low') return 'Bad consistency';
    if (state == 'medium') return 'Some consistency';
    return 'Good consistency';
  }

  String _getConsistencyTextHighlight(String? state) {
    if (state == 'low')
      return ' means a very high chance of not achieving full potential';
    if (state == 'medium')
      return ' means an average chance of not achieving full potential';
    return ' means a very high chance of achieving full potential';
  }
}
