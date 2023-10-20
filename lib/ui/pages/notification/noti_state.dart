part of 'noti_cubit.dart';

class NotiState extends Equatable {
  final LoadStatus loadStatus;
  final List<NotiModel> notifications;
  final String errorMessage;

  const NotiState({
    this.loadStatus = LoadStatus.initial,
    this.notifications = const [],
    this.errorMessage = "",
  });

  @override
  List<Object?> get props => [
        loadStatus,
        notifications,
        errorMessage,
      ];

  NotiState copyWith({
    LoadStatus? loadStatus,
    List<NotiModel>? notifications,
    String? errorMessage,
  }) {
    return NotiState(
      loadStatus: loadStatus ?? this.loadStatus,
      notifications: notifications ?? this.notifications,
      errorMessage : errorMessage?? this.errorMessage,
    );
  }
}
