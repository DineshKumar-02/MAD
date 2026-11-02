import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const HttpDemoApp());

class HttpDemoApp extends StatelessWidget {
  const HttpDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Experiment 6 - HTTP service',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HttpDemoPage(),
    );
  }
}

class HttpDemoPage extends StatefulWidget {
  const HttpDemoPage({super.key});

  @override
  State<HttpDemoPage> createState() => _HttpDemoPageState();
}

class _HttpDemoPageState extends State<HttpDemoPage> {
  bool _loading = false;
  String? _error;
  Map<String, dynamic>? _post;

  Future<void> _fetchPost() async {
    setState(() {
      _loading = true;
      _error = null;
      _post = null;
    });

    try {
      final response = await http
          .get(Uri.https('jsonplaceholder.typicode.com', '/posts/1'))
          .timeout(const Duration(seconds: 15));
      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw Exception('Server returned HTTP ${response.statusCode}.');
      }
      final decoded = jsonDecode(response.body);
      if (decoded is! Map<String, dynamic>) {
        throw const FormatException('Unexpected response format.');
      }
      if (!mounted) return;
      setState(() => _post = decoded);
    } on Exception catch (error) {
      if (!mounted) return;
      setState(() => _error = 'Request failed: $error');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HTTP Web Service')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Icon(Icons.cloud_download_outlined, size: 64),
          const SizedBox(height: 12),
          const Text(
            'GET /posts/1',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Fetches a sample JSON post from JSONPlaceholder. '
            'An internet connection is required.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          FilledButton.icon(
            onPressed: _loading ? null : _fetchPost,
            icon: const Icon(Icons.download),
            label: Text(_loading ? 'Loading...' : 'Fetch sample post'),
          ),
          const SizedBox(height: 20),
          if (_loading) const Center(child: CircularProgressIndicator()),
          if (_error case final error?) ...[
            Text(error, style: TextStyle(color: Theme.of(context).colorScheme.error)),
          ],
          if (_post case final post?) ...[
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post['title']?.toString() ?? 'Untitled post',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(post['body']?.toString() ?? 'No body returned.'),
                    const Divider(height: 24),
                    Text('User ID: ${post['userId'] ?? 'unknown'}'),
                    Text('Post ID: ${post['id'] ?? 'unknown'}'),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
