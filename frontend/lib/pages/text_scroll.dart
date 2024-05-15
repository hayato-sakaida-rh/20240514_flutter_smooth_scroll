import 'package:flutter/material.dart';
import 'package:flutter_smooth_scroll_2/configs/consts.dart';

class TextScrollPage extends StatefulWidget {
  const TextScrollPage({super.key});

  @override
  State<TextScrollPage> createState() => _TextScrollPageState();
}

class _TextScrollPageState extends State<TextScrollPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: scrollItemCount,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item $index'),
          onTap: () {},
        );
      },
    );
  }
}
