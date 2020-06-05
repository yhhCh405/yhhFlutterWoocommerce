/// Use this class to catch Error
class WooError {
  String message;
  String code;
  int statusCode;

  WooError({this.message});

  /// Use this class to catch Error
  WooError.fromJSON(dynamic json) {
    this.message = json['message'];
    this.code = json['code'];
    this.statusCode = json['data']['status'];
  }
}
