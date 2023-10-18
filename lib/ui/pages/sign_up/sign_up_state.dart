part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  final LoadStatus loadStatus;
  final String errorMessage;
  final bool isShowPassWord;
  final bool isShowConfirmPassWord;
  final bool isEmail;
  final bool isUserName;
  final bool isAccept;
  final bool isPass;
  final bool isTrueConfirmPass;

  const SignUpState({
    this.loadStatus = LoadStatus.initial,
    this.errorMessage = "",
    this.isShowPassWord = false,
    this.isEmail = false,
    this.isShowConfirmPassWord = false,
    this.isUserName = false,
    this.isAccept = false,
    this.isPass = false,
    this.isTrueConfirmPass = false,
  });

  @override
  List<Object?> get props => [
        loadStatus,
        errorMessage,
        isShowPassWord,
        isEmail,
        isShowConfirmPassWord,
        isUserName,
        isAccept,
        isPass,
        isTrueConfirmPass
      ];

  SignUpState copyWith(
      {LoadStatus? loadStatus,
      String? errorMessage,
      bool? isShowPassWord,
      bool? isEmail,
      bool? isShowConfirmPassWord,
      bool? isUserName,
      bool? isAccept,
      bool? isPass,
      bool? isTrueConfirmPass}) {
    return SignUpState(
      loadStatus: loadStatus ?? this.loadStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      isShowPassWord: isShowPassWord ?? this.isShowPassWord,
      isEmail: isEmail ?? this.isEmail,
      isShowConfirmPassWord:
          isShowConfirmPassWord ?? this.isShowConfirmPassWord,
      isUserName: isUserName ?? this.isUserName,
      isAccept: isAccept ?? this.isAccept,
      isPass: isPass ?? this.isPass,
      isTrueConfirmPass: isTrueConfirmPass ?? this.isTrueConfirmPass,
    );
  }
}
