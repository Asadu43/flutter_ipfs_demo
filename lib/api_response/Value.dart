import 'Files.dart';
import 'Pin.dart';

class Value {
  String? cid;
  String? created;
  String? type;
  String? scope;
  List<Files>? files;
  int? size;
  String? name;
  Pin? pin;
  List<dynamic>? deals;

  Value({
    this.cid,
    this.created,
    this.type,
    this.scope,
    this.files,
    this.size,
    this.name,
    this.pin,
    this.deals,
  });

  Value.fromJson(dynamic json) {
    cid = json['cid'];
    created = json['created'];
    type = json['type'];
    scope = json['scope'];
    if (json['files'] != null) {
      files = [];
      json['files'].forEach((v) {
        files?.add(Files.fromJson(v));
      });
    }
    size = json['size'];
    name = json['name'];
    pin = json['pin'] != null ? Pin.fromJson(json['pin']) : null;
    if (json['deals'] != null) {
      deals = [];
      json['deals'].forEach((v) {
        deals?.add(v);
      });
    }
  }
}
