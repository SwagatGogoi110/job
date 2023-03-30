import 'package:flutter/material.dart';

class BookmarkIcon extends StatefulWidget {
  final bool isMarked;
  final Function(bool) onPressed;

  BookmarkIcon({required this.isMarked, required this.onPressed});

  @override
  _BookmarkIconState createState() => _BookmarkIconState();
}

class _BookmarkIconState extends State<BookmarkIcon> {
  bool _isMarked = false;

  @override
  void initState() {
    _isMarked = widget.isMarked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isMarked ? Icons.bookmark : Icons.bookmark_outline_outlined,
        color: _isMarked ? Theme.of(context).primaryColor : Colors.black,
      ),
      onPressed: () {
        setState(() {
          _isMarked = !_isMarked;
        });
        widget.onPressed(_isMarked);
      },
    );
  }
}
