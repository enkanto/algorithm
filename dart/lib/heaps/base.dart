/// Custom [Error] that's thrown whenever the index is invalid.
class InvalidIndexError extends Error {
  @override
  String toString() => "Invalid Index for this operation";
}
