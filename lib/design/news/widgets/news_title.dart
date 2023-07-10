import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../constants/appcolors.dart';
import '../../web/web_view.dart';

class NewsTitle extends StatelessWidget {
  const NewsTitle(
      {super.key,
      required this.newsTitle,
      required this.date,
      required this.source,
      required this.newsUrl});
  final String? newsTitle;
  final Timestamp? date;
  final String source;
  final String newsUrl;

  @override
  Widget build(BuildContext context) {
    final day = date?.toDate().day;
    final DateTime dateTime = date?.toDate() ?? DateTime.now();
    final year = date?.toDate().year;
    final String monthName = DateFormat('MMMM').format(dateTime);
    final String dayName = DateFormat('EEEE').format(dateTime);
    final formattedDate = DateFormat().add_jm().format(date!.toDate());

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.kbgcolor,
          boxShadow: [
            const BoxShadow(
                color: Colors.black,
                offset: Offset(5, 5),
                spreadRadius: 5,
                blurRadius: 15),
            BoxShadow(
                color: Colors.grey.shade800,
                offset: const Offset(-4, -4),
                spreadRadius: 1,
                blurRadius: 15),
          ],
                    gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.black, Colors.black],
              stops: [0, 1]),
              ),
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16,
      ),
      child: GestureDetector(
        onTap: () {
          print(newsTitle);
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return WebView(
              url: newsUrl,
              showFAB: true,
            );
          }));
        },
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: date != null
                          ? "$dayName, $day $monthName $year,"
                          : 'No date',
                      style: const TextStyle(
                        color: AppColors.kWhite,
                        fontSize: 10,
                        fontFamily: ('Lora'),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    TextSpan(
                      text: ' $formattedDate',
                      style: const TextStyle(
                        fontFamily: ('Lora'),
                        color: AppColors.kWhite,
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 6),
            SizedBox(
              width: double.infinity,
              child: Text(
                newsTitle == null ? 'No title' : newsTitle!,
                style: const TextStyle(
                  letterSpacing: 0.5,
                  fontFamily: ('Lora'),
                  color: AppColors.kWhite,
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const SizedBox(height: 6),
            SizedBox(
              width: double.infinity,
              child: Text(
                "Source: $source",
                style: const TextStyle(
                  letterSpacing: 0.8,
                  color: AppColors.kWhite,
                  fontSize: 9,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
          ],
        ),
      ),
    );
  }
}
