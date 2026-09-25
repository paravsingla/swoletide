class WeekSetScheme {
  final double percent;
  final int reps;
  final bool isAmrap;

  const WeekSetScheme({
    required this.percent,
    required this.reps,
    this.isAmrap = false,
  });
}

class FiveThreeOneCalculator {
  FiveThreeOneCalculator._();

  static const Map<int, List<WeekSetScheme>> weeklyScheme = {
    1: [
      WeekSetScheme(percent: 65, reps: 5),
      WeekSetScheme(percent: 75, reps: 5),
      WeekSetScheme(percent: 85, reps: 5, isAmrap: true),
    ],
    2: [
      WeekSetScheme(percent: 70, reps: 3),
      WeekSetScheme(percent: 80, reps: 3),
      WeekSetScheme(percent: 90, reps: 3, isAmrap: true),
    ],
    3: [
      WeekSetScheme(percent: 75, reps: 5),
      WeekSetScheme(percent: 85, reps: 3),
      WeekSetScheme(percent: 95, reps: 1, isAmrap: true),
    ],
    4: [
      WeekSetScheme(percent: 40, reps: 5),
      WeekSetScheme(percent: 50, reps: 5),
      WeekSetScheme(percent: 60, reps: 5),
    ],
  };

  static List<WeekSetScheme> schemeForWeek(int week) =>
      weeklyScheme[week] ?? weeklyScheme[1]!;

  static double estimateOneRepMax({required double weight, required int reps}) {
    if (reps <= 1) return weight;
    return weight * (1 + reps / 30.0);
  }

  static double trainingMaxFromOneRepMax({
    required double oneRepMax,
    double percent = 90.0,
  }) {
    return oneRepMax * (percent / 100.0);
  }

  static double roundToIncrement({
    required double weight,
    required double increment,
  }) {
    if (increment <= 0) return weight;
    final rounded = (weight / increment).floor() * increment;
    return rounded <= 0 ? increment : rounded;
  }

  static double weightForPercent({
    required double trainingMax,
    required double percent,
    required double roundingIncrement,
  }) {
    final raw = trainingMax * (percent / 100.0);
    return roundToIncrement(weight: raw, increment: roundingIncrement);
  }

  static List<double> plateBreakdown({
    required double targetWeight,
    required double barWeight,
    required List<double> availablePlates,
  }) {
    double perSide = (targetWeight - barWeight) / 2.0;
    if (perSide <= 0) return []; 

    final plates = List<double>.from(availablePlates)
      ..sort((a,b) => b.compareTo(a));
    final result = <double>[];


    const epsilon = 0.01;
    for (final plate in plates) {
      while (perSide + epsilon >= plate) {
        result.add(plate);
        perSide -= plate;
      }
    }
    return result;
  }

  static double tmIncrement({
    required bool isLowerBody,
    required bool isMetric,
  }){
    if (isMetric) {
      return isLowerBody ? 5.0 : 2.5;
    }
    return isLowerBody ? 10.0 : 5.0;
  }

  static double progressedTrainingMax({
    required double currentTm,
    required bool isLowerBody,
    required bool isMetric,
  }) {
    return currentTm + tmIncrement(isLowerBody: isLowerBody, isMetric: isMetric);
  }

  static List<double> defaultPlatesFor({required bool isMetric}){
    return isMetric
        ? const [25, 20, 15, 10, 5, 2.5, 1.25]
        : const [45, 35, 25, 10, 5, 2.5];
  }

}


