import 'package:design/constants/appcolors.dart';
import 'package:design/design/home/home.dart';
import 'package:design/design/indicators/functions/changer_provider.dart';
import 'package:design/design/login/page_login.dart';
import 'package:design/design/news/functions/news_model_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'db/functions/mongo_data_base_functions.dart';
import 'design/login/functions/listen_to_auth_changes.dart';
import 'design/web/functions/loading_state.dart';
import 'firebase_options.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print(message.messageId);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final fcm = FirebaseMessaging.instance;
  await fcm.requestPermission();
  final token = await fcm.getToken();


  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.instance.subscribeToTopic('beacons');

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
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
    if (message.notification != null) {
    }
  });

  

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoadingState>(
          create: (_) => LoadingState(),
        ),
        ChangeNotifierProvider<NewsModelProvider>(
          create: (_) => NewsModelProvider(),
        ),
       ChangeNotifierProvider<ChangerProvider>(
          create: (_) => ChangerProvider(),
        ), 
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              textTheme: const TextTheme(
                  bodyMedium:
                      TextStyle(fontFamily: 'Lora', color: AppColors.kWhite),
                  bodyLarge:
                      TextStyle(fontFamily: 'Lora', color: AppColors.kWhite),
                  bodySmall:
                      TextStyle(fontFamily: 'Lora', color: AppColors.kWhite)),
              scaffoldBackgroundColor: AppColors.kBlackedColor),
          home: Home()),
    );
  }
}
