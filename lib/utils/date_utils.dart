import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateTimeUtils{
  String formatTimeAgo(DateTime time) {
    final now = DateTime.now();
    final difference = now.difference(time);

    if (difference.inDays >= 1) {
      final format = DateFormat.yMMMd();
      return format.format(time);
    } else if (difference.inHours >= 1) {
      return '${difference.inHours} ${'hour_ago'.tr}';
    } else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes} ${'minutes_ago'.tr}';
    } else {
      return 'just_now'.tr;
    }
  }
}