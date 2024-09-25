import 'package:easy_localization/easy_localization.dart';

sealed class DateConstants {
  static DateTime get minReminderDate => DateTime.now();
  static final DateFormat medicationReminderDateFormat = DateFormat.yMd();
  static final DateFormat medicationReminderTimeFormat = DateFormat.jm();
}
