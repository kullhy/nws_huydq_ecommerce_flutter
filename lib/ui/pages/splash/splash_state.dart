import 'package:equatable/equatable.dart';

import 'package:nws_huydq_ecommerce_flutter/models/enums/load_status.dart';

class SplashState extends Equatable {
  final LoadStatus fetchProfileStatus;

  const SplashState({
    this.fetchProfileStatus = LoadStatus.initial,
  });

  SplashState copyWith({
    LoadStatus? fetchProfileStatus,
  }) {
    return SplashState(
      fetchProfileStatus: fetchProfileStatus ?? this.fetchProfileStatus,
    );
  }

  @override
  List<Object?> get props => [
        fetchProfileStatus,
      ];
}
