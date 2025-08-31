import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:attendance/core/const/app_const.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

abstract class NotificationHelper {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static Future<String> init() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );

    await initializeLocalNotificationPlugn();

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage noti) async {
      RemoteNotification? notification = noti.notification;
      AndroidNotification? android = noti.notification?.android;
      log("notification type ${noti.notification?.apple is AppleNotification}");
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage noti) async {
      RemoteNotification? notification = noti.notification;
      AndroidNotification? android = noti.notification?.android;

      if (notification != null) {
        if (android != null) {
          showNotification(
            payload: jsonEncode(noti.data),
            id: noti.hashCode,
            title: notification.title,
            body: notification.body,
          );
        } else if (noti.notification?.apple is AppleNotification) {}
      }
    });
    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
      kDeviceToken = newToken;
    });
    try {
      String token = await FirebaseMessaging.instance.getToken() ?? "";
      kDeviceToken = token;
      return token;
    } catch (e) {
      if (Platform.isAndroid) {
        var androidToken = await FirebaseMessaging.instance.getToken() ?? "";
        kDeviceToken = androidToken;
        return androidToken;
      } else if (Platform.isIOS || Platform.isMacOS) {
        var token = await FirebaseMessaging.instance.getAPNSToken();
        kDeviceToken = token ?? "";
        return token ?? "";
      } else {
        return "";
      }
    }
  }

  static void showNotification({
    required int id,
    String? title,
    String? body,
    String? payload,
  }) {
    flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails(),
      payload: payload,
    );
  }

  static NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'custom_channel_id_v2',
        'your channel name',
        importance: Importance.high,
        sound: RawResourceAndroidNotificationSound('shubik_ring'),
        playSound: true,
        priority: Priority.max,
        icon: '@mipmap/ic_launcher',
      ),
      iOS: DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
        sound: 'shubik_ring.caf',
      ),
    );
  }

  //sound
  static Future<void> initializeLocalNotificationPlugn() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'custom_channel_id_v2',
      'Shubik Channel',
      description: 'Channel with custom sound',
      importance: Importance.high,
      playSound: true,
      enableLights: true,
      enableVibration: true,
      sound: RawResourceAndroidNotificationSound('shubik_ring'),
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings();
    const LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification');
    const InitializationSettings initializationSettings =
        InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsDarwin,
          macOS: initializationSettingsDarwin,
          linux: initializationSettingsLinux,
        );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {},
    );
  }
}

///
//
//<meta-data
 // android:name="com.google.firebase.messaging.default_notification_icon"
  //android:resource="@mipmap/ic_launcher"/>