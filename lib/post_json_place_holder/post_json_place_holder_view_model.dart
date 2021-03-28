import 'package:acmweek3/post_json_place_holder/post_json_place_holder.dart';
import 'package:acmweek3/post_json_place_holder/service/place_holder_service.dart';
import 'package:flutter/material.dart';

import 'model/post_model.dart';

abstract class PostJsonPlaceHolderViewModel extends State<PostJsonPlaceHolder> {
  bool isLoading = true;
  final PlaceHolderService placeHolderService = PlaceHolderService();
  List<PostModel?>? postItems;

  @override
  void initState() {
    super.initState();
    fetchAllDatas();
  }

  Future<void> fetchAllDatas() async {
    try {
      final response = await placeHolderService.fetchPostItems();
      postItems = response;
    } catch (e) {}
    _changeLoading();
  }

  void _changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}