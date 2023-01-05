class Files {
  String? name;
  String? type;
  Files({
    this.name,
    this.type,
  });

  Files.fromJson(dynamic json) {
    name = json['name'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['type'] = type;
    return map;
  }
}
