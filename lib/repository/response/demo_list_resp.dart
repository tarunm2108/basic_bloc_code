// To parse this JSON data, do
//
//     final demoListResp = demoListRespFromJson(jsonString);

import 'dart:convert';

DemoListResp demoListRespFromJson(String str) => DemoListResp.fromJson(json.decode(str));

String demoListRespToJson(DemoListResp data) => json.encode(data.toJson());

class DemoListResp {
  DemoListResp({
    this.count,
    this.entries,
  });

  final int? count;
  final List<Entry>? entries;

  factory DemoListResp.fromJson(Map<String, dynamic> json) => DemoListResp(
    count: json["count"],
    entries: json["entries"] == null ? [] : List<Entry>.from(json["entries"]!.map((x) => Entry.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "entries": entries == null ? [] : List<dynamic>.from(entries!.map((x) => x.toJson())),
  };
}

class Entry {
  Entry({
    this.api,
    this.description,
    this.auth,
    this.https,
    this.cors,
    this.link,
    this.category,
  });

  final String? api;
  final String? description;
  final String? auth;
  final bool? https;
  final String? cors;
  final String? link;
  final String? category;

  factory Entry.fromJson(Map<String, dynamic> json) => Entry(
    api: json["API"],
    description: json["Description"],
    auth: json["Auth"],
    https: json["HTTPS"],
    cors: json["Cors"],
    link: json["Link"],
    category: json["Category"],
  );

  Map<String, dynamic> toJson() => {
    "API": api,
    "Description": description,
    "Auth": auth,
    "HTTPS": https,
    "Cors": cors,
    "Link": link,
    "Category": category,
  };
}
