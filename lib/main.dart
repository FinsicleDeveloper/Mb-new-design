import 'package:design/constants/appcolors.dart';
import 'package:design/db/contants/mongo_data_base_functions.dart';
import 'package:design/design/home/home.dart';
import 'package:flutter/material.dart';

void main()async  {
    WidgetsFlutterBinding.ensureInitialized();
  await MongodataBaseFunctions.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    theme: ThemeData(
      scaffoldBackgroundColor: AppColors.kbgcolor
    ),
      home: const Home(),
    );
  }
}

