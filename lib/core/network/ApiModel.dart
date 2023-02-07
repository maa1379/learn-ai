class ApiResult {
  bool? isDone;
  String? requestedMethod;
  dynamic data;
  String? message;
  var statusCode;

  ApiResult({
    this.isDone,
    this.requestedMethod,
    this.data,
    this.message,
    this.statusCode,
  });
}