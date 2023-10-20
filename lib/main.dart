
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nws_huydq_ecommerce_flutter/app.dart';
import 'package:nws_huydq_ecommerce_flutter/firebase_options.dart';
import 'package:nws_huydq_ecommerce_flutter/service/firebase_api.dart';
import 'package:path_provider/path_provider.dart';

int quantityCart = 0;
int userId = 0;
final navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FireBaseApi().initNotifications();

  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getTemporaryDirectory());

  runApp(const MyApp());
}

