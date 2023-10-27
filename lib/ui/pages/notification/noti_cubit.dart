import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nws_huydq_ecommerce_flutter/database/sqlite.dart';
import 'package:nws_huydq_ecommerce_flutter/global/global_data.dart';
import 'package:nws_huydq_ecommerce_flutter/models/enums/load_status.dart';
import 'package:nws_huydq_ecommerce_flutter/models/notifications/notifications.dart';

part 'noti_state.dart';

class NotiCubit extends Cubit<NotiState> {
  NotiCubit() : super(const NotiState());

  final dbHelper = DatabaseHelper.instance;

  List<NotiModel> notifications = [];

  Future<void> getNotis() async {
    emit(state.copyWith(loadStatus: LoadStatus.loading));
    notifications =
        await dbHelper.getAllNotifications(GlobalData.instance.userId);
    notifications = notifications.reversed.toList();
    emit(state.copyWith(
        loadStatus: LoadStatus.success, notifications: notifications));
  }

  
}
