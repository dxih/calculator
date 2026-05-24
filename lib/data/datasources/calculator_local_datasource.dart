import '../../domain/models/calculation_result.dart';

/// Local data source for calculator operations
abstract class CalculatorLocalDataSource {
  Future<CalculationResult> evaluate(String expression);
  Future<List<CalculationResult>> getHistory();
  Future<void> clearHistory();
}

/// Implementation of local data source
class CalculatorLocalDataSourceImpl implements CalculatorLocalDataSource {
  final List<CalculationResult> _history = [];

  @override
  Future<CalculationResult> evaluate(String expression) async {
    try {
      final result = _evaluateExpression(expression);
      final calculationResult = CalculationResult(
        result: result,
        expression: expression,
        timestamp: DateTime.now(),
      );
      _history.add(calculationResult);
      return calculationResult;
    } catch (e) {
      throw Exception('Invalid expression: $expression');
    }
  }

  @override
  Future<List<CalculationResult>> getHistory() async {
    return List.from(_history.reversed);
  }

  @override
  Future<void> clearHistory() async {
    _history.clear();
  }

  /// Simple expression evaluator using Dart's built-in capabilities
  double _evaluateExpression(String expression) {
    // Remove whitespace
    String sanitized = expression.replaceAll(' ', '');

    // Use a simple calculator logic
    return _parse(sanitized);
  }

  double _parse(String expression) {
    return _parseAddition(expression, 0).value;
  }

  _Result _parseAddition(String expr, int start) {
    var result = _parseMultiplication(expr, start);
    var pos = result.pos;

    while (pos < expr.length && (expr[pos] == '+' || expr[pos] == '-')) {
      var op = expr[pos];
      var next = _parseMultiplication(expr, pos + 1);
      result.value = op == '+' ? result.value + next.value : result.value - next.value;
      pos = next.pos;
    }

    return _Result(result.value, pos);
  }

  _Result _parseMultiplication(String expr, int start) {
    var result = _parseNumber(expr, start);
    var pos = result.pos;

    while (pos < expr.length && (expr[pos] == '*' || expr[pos] == '/')) {
      var op = expr[pos];
      var next = _parseNumber(expr, pos + 1);
      result.value = op == '*' ? result.value * next.value : result.value / next.value;
      pos = next.pos;
    }

    return _Result(result.value, pos);
  }

  _Result _parseNumber(String expr, int start) {
    var pos = start;
    var isNegative = false;

    if (pos < expr.length && expr[pos] == '-') {
      isNegative = true;
      pos++;
    }

    var numStart = pos;
    var hasDecimal = false;

    while (pos < expr.length) {
      var char = expr[pos];
      if (char.codeUnitAt(0) >= '0'.codeUnitAt(0) && char.codeUnitAt(0) <= '9'.codeUnitAt(0)) {
        pos++;
      } else if (char == '.' && !hasDecimal) {
        hasDecimal = true;
        pos++;
      } else {
        break;
      }
    }

    var numStr = expr.substring(numStart, pos);
    var value = double.parse(numStr);

    return _Result(isNegative ? -value : value, pos);
  }
}

class _Result {
  double value;
  int pos;

  _Result(this.value, this.pos);
}
