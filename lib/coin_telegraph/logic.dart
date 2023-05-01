import 'dart:convert';

import 'package:get/get.dart';
import 'Models.dart';
import 'state.dart';
import 'package:http/http.dart' as http;

class CoinTelegraphLogic extends GetxController {
  final CoinTelegraphState state = CoinTelegraphState();


  String link = "https://crypto-news16.p.rapidapi.com";

  Map<String, String> headers = {
  'X-RapidAPI-Key': '21e4e9aedcmsh20999f480d9c0f4p1950cdjsn55ce4effda1d',
  'X-RapidAPI-Host': 'crypto-news16.p.rapidapi.com'
  };

  Future<List<CoinT_mods>> getinformation() async {
    List<CoinT_mods> displaylist = [];
    Uri url = Uri.parse(link + "/news/cointelegraph");
    http.Response response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      List<dynamic> alllist = jsonDecode(response.body);
      displaylist = alllist.map((e) => CoinT_mods.fromJson(e)).toList();
      return displaylist;
    } else {
      return displaylist;
    }
  }
}
