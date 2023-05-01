import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'Models.dart';
import 'state.dart';

class YahooFinanceLogic extends GetxController {
  final YahooFinanceState state = YahooFinanceState();


  String link = "https://crypto-news16.p.rapidapi.com";

  Map<String, String> headers ={
  'X-RapidAPI-Key': '21e4e9aedcmsh20999f480d9c0f4p1950cdjsn55ce4effda1d',
  'X-RapidAPI-Host': 'crypto-news16.p.rapidapi.com'
  };

  Future<List<YahooMods>> getinformation() async {
    List<YahooMods> displaylist = [];
    Uri url = Uri.parse(link + "/news/yahoo");
    http.Response response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      List<dynamic> alllist = jsonDecode(response.body);
      displaylist = alllist.map((e) => YahooMods.fromJson(e)).toList();
      return displaylist;
    } else {
      return displaylist;
    }
  }
}
