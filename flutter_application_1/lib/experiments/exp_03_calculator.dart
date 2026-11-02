import 'package:flutter/material.dart';

void main() => runApp(const CalculatorApp());

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Experiment 3 - Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _display = '0';
  double? _firstOperand;
  String? _operator;
  bool _replaceDisplay = false;

  void _press(String key) {
    setState(() {
      if (key == 'C') {
        _display = '0';
        _firstOperand = null;
        _operator = null;
        _replaceDisplay = false;
      } else if (key == 'DEL') {
        _display = _display.length > 1 ? _display.substring(0, _display.length - 1) : '0';
      } else if (key == '+' || key == '−' || key == '×' || key == '÷') {
        _firstOperand = double.tryParse(_display);
        _operator = key;
        _replaceDisplay = true;
      } else if (key == '=') {
        _calculate();
      } else {
        if (_replaceDisplay) {
          _display = key == '.' ? '0.' : key;
          _replaceDisplay = false;
        } else if (key == '.') {
          if (!_display.contains('.')) _display += '.';
        } else {
          _display = _display == '0' ? key : '$_display$key';
        }
      }
    });
  }

  void _calculate() {
    final first = _firstOperand;
    final second = double.tryParse(_display);
    final operator = _operator;
    if (first == null || second == null || operator == null) return;

    final result = switch (operator) {
      '+' => first + second,
      '−' => first - second,
      '×' => first * second,
      '÷' => second == 0 ? null : first / second,
      _ => null,
    };

    _display = result == null
        ? 'Cannot divide by zero'
        : result == result.roundToDouble()
        ? result.toInt().toString()
        : result.toStringAsPrecision(8);
    _firstOperand = null;
    _operator = null;
    _replaceDisplay = true;
  }

  @override
  Widget build(BuildContext context) {
    const keys = [
      'C', 'DEL', '÷', '×',
      '7', '8', '9', '−',
      '4', '5', '6', '+',
      '1', '2', '3', '=',
      '0', '.', '', '',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Calculator')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    reverse: true,
                    child: Text(
                      _display,
                      key: const ValueKey('calculator-display'),
                      style: const TextStyle(fontSize: 48, fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                flex: 3,
                child: GridView.count(
                  crossAxisCount: 4,
                  childAspectRatio: 1.25,
                  children: [
                    for (final key in keys)
                      if (key.isEmpty)
                        const SizedBox.shrink()
                      else
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: FilledButton.tonal(
                            onPressed: () => _press(key),
                            child: Text(key, style: const TextStyle(fontSize: 22)),
                          ),
                        ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
