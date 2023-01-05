import 'Value.dart';

class GetApiResponse {
  bool? ok;
  List<Value>? value;

  GetApiResponse({
    this.ok,
    this.value,
  });

  GetApiResponse.fromJson(dynamic json) {
    ok = json['ok'];
    if (json['value'] != null) {
      value = [];
      json['value'].forEach((v) {
        value?.add(Value.fromJson(v));
      });
    }
  }
}
