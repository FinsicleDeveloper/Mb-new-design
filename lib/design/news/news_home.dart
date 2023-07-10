import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:design/constants/appcolors.dart';
import 'package:design/design/news/widgets/news_card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';


class NewsHome extends StatefulWidget {
  const NewsHome({super.key});

  @override
  State<NewsHome> createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome>
    with AutomaticKeepAliveClientMixin {
  final PageController pageController = PageController();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final size = MediaQuery.of(context).size;
   // var chatBubbleState = Provider.of<ChatBubbleState>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kbgcolor,
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection('beacons')
              .where('image', isNotEqualTo: null)
              .where('description', isNotEqualTo: null)
              .orderBy('published_at', descending: true)
              .limit(200)
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: Lottie.asset('assets/lottie/loadingLotte.json'));
            } else if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.data?.docs.isEmpty != true) {
          
                // final news = snapshot.data?.docs[
                //     Provider.of<ChatBubbleState>(context, listen: true).index];
                //final String? newsTitle = news?['title']?.toString();
                //String label = news['ai_sentiment']['label'];
                return Stack(
                  children: [
                    PageView.builder(
                      controller: pageController,

                      onPageChanged: (index) {
                        // chatBubbleState.updateIndex(index);
                        // chatBubbleState.setToggleVisibilitytoFalse(false);
                        // chatBubbleState.buttonVisibility(false);
                        // Provider.of<LikedState>(context, listen: false)
                        //     .changeLikedState(false);

                        pageController.animateToPage(index,
                            duration: const Duration(milliseconds: 1),
                            curve: Curves.easeIn);
                      },

                      scrollDirection: Axis.vertical,
                      // swipeOptions: AppinioSwipeOptions.vertical,
                      //  padding: const EdgeInsets.symmetric(),
                      // duration: const Duration(milliseconds: 50),
                      itemBuilder: (BuildContext context, int index) {
                        final news = snapshot.data?.docs[index];
                        String label =
                        
                         news['ai_sentiment']['label'];

                        return NewsCard(
                          newsTitle: news?['title']?.toString(),
                          newsPhoto: news?['image']?.toString(),
                          description: news?['description']?.toString(),
                          date:
                          
                          news?['published_at'],
                          newsUrl: news['url'],
                          source: news['source'],
                          newsLabel: label,
                          aiScore: 
                          
                          
                          news['ai_sentiment']['score'],
                        );
                      },
                      itemCount: snapshot.data?.docs.length,
                    ),
                    // Positioned(
                    //   bottom: size.height * 0.01,
                    //   child: Row(
                    //     children: [
                    //       const AiRobot(),
                    //       Column(
                    //         children: [
                    //           ChatBubble(
                    //             message: label,
                    //             newsDocid: news.id,
                    //           ),
                    //           const SizedBox(
                    //             height: 5,
                    //           ),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // )
                  ],
                );
              }
            } else {
              return const Center(child: Text('Something Went Wrong'));
            }
            return const Center(
              child: Text('No news'),
            );
          },
        ),
      ),
    );
  }
}
