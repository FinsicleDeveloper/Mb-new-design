
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:design/constants/appcolors.dart';
import 'package:design/design/news/widgets/news_card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class NewsHome extends StatefulWidget {
 const NewsHome({super.key});

  @override
  State<NewsHome> createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome> with AutomaticKeepAliveClientMixin {
  final PageController pageController = PageController();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kbgcolor,
        body: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
          future: FirebaseFirestore.instance
              .collection('beacons')
              .where('image', isNotEqualTo: null)
              .where('description', isNotEqualTo: null)
              .orderBy('published_at', descending: true)
              .limit(200)
              .get(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: Lottie.asset('assets/lottie/loadingLotte.json'));
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                return Stack(
                  children: [
                    PageView.builder(
                      controller: pageController,
                      onPageChanged: (index) {
                        pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 1),
                          curve: Curves.easeIn,
                        );
                      },
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        final news = snapshot.data!.docs[index];
                        String label = news['ai_sentiment']['label'];

                        return NewsCard(
                          newsTitle: news?['title']?.toString(),
                          newsPhoto: news?['image']?.toString(),
                          description: news?['description']?.toString(),
                          date: news?['published_at'],
                          newsUrl: news['url'],
                          source: news['source'],
                          newsLabel: label,
                          aiScore: news['ai_sentiment']['score'],
                        );
                      },
                      itemCount: snapshot.data!.docs.length,
                    ),
                  ],
                );
              }
            } else {
              return const Center(child: Text('Something Went Wrong'));
            }
            return const Center(child: Text('No news'));
          },
        ),
      ),
    );
  }
}
