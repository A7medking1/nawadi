import 'dart:io';

import 'package:alnawadi/firebase_options.dart';
import 'package:alnawadi/src/core/notifications_services.dart';
import 'package:alnawadi/src/core/resources/language_manager.dart';
import 'package:alnawadi/src/core/services/index.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if(Platform.isAndroid){
    final fcmToken = await FirebaseMessaging.instance.getToken();
    print(fcmToken);
  }

  NotificationHandler.init();

  NotificationHandler.listenNotification();

  await ServicesLocator().init();

  runApp(
    EasyLocalization(
      supportedLocales: const [arabicLocal, englishLocal],
      fallbackLocale: englishLocal,
      path: assetsLocalization,
      child: Phoenix(
        child: const MyApp(),
      ),
    ),
  );
}

// android:enableOnBackInvokedCallback="true"
