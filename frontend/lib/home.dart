import 'package:flutter/material.dart';
import 'package:flutter_smooth_scroll_2/cache_blur_image_scroll.dart';
import 'package:flutter_smooth_scroll_2/cache_image_scroll.dart';
import 'package:flutter_smooth_scroll_2/image_scroll.dart';
import 'package:flutter_smooth_scroll_2/settings.dart';
import 'package:flutter_smooth_scroll_2/text_scroll.dart';

class TabInfo {
  TabInfo({required this.text, required this.widget});
  String text;
  Widget widget;
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<TabInfo> _tabList;

  @override
  void initState() {
    super.initState();

    _tabList = <TabInfo>[
      TabInfo(
        text: '設定',
        widget: const SettingsPage(),
      ),
      TabInfo(
        text: 'テキスト',
        widget: const TextScrollPage(),
      ),
      TabInfo(
        text: '画像 (通常)',
        widget: const ImageScrollPage(),
      ),
      TabInfo(
        text: '画像 (遅延ローカル)',
        widget: const CacheImageScrollPage(),
      ),
      TabInfo(
        text: '画像 (遅延ぼかし)',
        widget: const CacheBlurImageScrollPage(),
      ),
    ];

    _tabController = TabController(length: _tabList.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
        bottom: TabBar(
          isScrollable: true,
          tabs: _tabList.map((TabInfo tab) {
            return Tab(text: tab.text);
          }).toList(),
          controller: _tabController,
          unselectedLabelColor: Colors.grey,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: _tabList.map((tab) => tab.widget).toList(),
      ),
    );
  }
}
