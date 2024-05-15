import 'package:blur/blur.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smooth_scroll_2/configs/consts.dart';
import 'package:flutter_smooth_scroll_2/configs/custom_cache_manager.dart';
import 'package:gap/gap.dart';

class CacheBlurImageScrollPage extends StatefulWidget {
  const CacheBlurImageScrollPage({super.key});

  @override
  State<CacheBlurImageScrollPage> createState() =>
      _CacheBlurImageScrollPageState();
}

class _CacheBlurImageScrollPageState extends State<CacheBlurImageScrollPage> {
  Widget placeholderWidget({required String imageUrl}) {
    return FutureBuilder(
      future: precacheImage(NetworkImage(imageUrl), context),
      builder: (context, snapshot) {
        Widget child = const Center(
          child: Text(
            'LOADING',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        );

        if (snapshot.connectionState == ConnectionState.done) {
          child = Blur(
            blur: 8,
            colorOpacity: 0.1,
            child: Image.network(
              imageUrl,
              width: listImageWidth,
              height: listImageHeight,
              fit: BoxFit.cover,
            ),
          );
        }

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: scrollItemCount,
      itemBuilder: (_, index) {
        final targetListIndex = index % vegetableImageUrlList.length;
        final imageUrl =
            '${vegetableImageUrlList[targetListIndex]}?index=$index';
        final minimumImageUrl =
            '${vegetableResizedImageUrlList[targetListIndex]}?index=$index';

        return ListTile(
          title: Row(
            children: [
              CachedNetworkImage(
                width: listImageWidth,
                height: listImageHeight,
                fit: BoxFit.cover,
                imageUrl: imageUrl,
                cacheManager: CustomCacheManager(),
                placeholder: (_, __) {
                  return placeholderWidget(imageUrl: minimumImageUrl);
                },
                errorWidget: (_, __, ___) {
                  return const Icon(Icons.error);
                },
              ),
              const Gap(16),
              Text(vegetableNameList[targetListIndex]),
            ],
          ),
          onTap: () {},
        );
      },
    );
  }
}
