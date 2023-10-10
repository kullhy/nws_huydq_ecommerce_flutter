import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_colors.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_text_styles.dart';
import 'package:nws_huydq_ecommerce_flutter/models/enums/load_status.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/sign_up/sign_up_cubit.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/sign_up/sign_up_navigator.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return SignUpCubit(navigator: SignUpNavigator(context: context));
      },
      child: const SignUpView(),
    );
  }
}

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  late SignUpCubit _signUpCubit;

  @override
  void initState() {
    super.initState();
    _signUpCubit = context.read<SignUpCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: BlocBuilder<SignUpCubit, SignUpState>(builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding: const EdgeInsets.fromLTRB(80, 100, 80, 60),
                child: Image.asset("assets/images/logo.png"),
              ),
              Text(
                "Sign Up",
                style: AppTextStyle.blackS18Bold,
              ),
              Text(
                "Create an new account",
                style: AppTextStyle.greyS14,
                overflow: TextOverflow.clip,
              ),
              const SizedBox(
                height: 48,
              ),
              TextFormField(
                  key: _signUpCubit.userNameKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _signUpCubit.userNameController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      labelText: 'User Name',
                      labelStyle: AppTextStyle.blackS20Bold,
                      suffixIcon: state.isUserName
                          ? const Icon(
                              Icons.check_circle_sharp,
                              color: Colors.black,
                              size: 16,
                            )
                          : null),
                  validator: _signUpCubit.checkUser),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                  key: _signUpCubit.emailKey,
                  controller: _signUpCubit.emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      labelText: 'Email',
                      labelStyle: AppTextStyle.blackS20Bold,
                      suffixIcon: state.isEmail
                          ? const Icon(
                              Icons.check_circle_sharp,
                              color: Colors.black,
                              size: 16,
                            )
                          : null),
                  validator: _signUpCubit.checkEmail),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: _signUpCubit.passwordController,
                obscuringCharacter: "*",
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  labelText: 'Password',
                  labelStyle: AppTextStyle.blackS20Bold,
                  suffixIcon: InkWell(
                    onTap: _signUpCubit.showPassWord,
                    child: Icon(
                      state.isShowPassWord
                          ? Icons.visibility_off_outlined
                          : Icons.remove_red_eye_outlined,
                      color: Colors.black,
                      size: 16,
                    ),
                  ),
                ),
                validator: _signUpCubit.checkPass,
                obscureText: !state.isShowPassWord,
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: _signUpCubit.confirmPassController,
                obscuringCharacter: "*",
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  labelText: 'Confirm Password',
                  labelStyle: AppTextStyle.blackS20Bold,
                  suffixIcon: InkWell(
                    onTap: _signUpCubit.showConfirmPassWord,
                    child: Icon(
                      state.isShowConfirmPassWord
                          ? Icons.visibility_off_outlined
                          : Icons.remove_red_eye_outlined,
                      color: Colors.black,
                      size: 16,
                    ),
                  ),
                ),
                obscureText: !state.isShowConfirmPassWord,
                validator: _signUpCubit.checkTrueConfirmPass,
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                      value: state.isAccept,
                      onChanged: _signUpCubit.checkAccept,
                      fillColor: MaterialStateProperty.resolveWith(
                          AppColors.getColor)),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        "By creating an account you have to agree with our them & condication",
                        style: AppTextStyle.tintS14,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: (state.isAccept &&
                        state.isEmail &&
                        state.isUserName &&
                        state.isPass &&
                        state.isTrueConfirmPass)
                    ? _signUpCubit.signUp
                    : null,
                child: Container(
                  width: double.infinity,
                  height: 46,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: (state.isAccept &&
                              state.isEmail &&
                              state.isUserName &&
                              state.isPass &&
                              state.isTrueConfirmPass)
                          ? Colors.black
                          : Colors.grey),
                  child: Center(
                    child: state.loadStatus == LoadStatus.loading
                        ? const Center(child: CircularProgressIndicator())
                        : Text(
                            "Login",
                            style: AppTextStyle.whiteS16Bold,
                          ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  state.errorMessage,
                  style: AppTextStyle.errorText14Bold,
                ),
              )
            ]),
          );
        }),
      ),
    );
  }
}
