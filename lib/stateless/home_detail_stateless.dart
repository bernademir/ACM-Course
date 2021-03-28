import 'package:acmweek3/core/model/user.dart';
import 'package:acmweek3/widget/scroll/scroll_bar_single.dart';
import 'package:flutter/material.dart';

class HomeDetailStateless extends StatelessWidget {
  final User userModel;

  HomeDetailStateless({Key? key, required this.userModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(userModel.title)),
      body: ScrollBarSingle(child: Text(userModel.storyText)),
    );
  }
}
