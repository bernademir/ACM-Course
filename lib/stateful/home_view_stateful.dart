import 'package:acmweek3/core/enum/duration_enum.dart';
import 'package:acmweek3/core/constrants/image_manager.dart';
import 'package:acmweek3/core/model/user.dart';
import 'package:acmweek3/stateless/home_detail_stateless.dart';
import 'package:acmweek3/widget/card/user_card.dart';
import 'package:acmweek3/widget/opacity/image_opacity.dart';
import 'package:flutter/material.dart';


class HomeViewStatefull extends StatefulWidget {
  @override
  _HomeViewStatefullState createState() => _HomeViewStatefullState();
}

class _HomeViewStatefullState extends State<HomeViewStatefull> {
  bool _isLoading = true;
  late final ImageManager imageManager;
  late final User user;

  @override
  void initState() {
    super.initState();
    _waitForLoaoding();
    imageManager = ImageManager();
    user = User.fakeItem();
  }

  Future<void> _waitForLoaoding() async {
    await Future.delayed(DurationEnums.NORMAL.time);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          _isLoading ? CircularProgressIndicator() : FlutterLogo(),
          ImageOpacity(url: imageManager.randomImage),
          UserCard(
              user: user,
              onPressed: () {
                _navigateDetail();
              })
        ],
      ),
    );
  }

  void _navigateDetail() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => HomeDetailStateless(userModel: user),
    ));
  }
}