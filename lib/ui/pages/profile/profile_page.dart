import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_images.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_svgs.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_text_styles.dart';
import 'package:nws_huydq_ecommerce_flutter/models/enums/load_status.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/profile/components/gender_widget.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/profile/components/info_field.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/profile/components/setting_widget.dart';
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
              return state.loadStatus == LoadStatus.initial
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
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            child: Image.network(
                              state.imageUrl,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return state.loadStatus ==
                                        LoadStatus.loadingMore
                                    ? const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : Image.network(
                                        AppImages.noImage,
                                        width: 80,
                                        height: 80,
                                        fit: BoxFit.cover,
                                      );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextButton(
                            onPressed: _profileCubit.getImage,
                            child: Text(
                              "Upload image",
                              style: AppTextStyle.blackS14W800,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          infoField(size, "Name",
                              _profileCubit.nameEditingController),
                          const SizedBox(
                            height: 12,
                          ),
                          genderWidget(size),
                          const SizedBox(
                            height: 12,
                          ),
                          infoField(
                              size, "Age", _profileCubit.ageEditingController),
                          const SizedBox(
                            height: 12,
                          ),
                          infoField(size, "Email",
                              _profileCubit.emailEditingController),
                          const SizedBox(
                            height: 28,
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Settings",
                              style: AppTextStyle.blackS18W800,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const SettingWidget(),
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
                                    "Log Out",
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
