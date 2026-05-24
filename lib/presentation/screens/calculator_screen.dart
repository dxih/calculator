import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/calculator_provider.dart';
import '../widgets/calculator_button.dart';
import '../widgets/history_panel.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CalculatorProvider>().initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        elevation: 0,
      ),
      body: Consumer<CalculatorProvider>(
        builder: (context, provider, _) {
          return Row(
            children: [
              // Calculator
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Display
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              provider.expression,
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            if (provider.error != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  provider.error!,
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Buttons
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 4,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          children: [
                            CalculatorButton(
                              label: 'C',
                              onPressed: () => provider.clear(),
                              isOperator: true,
                            ),
                            CalculatorButton(
                              label: 'DEL',
                              onPressed: () => provider.backspace(),
                              isOperator: true,
                            ),
                            CalculatorButton(
                              label: '÷',
                              onPressed: () => provider.appendToExpression('/'),
                              isOperator: true,
                            ),
                            CalculatorButton(
                              label: '×',
                              onPressed: () => provider.appendToExpression('*'),
                              isOperator: true,
                            ),
                            // Numbers
                            for (var i = 7; i <= 9; i++)
                              CalculatorButton(
                                label: i.toString(),
                                onPressed: () => provider.appendToExpression(i.toString()),
                              ),
                            CalculatorButton(
                              label: '−',
                              onPressed: () => provider.appendToExpression('-'),
                              isOperator: true,
                            ),
                            for (var i = 4; i <= 6; i++)
                              CalculatorButton(
                                label: i.toString(),
                                onPressed: () => provider.appendToExpression(i.toString()),
                              ),
                            CalculatorButton(
                              label: '+',
                              onPressed: () => provider.appendToExpression('+'),
                              isOperator: true,
                            ),
                            for (var i = 1; i <= 3; i++)
                              CalculatorButton(
                                label: i.toString(),
                                onPressed: () => provider.appendToExpression(i.toString()),
                              ),
                            CalculatorButton(
                              label: '=',
                              onPressed: () => provider.evaluate(),
                              isOperator: true,
                            ),
                            CalculatorButton(
                              label: '0',
                              onPressed: () => provider.appendToExpression('0'),
                            ),
                            CalculatorButton(
                              label: '.',
                              onPressed: () => provider.appendToExpression('.'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // History Panel
              Expanded(
                flex: 1,
                child: HistoryPanel(provider: provider),
              ),
            ],
          );
        },
      ),
    );
  }
}
