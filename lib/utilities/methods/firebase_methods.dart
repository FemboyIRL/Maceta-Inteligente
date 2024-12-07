import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:maceta_inteligente/utilities/methods/Dio/http_dio_requests.dart';
import 'package:maceta_inteligente/utilities/methods/notifications_methods.dart';

class FirebaseMethods {
  final HttpDioRequests httpDioRequests;
  final NotificationService notificationService;

  FirebaseMethods(this.httpDioRequests, this.notificationService);

  Future<void> initializeFCM() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    // Obtener y guardar token
    String? token = await messaging.getToken();
    if (token != null) {
      await httpDioRequests.saveTokenToServer(token);
    }

    // Manejar notificaciones
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      notificationService.showNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Notificación que abrió la app: ${message.notification?.title}');
    });
  }
}
