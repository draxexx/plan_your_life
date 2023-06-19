import '../index.dart';

bool isFirstTimeOfDayBeforeOrEqual(TimeOfDay first, TimeOfDay second) {
  var firstDouble = toDouble(first);
  var secondDouble = toDouble(second);

  if (firstDouble <= secondDouble) {
    return true;
  }
  return false;
}

bool isFirstTimeOfDayAfter(TimeOfDay first, TimeOfDay second) {
  var firstDouble = toDouble(first);
  var secondDouble = toDouble(second);

  if (firstDouble > secondDouble) {
    return true;
  }
  return false;
}

double toDouble(TimeOfDay myTime) => myTime.hour + myTime.minute / 60.0;
