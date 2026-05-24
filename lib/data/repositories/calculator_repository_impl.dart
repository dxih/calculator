import '../../domain/models/calculation_result.dart';
import '../../domain/repositories/calculator_repository.dart';
import '../datasources/calculator_local_datasource.dart';

/// Implementation of CalculatorRepository
class CalculatorRepositoryImpl implements CalculatorRepository {
  final CalculatorLocalDataSource localDataSource;

  CalculatorRepositoryImpl({required this.localDataSource});

  @override
  Future<CalculationResult> evaluate(String expression) {
    return localDataSource.evaluate(expression);
  }

  @override
  Future<List<CalculationResult>> getHistory() {
    return localDataSource.getHistory();
  }

  @override
  Future<void> clearHistory() {
    return localDataSource.clearHistory();
  }
}
