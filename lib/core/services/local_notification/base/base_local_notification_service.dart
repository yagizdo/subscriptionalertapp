import '../model/local_notification_model.dart';

abstract class BaseLocalNotificationService {
  Future<void> init();
  Future<void> showNotification(
      {LocalNotificationModel? localNotificationModel});
  Future<void> showScheduledNotification(
      {LocalNotificationModel? localNotificationModel});
  Future<void> cancelNotification(int id);
  Future<void> cancelAllNotifications();
}
