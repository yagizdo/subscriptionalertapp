import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:subscriptionalertapp/core/constants/location_constant.dart';
import 'package:subscriptionalertapp/core/services/local_notification/base/base_local_notification_service.dart';
import 'package:subscriptionalertapp/core/services/local_notification/model/local_notification_model.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

@singleton
class LocalNotificationService extends BaseLocalNotificationService {
  /* LocalNotificationService() {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    onNotifications = BehaviorSubject<String?>();
    init();
  }*/

  //late
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  //late
  BehaviorSubject<String?> onNotifications = BehaviorSubject<String?>();

  Future init() {
    var androidInitializationSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitializationSettings = IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    var initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    tz.initializeTimeZones();
    //getLocation turkey timezone
    tz.setLocalLocation(
      tz.getLocation(
        LocationConstant.TURKEY_TIMEZONE,
      ),
    );

    return flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (payload) {
        onNotifications.add(payload);
      },
    );
  }

  void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    // display a dialog with the notification details, tap ok to go to another page
  }

  Future showNotification(LocalNotificationModel localNotificationModel) async {
    return flutterLocalNotificationsPlugin.show(
      localNotificationModel.id,
      localNotificationModel.title,
      localNotificationModel.body,
      await notificationDetails(),
      payload: localNotificationModel.payload,
    );
  }

  Future showScheduledNotification(
      LocalNotificationModel localNotificationModel) async {
    return flutterLocalNotificationsPlugin.zonedSchedule(
        localNotificationModel.id,
        localNotificationModel.title,
        localNotificationModel.body,
        tz.TZDateTime.from(localNotificationModel.dateTime!, tz.local),
        await notificationDetails(),
        payload: localNotificationModel.payload,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        //if the notificstion will be triggered in the future,
        // DateTimeComponents must be set to "dateAndTime"
        matchDateTimeComponents: DateTimeComponents.time,
        );
  }

  Future notificationDetails() async {
    const androidNotificationDetails = AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );

    const iosNotificationDetails = IOSNotificationDetails();

    return const NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails,
    );
  }
}
