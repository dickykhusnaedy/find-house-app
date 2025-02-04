import 'dart:convert' as convert;

import 'package:find_house_app/models/recomendation_space_model.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class SpaceProvider extends ChangeNotifier {
  getRecomendedSpace() async {
    var url = Uri.https(
        'bwa-cozy-api-i9vx.vercel.app', '/recommended-spaces', {'q': '{http}'});

    var response = await http.get(url);

    if (response.statusCode == 200) {
      List jsonResponse = convert.jsonDecode(response.body);
      List<RecomendationSpaceModel> spaces = jsonResponse
          .map((item) => RecomendationSpaceModel.fromJson(item))
          .toList();

      return spaces;
    } else {
      return <RecomendationSpaceModel>[];
    }
  }
}
