import 'package:design/api/firebase_api.dart';
import 'package:design/constants/appcolors.dart';
import 'package:design/design/home/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'db/functions/mongo_data_base_functions.dart';
import 'design/web/functions/loading_state.dart';
import 'firebase_options.dart';

void main()async  {
    WidgetsFlutterBinding.ensureInitialized();

  await MongodataBaseFunctions.connect();

    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseApi().initNotifications();
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
      theme: ThemeData(
           textTheme: const TextTheme(
                  bodyMedium: TextStyle(
                    fontFamily: 'Lora',
                    color: AppColors.kWhite

                  ),
                  bodyLarge: TextStyle(
                    fontFamily: 'Lora',
                    color: AppColors.kWhite
                  ),
                  bodySmall: TextStyle(
                    fontFamily: 'Lora',
                    color: AppColors.kWhite
                  )),
        scaffoldBackgroundColor: AppColors.kBlackedColor
      ),
        home: const Home(),
      ),
    );
  }
}

