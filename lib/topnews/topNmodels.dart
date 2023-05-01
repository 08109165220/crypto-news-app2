class TopNewsMods {
  String? title;
  String? description;
  String? url;
  String? date;

  TopNewsMods({this.title, this.description, this.url, this.date});

  TopNewsMods.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    url = json['url'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['url'] = this.url;
    data['date'] = this.date;
    return data;
  }
}
