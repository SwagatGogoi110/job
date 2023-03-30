import 'package:flutter/material.dart';
import "../../global_variables.dart";
class FeaturedNews extends StatelessWidget {
  const FeaturedNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding:const EdgeInsets.all(10),
         child: Row(
            children: <Widget>[
               SizedBox(
                width: 90,
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child:const Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1633329712165-4e578376eb87?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80')),

                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 10, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: newsTagBackgroundColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child:const Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Text('Productivity', style: newsTagStyle,),
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Expanded(
                          child: Text(
                            'A New Initiative to Boost Female Entrepreneurship',
                            style: newsListHeader,
                            softWrap: false,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:const<Widget> [
                          Text('23|12|2022'),
                          Text('2 min'),
                          Icon(Icons.bookmark_border_outlined, size: 17,)
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}
