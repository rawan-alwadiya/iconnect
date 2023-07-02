
class ProcessResponse<T>{
  final String message;
  final bool success;
  String? code;
  T? object;

  ProcessResponse({
    required this.message,
    required this.success,
    this.code,
    this.object
});

}