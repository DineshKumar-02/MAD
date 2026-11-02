import 'package:flutter/material.dart';

void main() => runApp(const PushDemoApp());

class PushDemoApp extends StatelessWidget {
  const PushDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Experiment 8 - Push notifications',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const NotificationsPage(),
    );
  }
}

class DemoNotice {
  const DemoNotice(this.title, this.body, this.time);

  final String title;
  final String body;
  final String time;
}

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final List<DemoNotice> _notices = [
    const DemoNotice(
      'Welcome',
      'This inbox demonstrates the layout for received notifications.',
      'Just now',
    ),
  ];

  void _simulatePush() {
    setState(() {
      _notices.insert(
        0,
        DemoNotice(
          'Sample push message',
          'A simulated message was added to the in-app inbox.',
          TimeOfDay.now().format(context),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Push Notifications'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(child: Badge(label: Text('${_notices.length}'), child: const Icon(Icons.notifications))),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            color: Theme.of(context).colorScheme.tertiaryContainer,
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Demo mode: messages are simulated in this app. '
                'A real push service needs Firebase configuration and a sender.',
              ),
            ),
          ),
          const SizedBox(height: 8),
          for (final notice in _notices)
            Card(
              child: ListTile(
                leading: const CircleAvatar(child: Icon(Icons.notifications_active_outlined)),
                title: Text(notice.title),
                subtitle: Text(notice.body),
                trailing: Text(notice.time, style: Theme.of(context).textTheme.labelSmall),
              ),
            ),
          if (_notices.isEmpty)
            const Padding(
              padding: EdgeInsets.all(24),
              child: Center(child: Text('No notifications yet.')),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _simulatePush,
        icon: const Icon(Icons.send),
        label: const Text('Simulate push'),
      ),
    );
  }
}
