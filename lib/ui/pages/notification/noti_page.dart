import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_shadow.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_vector.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_text_styles.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/notification/widgets/noti_item.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/notification/noti_cubit.dart';

class NotiPage extends StatelessWidget {
  const NotiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return NotiCubit();
      },
      child: const NotiView(),
    );
  }
}

class NotiView extends StatefulWidget {
  const NotiView({super.key});

  @override
  State<NotiView> createState() => _NotiViewState();
}

class _NotiViewState extends State<NotiView> {
  late NotiCubit _notiCubit;

  @override
  void initState() {
    super.initState();
    _notiCubit = context.read<NotiCubit>();
    _notiCubit.getNotis();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      AppSVGs.icBack,
                      height: 32,
                      width: 32,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      // padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          boxShadow: [AppShadow.productColor],
                          shape: BoxShape.circle,
                          color: Colors.white),
                      child: const Icon(
                        Icons.more_vert,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Notificaion",
                style: AppTextStyle.blackS18W800,
              ),
              const SizedBox(
                height: 4,
              ),
              BlocBuilder<NotiCubit, NotiState>(builder: (context, state) {
                return SizedBox(
                  // height: MediaQuery.of(context).size.height * 0.70,
                  width: double.infinity,
                  child: RefreshIndicator(
                    triggerMode: RefreshIndicatorTriggerMode.anywhere,
                    onRefresh: _notiCubit.getNotis,
                    edgeOffset: 0,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: state.notifications.length,
                        itemBuilder: (context, index) {
                          final noti = state.notifications[index];
                          return NotiItem(
                            title: noti.title,
                            subTitle: noti.subTitle,
                            image: noti.image,
                            time: noti.createDate!,
                            notiCubit: _notiCubit,
                          );
                        }),
                  ),
                );
              })
            ],
          ),
        ),
      )),
    );
  }
}
