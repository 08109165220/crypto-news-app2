import 'dart:convert';
import 'package:cryptonewsm2/topnews/topNmodels.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'state.dart';

class TopnewsLogic extends GetxController {
  final TopnewsState state = TopnewsState();

  String link = "https://crypto-news16.p.rapidapi.com";

  Map<String, String> headers = {
  'X-RapidAPI-Key': '21e4e9aedcmsh20999f480d9c0f4p1950cdjsn55ce4effda1d',
  'X-RapidAPI-Host': 'crypto-news16.p.rapidapi.com'
  };

  Future<List<TopNewsMods>> getinformation() async {
    List<TopNewsMods> displaylist = [];
    Uri url = Uri.parse(link + "/news/coindesk");
    http.Response response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      List<dynamic> alllist = jsonDecode(response.body);
      displaylist = alllist.map((e) => TopNewsMods.fromJson(e)).toList();
      return displaylist;
    } else {
      return displaylist;
    }
  }
}
