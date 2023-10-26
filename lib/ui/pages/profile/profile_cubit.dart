import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nws_huydq_ecommerce_flutter/database/secure_storage_helper.dart';
import 'package:nws_huydq_ecommerce_flutter/global/global_data.dart';
import 'package:nws_huydq_ecommerce_flutter/models/enums/load_status.dart';
import 'package:nws_huydq_ecommerce_flutter/models/profile/profile.dart';
import 'package:nws_huydq_ecommerce_flutter/network/api_path.dart';
import 'package:nws_huydq_ecommerce_flutter/network/api_service.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/commons/app_dialog.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/main/main_cubit.dart';
import 'package:nws_huydq_ecommerce_flutter/ui/pages/profile/profile_navigator.dart';

import 'package:firebase_storage/firebase_storage.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileNavigator navigator;
  ProfileCubit({required this.navigator}) : super(const ProfileState());

  TextEditingController nameEditingController = TextEditingController();
  TextEditingController ageEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  String imageUrl = "";

  BuildContext? context;

  final Reference storageReference =
      FirebaseStorage.instance.ref().child('images');

  Future<void> getProfile(BuildContext context) async {
    Profile profile = context.read<MainCubit>().profile;
    log(profile.avatar);
    nameEditingController.text = profile.name;
    ageEditingController.text = "21";
    emailEditingController.text = profile.email;
    imageUrl = profile.avatar;

    emit(state.copyWith(loadStatus: LoadStatus.success, imageUrl: imageUrl));
  }

  void logOut(BuildContext context) {
    emit(state.copyWith(loadStatus: LoadStatus.loading));
    showCustomDialog(
      context: context,
      title: "Log Out",
      content: "Are you sure you want to log out",
      onConfirm: () {
        SecureStorageHelper().removeToken();
        Future.delayed(
          const Duration(seconds: 1),
          () {
            emit(state.copyWith(loadStatus: LoadStatus.success));
            navigator.openLogin();
            GlobalData.instance.quantityCart = 0;
            GlobalData.instance.userId = 0;
          },
        );
      },
    );
  }

  Future<void> getImage() async {
    final ImagePicker picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage == null) {
      log("null");
      return;
    } else {
      uploadImage(pickedImage);
    }
  }

  Future<void> uploadImage(
    XFile pickedImage,
  ) async {
    emit(state.copyWith(loadStatus: LoadStatus.loadingMore));
    final File image = File(pickedImage.path);
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child("image1${DateTime.now()}");
    UploadTask uploadTask = ref.putFile(image);
    log(pickedImage.path);
    uploadTask.whenComplete(() async {
      imageUrl = await ref.getDownloadURL();
      emit(state.copyWith(loadStatus: LoadStatus.success, imageUrl: imageUrl));
      updateImage();
    }).catchError((onError) {
      log(onError);
      return onError;
    });
  }

  Future<void> updateImage() async {
    String url =
        "${ApiPath.baseUrl}${ApiPath.updateUser}${GlobalData.instance.userId}";
    var data = json.encode({"avatar": imageUrl});
    Response response = await ApiService().putAPI(url, data);
    if (response.statusCode == 200) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context!).showSnackBar(const SnackBar(
        content: Text("Successfully updated avatar"),
      ));
    } else {}
    // ignore: use_build_context_synchronously
    context!.read<MainCubit>().getProfile(context!);
  }
}
