part of 'login_cubit.dart';

class LoginState extends Equatable {
  final LoadStatus loadStatus;
  final String errorMessage;
  final bool isShowPassWord;
  final bool isEmail;
  final bool isPass;

  const LoginState({
    this.loadStatus = LoadStatus.initial,
    this.errorMessage = "",
    this.isShowPassWord = false,
    this.isEmail = false,
    this.isPass = false,
  });

  @override
  List<Object?> get props => [
        loadStatus,
        errorMessage,
        isShowPassWord,
        isEmail,
        isPass,
      ];

  LoginState copyWith(
      {LoadStatus? loadStatus,
      String? errorMessage,
      bool? isShowPassWord,
      bool? isEmail,
      bool? isPass}) {
    return LoginState(
        loadStatus: loadStatus ?? this.loadStatus,
        errorMessage: errorMessage ?? this.errorMessage,
        isShowPassWord: isShowPassWord ?? this.isShowPassWord,
        isEmail: isEmail ?? this.isEmail,
        isPass: isPass ?? this.isPass);
  }
}
