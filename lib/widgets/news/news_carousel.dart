import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class NewsCarousel extends StatefulWidget {
  const NewsCarousel({Key? key}) : super(key: key);

  @override
  State<NewsCarousel> createState() => _NewsCarouselState();
}

class _NewsCarouselState extends State<NewsCarousel> {
  List imageList = <String>[
    "https://images.unsplash.com/photo-1618053448492-2b629c2c912c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2080&q=80",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqWydwNr9rWwIbqtj9ZNy7Zi4AwLQadwhKijAbtYkwHq5iaHRQzXuS_a_Z2mlUNoD1f-o&usqp=CAU",
    "https://images.squarespace-cdn.com/content/v1/5f402a9d4e121b7f850b4374/1598040807777-VG51W3LHXTZ73MSFJJF5/image-asset.jpeg?format=1000w"
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: 200.0),
      items: imageList.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                child:ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image(
                    fit: BoxFit.cover,
                    image:NetworkImage(i),
                  ),
                )
            );
          },
        );
      }).toList(),
    );
  }
}
