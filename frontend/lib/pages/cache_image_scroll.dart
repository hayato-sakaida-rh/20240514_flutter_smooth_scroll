import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smooth_scroll_2/configs/consts.dart';
import 'package:flutter_smooth_scroll_2/configs/custom_cache_manager.dart';
import 'package:gap/gap.dart';

class CacheImageScrollPage extends StatefulWidget {
  const CacheImageScrollPage({super.key});

  @override
  State<CacheImageScrollPage> createState() => _CacheImageScrollPageState();
}

class _CacheImageScrollPageState extends State<CacheImageScrollPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: scrollItemCount,
      itemBuilder: (_, index) {
        final targetListIndex = index % vegetableImageUrlList.length;
        final imageUrl =
            '${vegetableImageUrlList[targetListIndex]}?index=$index';

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
                  return const Center(
                    child: Text(
                      'LOADING',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
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
