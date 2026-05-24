import '../models/calculation_result.dart';

/// Abstract repository for calculator operations
abstract class CalculatorRepository {
  /// Evaluate a mathematical expression
  Future<CalculationResult> evaluate(String expression);

  /// Get calculation history
  Future<List<CalculationResult>> getHistory();

  /// Clear calculation history
  Future<void> clearHistory();
}
