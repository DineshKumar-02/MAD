import 'package:flutter/material.dart';

void main() => runApp(const MapsDemoApp());

class MapsDemoApp extends StatelessWidget {
  const MapsDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Experiment 9 - Google Maps',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MapPage(),
    );
  }
}

class MapPlace {
  const MapPlace(this.name, this.subtitle, this.x, this.y, this.icon);

  final String name;
  final String subtitle;
  final double x;
  final double y;
  final IconData icon;
}

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static const _places = [
    MapPlace('City Library', 'Open until 8:00 PM', .25, .28, Icons.local_library),
    MapPlace('Central Park', 'Public park', .72, .35, Icons.park),
    MapPlace('Coffee Corner', 'Cafe · 0.4 km', .48, .72, Icons.local_cafe),
  ];

  MapPlace? _selected = _places.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Google Maps Demo')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            color: Theme.of(context).colorScheme.tertiaryContainer,
            child: const Padding(
              padding: EdgeInsets.all(14),
              child: Text(
                'Preview mode: this is a drawn map mockup. A live Google Map '
                'requires a Maps API key and platform configuration.',
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 370,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Stack(
                    children: [
                      const Positioned.fill(child: CustomPaint(painter: _MapPainter())),
                      for (final place in _places)
                        Positioned(
                          left: constraints.maxWidth * place.x - 24,
                          top: constraints.maxHeight * place.y - 36,
                          child: IconButton.filled(
                            tooltip: place.name,
                            onPressed: () => setState(() => _selected = place),
                            icon: Icon(place.icon),
                          ),
                        ),
                      Positioned(
                        left: constraints.maxWidth * .52 - 18,
                        top: constraints.maxHeight * .52 - 18,
                        child: Icon(Icons.my_location, color: Colors.blue.shade800, size: 36),
                      ),
                      Positioned(
                        right: 12,
                        top: 12,
                        child: FloatingActionButton.small(
                          heroTag: 'my-location',
                          tooltip: 'Center on my location',
                          onPressed: () => setState(() => _selected = null),
                          child: const Icon(Icons.gps_fixed),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 12),
          if (_selected case final place?)
            Card(
              child: ListTile(
                leading: Icon(place.icon),
                title: Text(place.name),
                subtitle: Text(place.subtitle),
                trailing: const Icon(Icons.place),
              ),
            )
          else
            const Card(
              child: ListTile(
                leading: Icon(Icons.my_location),
                title: Text('Current location'),
                subtitle: Text('Location marker centered on the map preview.'),
              ),
            ),
          for (final place in _places)
            ListTile(
              leading: Icon(place.icon),
              title: Text(place.name),
              subtitle: Text(place.subtitle),
              selected: _selected == place,
              onTap: () => setState(() => _selected = place),
            ),
        ],
      ),
    );
  }
}

class _MapPainter extends CustomPainter {
  const _MapPainter();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(const Color(0xffe6eddf), BlendMode.src);
    final block = Paint()..color = const Color(0xffd0dfc7);
    final road = Paint()
      ..color = const Color(0xfffaf8ee)
      ..strokeWidth = 18
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    for (var row = 0; row < 4; row++) {
      for (var column = 0; column < 3; column++) {
        final rect = Rect.fromLTWH(
          column * size.width / 3 + 12,
          row * size.height / 4 + 12,
          size.width / 3 - 32,
          size.height / 4 - 30,
        );
        canvas.drawRRect(
          RRect.fromRectAndRadius(rect, const Radius.circular(12)),
          block,
        );
      }
    }

    final horizontal = Path()
      ..moveTo(0, size.height * .18)
      ..lineTo(size.width, size.height * .28)
      ..moveTo(0, size.height * .62)
      ..lineTo(size.width, size.height * .55);
    final vertical = Path()
      ..moveTo(size.width * .38, 0)
      ..lineTo(size.width * .42, size.height)
      ..moveTo(size.width * .78, 0)
      ..lineTo(size.width * .72, size.height);
    canvas
      ..drawPath(horizontal, road)
      ..drawPath(vertical, road);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
