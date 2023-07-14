

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/news_model.dart';

// class NewsModelProvider extends ChangeNotifier{

// // List<NewsModel> newsModel   = [];

// // int newsIndex = 0;

// // void setNewsModel (NewsModel model){
// //   newsModel.add(model);
// //   notifyListeners();

// // }

// // void setNewsIndex (int newsIndex){
// //   this.newsIndex = newsIndex;
// //   notifyListeners();
// // }

//   Stream<List<NewsModel>> fetchNewsFromFirestore() {
//     try {
//       final newsCollection =
//           FirebaseFirestore.instance.collection('news');

//       return newsCollection.snapshots().map((querySnapshot) {
//         return querySnapshot.docs.map((doc) {
//           final data = doc.data();
//           return NewsModel(
//             newsTitle: data['newsTitle'],
//             newsImage: data['newsImage'],
//             description: data['description'],
//             date: data['date'],
//             newsUrl: data['newsUrl'],
//             source: data['source'],
//             newsLabel: data['newsLabel'],
//             aiScore: data['aiScore'],
//           );
//         }).toList();
//       });
//     } catch (error) {
//       print('Error fetching news: $error');
//       return Stream.error('Error fetching news');
//     }
//   }

// }



class NewsModelProvider with ChangeNotifier {
  List<NewsModel> _newsList = [];

  List<NewsModel> get newsList => _newsList;

  Stream<List<NewsModel>> fetchNewsFromFirestore() {
    try {
      final newsCollection =
          FirebaseFirestore.instance.collection('beacons');

      return newsCollection
          .where('image', isNotEqualTo: null)
          .where('description', isNotEqualTo: null)
          .orderBy('published_at', descending: true)
          .limit(200)
          .snapshots()
          .map((querySnapshot) {
        _newsList = querySnapshot.docs.map((doc) {
          final data = doc.data();
          String label = data['ai_sentiment']['label'];
          return NewsModel(
            newsTitle: data['title'],
            newsImage: data['image'],
            description: data['description'],
            date: data['published_at'],
            newsUrl: data['url'],
            source: data['source'],
            newsLabel: label,
            aiScore: data['ai_sentiment']['score'],
          );
        }).toList();
        notifyListeners();
        return _newsList;
      });
    } catch (error) {
      print('Error fetching news: $error');
      return Stream.error('Error fetching news');
    }
  }
}