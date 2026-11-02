import 'package:flutter/material.dart';

void main() => runApp(const BmiApp());

class BmiApp extends StatelessWidget {
  const BmiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Experiment 10 - BMI calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
      ),
      home: const BmiPage(),
    );
  }
}

class BmiPage extends StatefulWidget {
  const BmiPage({super.key});

  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  final _formKey = GlobalKey<FormState>();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  double? _bmi;

  @override
  void dispose() {
    _weightController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  void _calculate() {
    if (!_formKey.currentState!.validate()) return;
    final weight = double.parse(_weightController.text);
    final heightMeters = double.parse(_heightController.text) / 100;
    setState(() => _bmi = weight / (heightMeters * heightMeters));
  }

  String get _category {
    final bmi = _bmi!;
    if (bmi < 18.5) return 'Below the usual range';
    if (bmi < 25) return 'Within the usual range';
    if (bmi < 30) return 'Above the usual range';
    return 'High range';
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('BMI Calculator')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Icon(Icons.monitor_weight_outlined, size: 64),
          const SizedBox(height: 8),
          const Text(
            'Body Mass Index',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _weightController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    labelText: 'Weight',
                    suffixText: 'kg',
                    border: OutlineInputBorder(),
                  ),
                  validator: _validatePositiveNumber,
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: _heightController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    labelText: 'Height',
                    suffixText: 'cm',
                    border: OutlineInputBorder(),
                  ),
                  validator: _validatePositiveNumber,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: _calculate,
            icon: const Icon(Icons.calculate_outlined),
            label: const Text('Calculate BMI'),
          ),
          if (_bmi case final bmi?) ...[
            const SizedBox(height: 20),
            Card(
              color: colorScheme.primaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text('Your BMI'),
                    Text(
                      bmi.toStringAsFixed(1),
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    Text(_category, style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'BMI is a screening estimate and is not a diagnosis. '
              'Talk to a health professional for personal advice.',
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }

  String? _validatePositiveNumber(String? value) {
    final number = double.tryParse(value ?? '');
    if (number == null || !number.isFinite || number <= 0) {
      return 'Enter a number greater than zero';
    }
    return null;
  }
}
