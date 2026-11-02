import 'package:flutter/material.dart';

void main() => runApp(const SetupApp());

class SetupApp extends StatelessWidget {
  const SetupApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Experiment 1 - Flutter setup',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const SetupPage(),
    );
  }
}

class SetupPage extends StatelessWidget {
  const SetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    const steps = [
      ('Flutter SDK', 'Install Flutter and add its bin folder to PATH.'),
      ('Android Studio', 'Install Android SDK and create an emulator.'),
      ('Kotlin / Gradle', 'Flutter Android projects use Kotlin and Gradle.'),
      ('Verify setup', 'Run flutter doctor, then flutter run.'),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Experiment 1: Setup')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: const Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.phone_android, size: 40),
                  SizedBox(height: 12),
                  Text(
                    'Flutter + Kotlin',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'A cross-platform Flutter UI runs on the Android platform '
                    'through its Kotlin/Gradle host project.',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          for (var i = 0; i < steps.length; i++)
            Card(
              child: ListTile(
                leading: CircleAvatar(child: Text('${i + 1}')),
                title: Text(steps[i].$1),
                subtitle: Text(steps[i].$2),
                trailing: const Icon(Icons.check_circle_outline),
              ),
            ),
          const SizedBox(height: 8),
          const SelectableText(
            'Useful commands\n'
            'flutter doctor\n'
            'flutter devices\n'
            'flutter run',
            style: TextStyle(fontFamily: 'monospace', height: 1.6),
          ),
        ],
      ),
    );
  }
}
