import 'dart:math';

import '../../data/models/lift.dart';

class SwoleQuotes {

  SwoleQuotes._();

  static final Random _random = Random();

  static const List<String> general = [
    'A new disciple has started his journey to the whey.',
    'May your whey goblet never be empty, and your reps be bountiful and heavy.',
    'Swoler of spirit, swoler of body.',
    'Brodin does not rack weights we cannot lift.',
    'Iron within, Iron without.',
    'Judge not the swole - they are pure of heart.',
    'No spot for doubters on the day of failure.',
    'Praise be to Brodin.',
    'Rest assured, I will never stop praying in Iron.',
    "I wrote down 'swole.' They said I didn't understand the assignment.",

  ];

  static const String programStarted = 'A new disciple has started his journey to the whey.';

  static const String finishWorkoutLabel = 'Wheymen';

  static const String newPr = 'Swoler of spirit, swoler of body';

  static const String deadliftBlessing = 'May Brodin bless your deadlifts.';

  static const String deloadLine = 'Brodin does not rack weights we cannot lift.';

  static const String assistanceSubtitle = 'Judge not the swole - every rep counts, bro.';

  static const String onboardingWelcome = 'Iron within, iron without.';

  static const String noActiveProgram = 'The disciple does not walk the Path yet.';

  static const String noBodyweightEntries = 'The scale awaits your offering.';

  static const List<String> restTimerLines = [
    'Chalk up.',
    'Rest. Brodin is patient.',
    'Breathe. The Whey is with you.',
  ];

  static String random() => general[_random.nextInt(general.length)];

  static String randomRestLine() => restTimerLines[_random.nextInt(restTimerLines.length)];

  static String? blessingFor(Lift lift) {
    if (lift == Lift.deadlift) return deadliftBlessing;
    return null;
  }


}