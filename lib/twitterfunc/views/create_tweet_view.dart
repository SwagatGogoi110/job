import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobfind/screens/home/home.dart';
import 'package:jobfind/twitterfunc/views/feed_screen.dart';

class CreateTweet extends ConsumerStatefulWidget {
  const CreateTweet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateTweetState();
}

class _CreateTweetState extends ConsumerState<CreateTweet> {
  final tweetTextController = TextEditingController();
  final CollectionReference tweetsCollection =
      FirebaseFirestore.instance.collection('tweets');

  void shareTweet() {
    final tweet = {
      'text': tweetTextController.text,
      'timestamp': Timestamp.now(),
    };
    tweetsCollection.add(tweet);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Share Your Feelings'),
        backgroundColor:
            const Color.fromARGB(255, 66, 176, 183).withOpacity(0.3),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.close, size: 30),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          shareTweet();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const HomePage()));
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.send),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.image),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.gif),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.bar_chart),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.poll),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.sentiment_satisfied_alt),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.schedule),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const FeedScreen()));
                    },
                    icon: const Icon(Icons.feed_outlined),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  const SizedBox(width: 10),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        Image.asset('assets/images/avatar.png').image,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: tweetTextController,
                      decoration: const InputDecoration(
                        hintText: 'What\'s happening?',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
