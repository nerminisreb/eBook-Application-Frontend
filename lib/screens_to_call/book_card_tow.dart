import 'package:ebook/consttants.dart';
import 'package:flutter/material.dart';

class BookCardTwo extends StatelessWidget {
  BookCardTwo(
      {Key? key, this.image, this.title, this.subtitle, this.word, this.show})
      : super(key: key);

  String? image;
  String? title;
  String? subtitle;
  String? word;

  Function? show;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: kProgressIndicator,
    );
  }
}
