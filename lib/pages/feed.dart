import 'package:flutter/material.dart';
import '../firestore/feed_db.dart';
import '../widgets/feed/feed_top_widget.dart';
class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics:const ClampingScrollPhysics(),
      child: Padding(
        padding:const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const SizedBox(height: 8,),
            const TopWidget(),
            const SizedBox(height: 20),
            FeedInformation(),
          ],
        ),
      ),
    );
  }
}
