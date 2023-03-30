import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FloatingBtn extends StatefulWidget {
  const FloatingBtn({Key? key}) : super(key: key);

  @override
  State<FloatingBtn> createState() => _FloatingBtnState();
}

class _FloatingBtnState extends State<FloatingBtn> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor:const Color(0xff039BE5),
        elevation: 0,
        child:const Icon(Icons.add, color: Colors.white, size: 30,),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CreateTweet()));
        });
  }
}

class CreateTweet extends ConsumerStatefulWidget {
  const CreateTweet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateTweetState();
}

class _CreateTweetState extends ConsumerState<CreateTweet> {
  final tweetTextController = TextEditingController();
  final CollectionReference tweetsCollection =
      FirebaseFirestore.instance.collection('feed');

  void shareTweet() {
    final tweet = {
      'isVerified':true,
      'content': tweetTextController.text,
      'owner':'Kaustav',
      'date_field':DateTime.now()
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
          Navigator.of(context).pop();
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.send),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  const SizedBox(width: 10),
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage:NetworkImage('https://raw.githubusercontent.com/SwagatGogoi110/job/main/assets/images/avatar.png'),
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
