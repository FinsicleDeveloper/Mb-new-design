
import 'package:design/design/news/functions/news_model_provider.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/framework.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:provider/provider.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../constants/appcolors.dart';

class NewsPhoto extends StatelessWidget {
  const NewsPhoto({super.key, required this.newsPhoto});
  final String? newsPhoto;
 
  @override
  Widget build(BuildContext context) {
    if (newsPhoto!.contains('youtube.com')) {
      return VideoPlayer(link: newsPhoto!);
    } else {
      return Container(
        decoration: BoxDecoration(
          color: AppColors.kbgcolor,
        ),

        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.3,
        child: newsPhoto != null
            ? buildImage(newsPhoto)
            : Image.asset(
                'assets/no_image.png',
              ),
      );
    }
  }
}

Widget buildImage(url) {
  return ClipRRect(
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(0), // Adjust the radius as needed
      topRight: Radius.circular(0), // Adjust the radius as needed
    ),
    child: CachedNetworkImage(
      cacheManager: CacheManager(
          Config('customCacheKey', stalePeriod: const Duration(days: 1))),
      key: UniqueKey(),
      imageUrl: url,
      fit: BoxFit.cover,
      errorWidget: (context, url, error) {
        return Container(
          width: double.infinity,
          color: AppColors.kbgcolor,
          child: const Icon(
            Icons.image_not_supported,
            color: Colors.red,
          ),
        );
      },
    ),
  );
}

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key, required this.link});
  final String link;
  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(widget.link);

    controller = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: const YoutubePlayerFlags(autoPlay: true));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.kbgcolor,
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.3,
        child: YoutubePlayer(
          controller: controller,
          showVideoProgressIndicator: true,
        ));
  }
}
