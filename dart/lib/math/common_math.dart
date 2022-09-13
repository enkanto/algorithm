/// Compute Greatest Common Divisor of two numbers.
int gcd(int a, int b) {
  if (b == 0) return a;
  return gcd(b, a % b);
}

/// Greatest Common Divisor of a list of numbers.
/// List must contain two or more non-zero numbers.
int gcdList(List<int> numbers) {
  if (numbers.length < 2) throw ArgumentError("Single Element Array");
  return numbers.reduce(gcd);
}

/// Least Common Multiple of two non-zero numbers.
int lcm(int a, int b) {
  if (b == 0) throw ArgumentError("Zero input");
  return a * b ~/ gcd(a, b);
}

/// Least Common Multiple of a list of numbers.
/// List must contain two or more non-zero numbers.
int lcmList(List<int> numbers) {
  if (numbers.length < 2) throw ArgumentError("Single Element Array");
  return numbers.reduce(lcm);
}

/// Factorial of n.
int factorial(int n) {
  if (n < 0) throw ArgumentError("Negative input");
  if (n <= 1) return 1;
  return n * factorial(n - 1);
  // return (n <= 1) ? 1 : 2.to(n + 1).reduce((a, b) => a * b);
}
