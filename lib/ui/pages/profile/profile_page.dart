import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:nws_huydq_ecommerce_flutter/common/app_vector.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_text_styles.dart';
import 'package:nws_huydq_ecommerce_flutter/models/enums/load_status.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/profile/widgets/avatar_widget.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/profile/widgets/gender_widget.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/profile/widgets/info_field.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/profile/widgets/setting_widget.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/profile/profile_cubit.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/profile/profile_navigator.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return ProfileCubit(navigator: ProfileNavigator(context: context));
      },
      child: const ProfileView(),
    );
  }
}

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late ProfileCubit _profileCubit;

  @override
  void initState() {
    super.initState();

    _profileCubit = context.read<ProfileCubit>();
    _profileCubit.getProfile(context);
    _profileCubit.getLanguage();
    _profileCubit.context = context;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              return state.loadStatus == LoadStatus.loading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          AvatarWidget(
                            profileCubit: _profileCubit,
                            imageUrl: state.imageUrl,
                            loadStatus: state.loadStatus,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextButton(
                            onPressed: _profileCubit.getImage,
                            child: Text(
                              'upload_image'.tr,
                              style: AppTextStyle.blackS14W800,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InfoField(
                            size: size,
                            name: 'name'.tr,
                            textEditingController:
                                _profileCubit.nameEditingController,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          GenderWidget(size: size),
                          const SizedBox(
                            height: 12,
                          ),
                          InfoField(
                            size: size,
                            name: 'age'.tr,
                            textEditingController:
                                _profileCubit.ageEditingController,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          InfoField(
                            size: size,
                            name: "Email",
                            textEditingController:
                                _profileCubit.emailEditingController,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const SizedBox(
                            height: 28,
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'settings'.tr,
                              style: AppTextStyle.blackS18W800,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          SettingWidget(
                            changeNoti: _profileCubit.changeNotiState,
                            changeLang: _profileCubit.changLanguage,
                            language: state.language,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              _profileCubit.logOut(context);
                            },
                            child: Container(
                              height: 48,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.black),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    AppSVGs.icLogout,
                                    height: 16,
                                    width: 16,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'log_out'.tr,
                                    style: AppTextStyle.whiteS14w500,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }
}
