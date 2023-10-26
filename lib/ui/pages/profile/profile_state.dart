part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  final LoadStatus loadStatus;
  final String imageUrl;
  final String errorMessage;
  final bool isNoti;
  final String language;

  const ProfileState({
    this.loadStatus = LoadStatus.initial,
    this.imageUrl = "",
    this.errorMessage = "",
    this.isNoti = true,
    this.language = "" 
  });

  @override
  List<Object?> get props => [
        loadStatus,
        imageUrl,
        errorMessage,
        isNoti,
        language,
      ];

  ProfileState copyWith({
    LoadStatus? loadStatus,
    String? imageUrl,
    String? errorMessage,
    bool? isNoti,
    String? language,
  }) {
    return ProfileState(
      loadStatus: loadStatus ?? this.loadStatus,
      imageUrl: imageUrl ?? this.imageUrl,
      errorMessage: errorMessage ?? this.errorMessage,
      isNoti: isNoti ?? this.isNoti,
      language: language??this.language
    );
  }
}
