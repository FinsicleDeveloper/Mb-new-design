import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:design/design/news/widgets/news_title.dart';
import 'package:flutter/material.dart';
//import 'package:market_beacon/news/widgets/neumorphism/neuphomic_container.dart';
import '../../../constants/appcolors.dart';
import 'news.dart';
import 'news_photo.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.newsTitle,
    required this.newsPhoto,
    required this.description,
    required this.date,
    required this.newsUrl,
    required this.source,
    required this.newsLabel,
    required this.aiScore, 
  });
  final String? newsTitle;
  final String? newsPhoto;
  final String? description;
  final Timestamp? date;
  final String newsUrl;
  final String source;
  final String newsLabel;
  final double aiScore;


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
//var modelProvider = Provider.of<NewsModelProvider>(context);
  //int index = modelProvider.newsIndex;
    return Scaffold(
      backgroundColor: AppColors.kbgcolor,
      body: Stack(
        children: [
          NewsPhoto(newsPhoto: newsPhoto),
          Stack(
            children: [
              Positioned(
                  top: size.height * 0.33,
                  left: 16,
                  right: 16,
                  child: Column(
                    children: [
                      FractionallySizedBox(
                          widthFactor: 0.9,
                          child: NewsTitle(
                            newsTitle: newsTitle,
                            date: date,
                            source: source,
                            newsUrl: newsUrl,
                          )),
                      const SizedBox(
                        height: 25,
                      ),
                      FractionallySizedBox(
                        widthFactor: 0.9,
                        child: News(
                            desCription: description,
                            newsTitle: newsTitle,
                            date: date),
                      )
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
