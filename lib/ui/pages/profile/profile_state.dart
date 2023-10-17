part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  final LoadStatus loadStatus;
  final String imageUrl;
  final String errorMessage;

  const ProfileState({
    this.loadStatus = LoadStatus.initial,
    this.imageUrl = "",
    this.errorMessage = "",
  });

  @override
  List<Object?> get props => [
        loadStatus,
        imageUrl,
        errorMessage,
      ];

  ProfileState copyWith({
    LoadStatus? loadStatus,
    String? imageUrl,
    String? errorMessage,
  }) {
    return ProfileState(
      loadStatus: loadStatus ?? this.loadStatus,
      imageUrl: imageUrl ?? this.imageUrl,
      errorMessage : errorMessage?? this.errorMessage,
    );
  }
}
