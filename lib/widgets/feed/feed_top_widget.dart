import 'package:flutter/material.dart';

class TopWidget extends StatefulWidget {
  const TopWidget({Key? key}) : super(key: key);

  @override
  State<TopWidget> createState() => _TopWidgetState();
}

class _TopWidgetState extends State<TopWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(80),
          child: Container(
            color: Colors.black,
            child: const Padding(
              padding: EdgeInsets.all(5),
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 19,
              ),
            ),
          ),
        ),
        const Icon(
          Icons.chat_rounded,
          color: Colors.grey,
        )
      ],
    );
  }
}
