import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:nws_huydq_ecommerce_flutter/database/sqlite.dart';
import 'package:nws_huydq_ecommerce_flutter/models/enums/load_status.dart';
import 'package:nws_huydq_ecommerce_flutter/models/notifications/notifications.dart';

part 'noti_state.dart';

class NotiCubit extends Cubit<NotiState> {
  NotiCubit() : super(const NotiState());

  final dbHelper = DatabaseHelper.instance;

  List<NotiModel> notifications = [];

  Future<void> getNotis() async {
    notifications = await dbHelper.getAllNotifications();
    emit(state.copyWith(
        loadStatus: LoadStatus.success, notifications: notifications));
  }

  String formatTimeAgo(DateTime time) {
    final now = DateTime.now();
    final difference = now.difference(time);

    if (difference.inDays >= 1) {
      final format = DateFormat.yMMMd();
      return format.format(time);
    } else if (difference.inHours >= 1) {
      return '${difference.inHours} hours ago';
    } else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes} minutes ago';
    } else {
      return 'just now';
    }
  }
}
