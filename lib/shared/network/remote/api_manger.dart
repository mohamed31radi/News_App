import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_app/models/NewsDataModel.dart';
import 'package:news_app/models/Sources_response.dart';
import 'package:news_app/shared/component/show_loading_component.dart';

import '../../constants/constants.dart';

class ApiManger {
  static Future<SourcesResponse> getSources() async {
    var url =
        Uri.https(uriBase, '/v2/top-headlines/sources', {"apiKey": apikey});
    try {
      Response sources = await http.get(url);
      var json = jsonDecode(sources.body);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      return sourcesResponse;
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsDataModel> getNewsData(String sourceId) async {
    var uri = Uri.https(
        uriBase, '/v2/everything', {"apiKey": apikey, "sources": sourceId});
    Response response = await http.get(uri);
    var json = jsonDecode(response.body);
    NewsDataModel newsDataModel = NewsDataModel.fromJson(json);
    return newsDataModel;
  }
}
