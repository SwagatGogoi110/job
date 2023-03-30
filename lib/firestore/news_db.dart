import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../global_variables.dart';

class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final db = FirebaseFirestore.instance;
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('news').snapshots();

  Future<void> setBookmark(String id) async {
    final docCollection = await db.collection('news').doc(id).get();
    bool currentBookMark = docCollection['bookmark'] as bool;
    bool newBookmark=!currentBookMark;
    db.collection('news').doc(id).update({'bookmark': newBookmark});
  }

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
            return SizedBox(
              height: 130,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                  padding: const EdgeInsets.only(
                      left: 0, top: 10, bottom: 10, right: 10),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 90,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image(
                              fit: BoxFit.cover,
                              image: NetworkImage(data['imgURL'] as String)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, top: 10, bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  color: newsTagBackgroundColor,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Text(
                                    data['tags'] as String,
                                    style: newsTagStyle,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 6),
                              Expanded(
                                  child: Text(
                                data['title'] as String,
                                style: newsListHeader,
                                softWrap: false,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              )),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    data['date'] as String,
                                    style: newsTimeStyle,
                                  ),
                                  Text(
                                    '${data['readTime'] as String} mins',
                                    style: newsTimeStyle,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      await setBookmark(document.id);
                                    },
                                    child: data['bookmark'] as bool
                                        ? const Icon(
                                            Icons.bookmark,
                                            color: Colors.amber,
                                            size: 18,
                                          )
                                        : const Icon(
                                            Icons.bookmark_border_outlined,
                                            size: 18,
                                          ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
            );
          }).toList(),
        );
      },
    );
  }
}
