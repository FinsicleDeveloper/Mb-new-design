import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';



//
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print(message.messageId);
}







class FirebaseApi {
 final  _firebaseMessaging = FirebaseMessaging.instance;





Future<void> initNotifications()async{
  await _firebaseMessaging.requestPermission();
  await _firebaseMessaging.subscribeToTopic("beacons");
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  final fcmToken = await _firebaseMessaging.getToken();
  await _firebaseMessaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');
    // const notification = message.notification;
    if (message.notification != null) {
      print("haI");

      // print('Message also contained a notification: ${message.notification}');
    }
  }); 

  print(fcmToken);
  
}


}