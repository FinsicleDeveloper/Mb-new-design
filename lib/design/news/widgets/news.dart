import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../constants/appcolors.dart';


class News extends StatelessWidget {
  const News({
    super.key,
    required this.desCription,
    required this.newsTitle,
    required this.date,
  });
  final String? desCription;
  final String? newsTitle;
  final Timestamp? date;
  @override
  Widget build(BuildContext context) {
  const color = Colors.black;
  //  const color = Color.fromARGB(255, 254, 253, 253);
    return SizedBox(
      child: SingleChildScrollView(   
        child: Text(
          desCription == null ? 'No News' : desCription!,
          style: const TextStyle(
            color: AppColors.kWhite,
            fontSize: 15,
          ),   
        ),
      ),
    );
  }
}
