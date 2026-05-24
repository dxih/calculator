import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/datasources/calculator_local_datasource.dart';
import 'data/repositories/calculator_repository_impl.dart';
import 'domain/repositories/calculator_repository.dart';
import 'presentation/providers/calculator_provider.dart';
import 'presentation/screens/calculator_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: MultiProvider(
        providers: [
          Provider<CalculatorLocalDataSource>(
            create: (_) => CalculatorLocalDataSourceImpl(),
          ),
          Provider<CalculatorRepository>(
            create: (context) => CalculatorRepositoryImpl(
              localDataSource: context.read<CalculatorLocalDataSource>(),
            ),
          ),
          ChangeNotifierProvider<CalculatorProvider>(
            create: (context) => CalculatorProvider(
              repository: context.read<CalculatorRepository>(),
            ),
          ),
        ],
        child: const CalculatorScreen(),
      ),
    );
  }
}
