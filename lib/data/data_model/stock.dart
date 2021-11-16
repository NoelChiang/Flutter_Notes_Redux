class Stock {
  final String title;
  final List<String> fields;
  final List<List<String>> data;
  final String stat;
  String? defalutName;

  String get name => (stat == "OK" && title.split(" ").length > 2)
      ? title.split(" ")[2]
      : (stat != "OK" ? stat : defalutName ?? "");
  String get start => data.isNotEmpty ? data[0][3] : "0";
  String get high => data.isNotEmpty ? data[0][4] : "0";
  String get low => data.isNotEmpty ? data[0][5] : "0";
  String get end => data.isNotEmpty ? data[0][6] : "0";
  String get amount => data.isNotEmpty ? data[0][1] : "0";
  String get difference => data.isNotEmpty ? data[0][7] : "0";

  Stock.fromJson(json)
      : title = json["title"] ?? "",
        stat = json["stat"] ?? "",
        fields = json["stat"] == "OK" ? (json["fields"] as List<dynamic>).cast<String>() : [],
        data = json["stat"] == "OK"
            ? (json["data"] as List<dynamic>)
                .map((e) => (e as List<dynamic>).cast<String>())
                .toList()
            : [];

  Stock.empty()
      : title = "",
        fields = [],
        data = [],
        stat = "";
}
