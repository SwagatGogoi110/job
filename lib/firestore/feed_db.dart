import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../global_variables.dart';

class FeedInformation extends StatefulWidget {
  @override
  _FeedInformationState createState() => _FeedInformationState();
}

class _FeedInformationState extends State<FeedInformation> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('feed').orderBy('date_field',descending: true).snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return ListView(
          physics:const ClampingScrollPhysics(),
          shrinkWrap: true,
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(80),
                          child: Container(
                            height: 30,
                            width: 30,
                            color: Colors.black,
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(data['owner'][0] as String,textAlign: TextAlign.center, style: displayNameStyle,)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: <Widget>[
                                Text(
                                  data['owner'] as String,
                                  style: feedHeader,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                data['isVerified'] ?
                                    const Icon(
                                      Icons.verified_outlined,
                                      size: 18,
                                      color: Colors.blue,
                                    ): const SizedBox(height: 1)
                              ],
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              data['content'] as String,
                              softWrap: false,
                              maxLines: 20,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Divider()
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
