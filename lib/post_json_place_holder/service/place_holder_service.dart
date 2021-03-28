import 'dart:convert';
import 'dart:io';

import 'package:acmweek3/core/enum/service_path_enum.dart';
import 'package:acmweek3/post_json_place_holder/model/post_model.dart';
import 'package:http/http.dart' as http;

class PlaceHolderService {
  Future<List<PostModel>?> fetchPostItems() async {
    final url = Uri.parse(
        '${ServicePathEnum.BASE_URL.rawValue}${ServicePathEnum.POST.rawValue}');
    final response = await http.get(url);

    switch (response.statusCode) {
      case HttpStatus.ok:
        final reponseBody = jsonDecode(response.body); //donen string response u objeye cevirir
        if (reponseBody is List) {
          return reponseBody.map((e) => PostModel.fromJson(e)).toList();
        }
        return [];
      default:
        return null;
    }
  }
}
