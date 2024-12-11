class ServerpodException implements Exception {
  final String errorMessage;
  ServerpodException(this.errorMessage);
  @override
  String toString() {
    return "An error occured: $errorMessage";
  }
}
