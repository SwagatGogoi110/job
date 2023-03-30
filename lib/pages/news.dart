import 'package:flutter/material.dart';
import "../widgets/news/news_widget.dart";
import '../widgets/news/news_carousel.dart';
import '../widgets/news/news_navigation.dart';
import "../global_variables.dart";
import '../firestore/news_db.dart';
class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const NewsNavigationTop(),
        const SizedBox(height: 30,),
        const NewsCarousel(),
        const SizedBox(height: 40,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  <Widget>[
              const Text(
                'Latest News',
                style: pageHeaders,
              ),
              const SizedBox(height: 10),
              UserInformation()
            ],
          ),
        )
      ],
    );
  }
}
