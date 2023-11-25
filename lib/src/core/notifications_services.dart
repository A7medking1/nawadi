import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  if(kDebugMode){
    print('title Background => ${message.notification!.title}');
    print('body Background => ${message.notification!.body}');

  }
}

class NotificationHandler {
  NotificationHandler._();

  static final _notification = FlutterLocalNotificationsPlugin();
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static Future<void> notificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    // print('User granted permission: ${settings.authorizationStatus}');
  }

  static void init() async {
    await _notification.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(),
      ),
    );

    await notificationPermission();
  }

  static pushNotification(
    RemoteMessage message,
  ) async {
    AndroidNotificationChannel channel = AndroidNotificationChannel(
      Random.secure().nextInt(10000).toString(),
      'High Importance Channel',
      importance: Importance.max,
    );

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      channel.id.toString(),
      channel.name.toString(),
      channelDescription: 'channel description',
      importance: Importance.max,
      priority: Priority.max,
      ticker: 'ticker',
    );
    DarwinNotificationDetails iOSPlatformChannelSpecifics =
        const DarwinNotificationDetails();
    NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );
    await _notification.show(
      5,
      message.notification!.title,
      message.notification!.body,
      platformChannelSpecifics,
    );
  }

  static void listenNotification() {
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) async {
        await pushNotification(message);
        /* print('Got a message whilst in the foreground!');
        print('Message data: ${message.data}');
*/
        // NotificationHandler.pushNotification(message);

        if (message.notification != null) {
          /*  print(
              'Message also contained a notification: ${message.notification}');*/
        }
      },
    );
  }
}
