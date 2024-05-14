import 'package:flutter/material.dart';
import 'package:flutter_smooth_scroll_2/consts.dart';
import 'package:gap/gap.dart';

class ImageScrollPage extends StatefulWidget {
  const ImageScrollPage({super.key});

  @override
  State<ImageScrollPage> createState() => _ImageScrollPageState();
}

class _ImageScrollPageState extends State<ImageScrollPage> {
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
              Image.network(
                imageUrl,
                width: 150,
                height: 100,
                fit: BoxFit.cover,
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
