class Failure {
  final String errMessage;

  Failure([this.errMessage = "An unknown error occurred"]); // Default message

  @override
  String toString() => errMessage;
}
