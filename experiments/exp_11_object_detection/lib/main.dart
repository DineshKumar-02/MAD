import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const Exp11App());
}

class Exp11App extends StatelessWidget {
  const Exp11App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ex 11: Real-Time Object Detection (TFLite)',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF101010),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.cyanAccent,
          brightness: Brightness.dark,
        ),
      ),
      home: const ObjectDetectionHomePage(),
    );
  }
}

class DetectedObject {
  final String label;
  final double confidence;
  final Rect boundingBox; // Normalized (0.0 to 1.0)
  final Color color;

  DetectedObject({
    required this.label,
    required this.confidence,
    required this.boundingBox,
    required this.color,
  });
}

class ObjectDetectionHomePage extends StatefulWidget {
  const ObjectDetectionHomePage({super.key});

  @override
  State<ObjectDetectionHomePage> createState() => _ObjectDetectionHomePageState();
}

class _ObjectDetectionHomePageState extends State<ObjectDetectionHomePage> {
  double _confidenceThreshold = 0.50; // > 0.5 matching manual requirement
  bool _isDetecting = true;
  String _currentScene = 'Tech Workspace';
  int _inferenceTimeMs = 38;

  // Pre-configured simulated detection frames for lab demonstration
  final Map<String, List<DetectedObject>> _scenes = {
    'Tech Workspace': [
      DetectedObject(
        label: 'Person',
        confidence: 0.94,
        boundingBox: const Rect.fromLTWH(0.18, 0.15, 0.40, 0.65),
        color: Colors.greenAccent,
      ),
      DetectedObject(
        label: 'Laptop',
        confidence: 0.89,
        boundingBox: const Rect.fromLTWH(0.25, 0.52, 0.50, 0.38),
        color: Colors.cyanAccent,
      ),
      DetectedObject(
        label: 'Smartphone',
        confidence: 0.82,
        boundingBox: const Rect.fromLTWH(0.72, 0.62, 0.18, 0.25),
        color: Colors.amberAccent,
      ),
      DetectedObject(
        label: 'Coffee Cup',
        confidence: 0.74,
        boundingBox: const Rect.fromLTWH(0.08, 0.68, 0.14, 0.20),
        color: Colors.pinkAccent,
      ),
    ],
    'Classroom': [
      DetectedObject(
        label: 'Student',
        confidence: 0.91,
        boundingBox: const Rect.fromLTWH(0.15, 0.20, 0.35, 0.70),
        color: Colors.greenAccent,
      ),
      DetectedObject(
        label: 'Backpack',
        confidence: 0.78,
        boundingBox: const Rect.fromLTWH(0.55, 0.45, 0.30, 0.45),
        color: Colors.orangeAccent,
      ),
      DetectedObject(
        label: 'Book',
        confidence: 0.65,
        boundingBox: const Rect.fromLTWH(0.35, 0.65, 0.22, 0.22),
        color: Colors.purpleAccent,
      ),
    ],
  };

  @override
  Widget build(BuildContext context) {
    final rawObjects = _scenes[_currentScene] ?? [];
    final detectedObjects = _isDetecting
        ? rawObjects.where((obj) => obj.confidence >= _confidenceThreshold).toList()
        : <DetectedObject>[];

    return Scaffold(
      appBar: AppBar(
        title: const Text('TFLite Object Detection'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'Model Specs',
            onPressed: _showModelInfoDialog,
          ),
        ],
      ),
      body: Column(
        children: [
          // Scene selector & Status
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                DropdownButton<String>(
                  value: _currentScene,
                  dropdownColor: const Color(0xFF202020),
                  underline: const SizedBox(),
                  items: _scenes.keys.map((s) {
                    return DropdownMenuItem(value: s, child: Text(s));
                  }).toList(),
                  onChanged: (val) {
                    if (val != null) setState(() => _currentScene = val);
                  },
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.cyanAccent.withValues(alpha: 0.5)),
                  ),
                  child: Text(
                    '${_inferenceTimeMs}ms • SSD MobileNet',
                    style: const TextStyle(fontSize: 12, color: Colors.cyanAccent),
                  ),
                ),
              ],
            ),
          ),

          // Camera Stream & Dynamic Bounding Boxes Overlay
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF181818),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Stack(
                      fit: StackFit.expand,
                      children: [
                        // Viewport background representing camera sensor
                        CustomPaint(
                          size: Size(constraints.maxWidth, constraints.maxHeight),
                          painter: CameraSensorFeedPainter(scene: _currentScene),
                        ),

                        // Bounding Box Overlays
                        ...detectedObjects.map((obj) {
                          final left = obj.boundingBox.left * constraints.maxWidth;
                          final top = obj.boundingBox.top * constraints.maxHeight;
                          final width = obj.boundingBox.width * constraints.maxWidth;
                          final height = obj.boundingBox.height * constraints.maxHeight;

                          return Positioned(
                            left: left,
                            top: top,
                            width: width,
                            height: height,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                // Box Border
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: obj.color, width: 2.5),
                                    borderRadius: BorderRadius.circular(4),
                                    color: obj.color.withValues(alpha: 0.12),
                                  ),
                                ),
                                // Label Tag
                                Positioned(
                                  left: 0,
                                  top: -24,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: obj.color,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      '${obj.label} ${(obj.confidence * 100).toInt()}%',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),

                        // Crosshair center indicator
                        Center(
                          child: Icon(
                            Icons.crop_free,
                            size: 64,
                            color: Colors.white.withValues(alpha: 0.2),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),

          // Inference & Detection Controls
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text('Confidence Threshold:'),
                    Expanded(
                      child: Slider(
                        value: _confidenceThreshold,
                        min: 0.3,
                        max: 0.95,
                        divisions: 13,
                        activeColor: Colors.cyanAccent,
                        label: '${(_confidenceThreshold * 100).toInt()}%',
                        onChanged: (val) {
                          setState(() {
                            _confidenceThreshold = val;
                          });
                        },
                      ),
                    ),
                    Text('${(_confidenceThreshold * 100).toInt()}%'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          _isDetecting = !_isDetecting;
                        });
                      },
                      icon: Icon(_isDetecting ? Icons.pause : Icons.play_arrow),
                      label: Text(_isDetecting ? 'Pause Stream' : 'Resume Stream'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _isDetecting ? Colors.orange : Colors.green,
                        foregroundColor: Colors.white,
                      ),
                    ),
                    OutlinedButton.icon(
                      onPressed: () {
                        setState(() {
                          _inferenceTimeMs = 30 + Random().nextInt(15);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Frame captured: ${detectedObjects.length} objects detected.',
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.camera),
                      label: const Text('Capture Frame'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showModelInfoDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('TFLite Model Specifications'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('• Model: ssd_mobilenet_v2.tflite'),
            Text('• Input Tensor: [1, 300, 300, 3] RGB'),
            Text('• Output 0: [1, 10, 4] Bounding Boxes'),
            Text('• Output 1: [1, 10] Class IDs'),
            Text('• Output 2: [1, 10] Confidence Scores'),
            Text('• Output 3: [1] Number of Detections'),
            SizedBox(height: 8),
            Text('Configuration from Lab Manual Page 47-49.'),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Close')),
        ],
      ),
    );
  }
}

class CameraSensorFeedPainter extends CustomPainter {
  final String scene;

  CameraSensorFeedPainter({required this.scene});

  @override
  void paint(Canvas canvas, Size size) {
    // Stylized grid & focus reticle
    final gridPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.04)
      ..strokeWidth = 1.0;

    for (double x = 0; x < size.width; x += 30) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), gridPaint);
    }
    for (double y = 0; y < size.height; y += 30) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
