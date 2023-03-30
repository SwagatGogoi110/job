import 'package:flutter/material.dart';
import '../../global_variables.dart';
class NewsNavigationTop extends StatefulWidget {
  const NewsNavigationTop({Key? key}) : super(key: key);

  @override
  State<NewsNavigationTop> createState() => _NewsNavigationTopState();
}

class _NewsNavigationTopState extends State<NewsNavigationTop> with SingleTickerProviderStateMixin{
  late final TabController controller;

  @override
  void initState() {
    controller = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      labelPadding:const EdgeInsets.symmetric(horizontal: 25),
      controller: controller,
      unselectedLabelColor: Colors.grey,
      labelColor: Colors.blue,
      labelStyle: newsTapBarStyle,
      onTap: (index) {},
      tabs: const [
        Tab(text: 'For You',),
        Tab(text: 'News',),
        Tab(text: 'Entertainment',),
        Tab(text: 'Sports',),
        Tab(text:'Hello')
      ],
    );
  }
}
