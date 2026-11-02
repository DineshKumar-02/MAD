import 'package:flutter/material.dart';

void main() => runApp(const DetectionDemoApp());

class DetectionDemoApp extends StatelessWidget {
  const DetectionDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Experiment 11 - Object detection',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DetectionPage(),
    );
  }
}

class DetectionPage extends StatefulWidget {
  const DetectionPage({super.key});

  @override
  State<DetectionPage> createState() => _DetectionPageState();
}

class _DetectionPageState extends State<DetectionPage> {
  bool _analyzed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('On-device Object Detection')),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Card(
            color: Theme.of(context).colorScheme.tertiaryContainer,
            child: const Padding(
              padding: EdgeInsets.all(14),
              child: Text(
                'Demo mode: results below are sample labels, not camera inference. '
                'Live detection requires a TensorFlow Lite model and camera setup.',
              ),
            ),
          ),
          const SizedBox(height: 12),
          AspectRatio(
            aspectRatio: 4 / 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: CustomPaint(
                painter: const _SampleScenePainter(),
                child: const Center(
                  child: Icon(Icons.chair_alt, size: 100, color: Color(0xff70533d)),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: () => setState(() => _analyzed = true),
            icon: const Icon(Icons.search),
            label: Text(_analyzed ? 'Analyze sample again' : 'Analyze sample frame'),
          ),
          if (_analyzed) ...[
            const SizedBox(height: 12),
            Text('Sample detections', style: Theme.of(context).textTheme.titleLarge),
            const _DetectionResult(label: 'Chair', confidence: 0.94),
            const _DetectionResult(label: 'Table', confidence: 0.87),
            const _DetectionResult(label: 'Book', confidence: 0.78),
          ],
        ],
      ),
    );
  }
}

class _DetectionResult extends StatelessWidget {
  const _DetectionResult({required this.label, required this.confidence});

  final String label;
  final double confidence;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.check_box_outline_blank),
      title: Text(label),
      subtitle: LinearProgressIndicator(value: confidence),
      trailing: Text('${(confidence * 100).round()}%'),
    );
  }
}

class _SampleScenePainter extends CustomPainter {
  const _SampleScenePainter();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Offset.zero & size, Paint()..color = const Color(0xfff0e9dc));
    canvas.drawRect(
      Rect.fromLTWH(size.width * .08, size.height * .12, size.width * .84, size.height * .55),
      Paint()..color = const Color(0xffd9e8ef),
    );
    canvas.drawRect(
      Rect.fromLTWH(0, size.height * .72, size.width, size.height * .28),
      Paint()..color = const Color(0xffc7b89e),
    );
    final detection = Paint()
      ..color = Colors.green.shade700
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawRect(
      Rect.fromLTWH(size.width * .22, size.height * .17, size.width * .58, size.height * .68),
      detection,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
