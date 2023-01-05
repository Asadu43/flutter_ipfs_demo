class Pin {
  Pin({
    this.cid,
    this.created,
    this.size,
    this.status,
  });

  Pin.fromJson(dynamic json) {
    cid = json['cid'];
    created = json['created'];
    size = json['size'];
    status = json['status'];
  }
  String? cid;
  String? created;
  int? size;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cid'] = cid;
    map['created'] = created;
    map['size'] = size;
    map['status'] = status;
    return map;
  }
}
