class BasicResponseModel<T>{
  bool success;
  String message;
  T? data;
  int statusCode;
  dynamic error;

  BasicResponseModel({
    required this.success,
    required this.message,
    this.data,
    required this.statusCode,
    this.error,
  });
  factory BasicResponseModel.fromJson(Map<String, dynamic> json) {
    return BasicResponseModel(
      success: json['success'],
      message: json['message'],
      data: json['data'],
      statusCode: json['statusCode'],
      error: json['error'],
    );
  }

}
