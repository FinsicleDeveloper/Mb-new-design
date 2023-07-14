
import 'package:cloud_firestore/cloud_firestore.dart';


class NewsModel {
  final String? newsTitle;
  final String? newsImage;
  final String? description;
  final Timestamp? date     ;
  final String newsUrl;
  final String source;
  final String newsLabel;
  final double aiScore;

  NewsModel(
      {required this.newsTitle,
      required this.newsImage,
      required this.description,
      required this.date,
      required this.newsUrl,
      required this.source,
      required this.newsLabel,
      required this.aiScore});
}
