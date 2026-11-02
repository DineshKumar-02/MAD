import 'package:flutter/material.dart';

void main() => runApp(const WidgetsApp());

class WidgetsApp extends StatelessWidget {
  const WidgetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Experiment 2 - Widgets and UI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WidgetsPage(),
    );
  }
}

class WidgetsPage extends StatefulWidget {
  const WidgetsPage({super.key});

  @override
  State<WidgetsPage> createState() => _WidgetsPageState();
}

class _WidgetsPageState extends State<WidgetsPage> {
  bool _notifications = true;
  double _fontSize = 18;
  String _name = '';

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Widgets & UI')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Text styles', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text(
            _name.isEmpty ? 'A custom font size: Flutter' : 'Hello, $_name!',
            style: TextStyle(
              fontSize: _fontSize,
              fontWeight: FontWeight.w600,
              color: colors.primary,
            ),
          ),
          Slider(
            value: _fontSize,
            min: 14,
            max: 32,
            divisions: 9,
            label: '${_fontSize.round()} px',
            onChanged: (value) => setState(() => _fontSize = value),
          ),
          const SizedBox(height: 8),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Your name',
              hintText: 'Enter a name',
              prefixIcon: Icon(Icons.person_outline),
              border: OutlineInputBorder(),
            ),
            onChanged: (value) => setState(() => _name = value.trim()),
          ),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Notifications'),
            value: _notifications,
            onChanged: (value) => setState(() => _notifications = value),
          ),
          Card(
            color: colors.secondaryContainer,
            child: const ListTile(
              leading: Icon(Icons.widgets_outlined),
              title: Text('Card + ListTile'),
              subtitle: Text('Material widgets with a themed color scheme.'),
              trailing: Icon(Icons.chevron_right),
            ),
          ),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Button pressed successfully')),
              );
            },
            icon: const Icon(Icons.touch_app),
            label: const Text('Show snackbar'),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            children: [
              Chip(
                avatar: const Icon(Icons.palette_outlined, size: 18),
                label: Text('Primary ${colors.primary}'),
              ),
              const Chip(label: Text('Material 3')),
            ],
          ),
        ],
      ),
    );
  }
}
