import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import '../../constants/location_constant.dart';
import 'base/base_local_notification_service.dart';
import 'model/local_notification_model.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

@singleton
class LocalNotificationService extends BaseLocalNotificationService {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  final onNotifications = BehaviorSubject<String?>();

  Future<void> init() async {
    var androidInitializationSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitializationSettings = IOSInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
      onDidReceiveLocalNotification: onDidReceiveLocalNotificationIOS,
    );

    var initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    //getLocation turkey timezone
    tz.setLocalLocation(
      tz.getLocation(
        LocationConstant.TURKEY_TIMEZONE,
      ),
    );

    //notify listener when app is closed
    final details =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

    if (details != null && details.didNotificationLaunchApp) {
      onNotifications.add(details.payload);
    }

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (payload) {
        onNotifications.add(payload);
      },
    );
  }

  void onDidReceiveLocalNotificationIOS(
      int id, String? title, String? body, String? payload) async {
    // display a dialog with the notification details, tap ok to go to another page
  }

  Future<void> showNotification(
      {LocalNotificationModel? localNotificationModel}) async {
    await flutterLocalNotificationsPlugin.show(
      localNotificationModel!.id,
      localNotificationModel.title,
      localNotificationModel.body,
      await notificationDetails(),
      payload: localNotificationModel.payload,
    );
  }

  Future<void> showScheduledNotification(
      {LocalNotificationModel? localNotificationModel}) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      localNotificationModel!.id,
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
      matchDateTimeComponents: DateTimeComponents.dateAndTime,
    );
  }

  notificationDetails() {
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

  Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
