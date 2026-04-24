class BaseResponseModel<T> {
  final T? data;
  final String? message;
  final String? error;

  BaseResponseModel({this.data, this.message, this.error});

  factory BaseResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) fromJsonT,
  ) {
    return BaseResponseModel<T>(
      data: json['data'] != null ? fromJsonT(json['data']) : null,
      message: json['message'],
      error: json['error'],
    );
  }

  bool isSuccess() {
    return error == null;
  }
}
