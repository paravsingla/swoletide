import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:swole/core/theme/app_text_styles.dart';

import '../theme/app_colors.dart';
import '../utils/five_three_one_calculator.dart';

class PlateBreakdownView extends StatelessWidget {
  final double targetWeight;
  final double barWeight;
  final List<double> availablePlates;

  const PlateBreakdownView({
    super.key,
    required this.targetWeight,
    required this.barWeight,
    required this.availablePlates,
  });

  @override
  Widget build(BuildContext context) {
    final plates = FiveThreeOneCalculator.plateBreakdown(
      targetWeight: targetWeight,
      barWeight: barWeight,
      availablePlates: availablePlates,
    );
    if (plates.isEmpty) {
      return Text('Bar Only', style: AppTextStyles.bodySmall);
    }

    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: plates
          .map(
            (p) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.surfaceBorder),
              ),
              child: Text(
                p == p.roundToDouble() ? p.toInt().toString() : p.toString(),
                style: AppTextStyles.bodySmall,
              ),
            ),
          )
          .toList(),
    );
  }
}
