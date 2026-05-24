/// Model to represent a calculation result
class CalculationResult {
  final double result;
  final String expression;
  final DateTime timestamp;

  CalculationResult({
    required this.result,
    required this.expression,
    required this.timestamp,
  });

  @override
  String toString() => 'Result: $result, Expression: $expression';
}
