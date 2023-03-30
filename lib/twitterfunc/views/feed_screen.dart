import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  Stream<QuerySnapshot> getTweets() {
    return FirebaseFirestore.instance.collection('tweets').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: getTweets(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Error loading tweets');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final tweets = snapshot.data!.docs;

          return ListView.builder(
            itemCount: tweets.length,
            itemBuilder: (context, index) {
              final tweet = tweets[index];
              final text = tweet['text'] as String;
              final timestamp = tweet['timestamp'] as Timestamp;

              return ListTile(
                title: Text(text),
                subtitle: Text(timestamp.toDate().toString()),
              );
            },
          );
        },
      ),
    );
  }
}
