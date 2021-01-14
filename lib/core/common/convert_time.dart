import 'package:phone_blocker/resources/localizations.dart';

String diffTimeToNow(DateTime time) {
  var now = DateTime.now();

  var diffInMinutes = now.difference(time).inMinutes;
  if (diffInMinutes < 60) {
    return "${Localized.get.update} $diffInMinutes ${Localized.get.updateMinutes}";
  }

  var diffInHours = now.difference(time).inHours;
  if (diffInHours < 24) {
    return "${Localized.get.update} $diffInHours ${Localized.get.updateHours}";
  }

  var diffInDays = now.difference(time).inDays;
  return "${Localized.get.update} $diffInDays ${Localized.get.updateDays}";
}
