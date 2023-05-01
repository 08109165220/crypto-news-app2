import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'allnewsModel.dart';
import 'state.dart';

class All_NewsLogic extends GetxController {
  final All_NewsState state = All_NewsState();

  String link = "https://crypto-news16.p.rapidapi.com";
  Map<String, String> headers = {
  'X-RapidAPI-Key': '21e4e9aedcmsh20999f480d9c0f4p1950cdjsn55ce4effda1d',
  'X-RapidAPI-Host': 'crypto-news16.p.rapidapi.com'
  };
  Future<List<CoindeskModel >> getinformation() async {
    List<CoindeskModel > displaylist = [];
    Uri url = Uri.parse(link + "/news/top/5");
    http.Response response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      List<dynamic> alllist = jsonDecode(response.body);
      displaylist = alllist.map((e) => CoindeskModel.fromJson(e)).toList();
      return displaylist;
    } else {
      return displaylist;
    }
  }
}
