import 'package:flutter/material.dart';

void main() => runApp(const GameApp());

class GameApp extends StatelessWidget {
  const GameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Experiment 4 - 2D game',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const GamePage(),
    );
  }
}

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  static const _size = 5;
  static const _targets = [(4, 4), (0, 4), (3, 0), (1, 2), (4, 1)];
  int _playerX = 0;
  int _playerY = 0;
  int _targetIndex = 0;
  int _score = 0;

  (int, int) get _target => _targets[_targetIndex];

  void _move(int dx, int dy) {
    setState(() {
      _playerX = (_playerX + dx).clamp(0, _size - 1).toInt();
      _playerY = (_playerY + dy).clamp(0, _size - 1).toInt();
      if ((_playerX, _playerY) == _target) {
        _score++;
        _targetIndex = (_targetIndex + 1) % _targets.length;
      }
    });
  }

  void _swipe(DragEndDetails details) {
    final velocity = details.primaryVelocity ?? 0;
    if (velocity.abs() < 80) return;
    if (details.velocity.pixelsPerSecond.dx.abs() >
        details.velocity.pixelsPerSecond.dy.abs()) {
      _move(velocity < 0 ? 1 : -1, 0);
    } else {
      _move(0, velocity < 0 ? 1 : -1);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Star Collector')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text('Score: $_score', style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 8),
              const Text('Swipe or use the arrows to collect the star.'),
              const SizedBox(height: 16),
              Expanded(
                child: Center(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: GestureDetector(
                      onHorizontalDragEnd: _swipe,
                      onVerticalDragEnd: _swipe,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _size * _size,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: _size,
                        ),
                        itemBuilder: (context, index) {
                          final x = index % _size;
                          final y = index ~/ _size;
                          final isPlayer = x == _playerX && y == _playerY;
                          final isTarget = (x, y) == _target;
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 180),
                            margin: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: isPlayer
                                  ? colors.primaryContainer
                                  : colors.surfaceContainerHighest,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              isPlayer
                                  ? Icons.sports_esports
                                  : isTarget
                                  ? Icons.star
                                  : null,
                              color: isPlayer ? colors.primary : Colors.amber.shade800,
                              size: 30,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton.filledTonal(
                    onPressed: () => _move(-1, 0),
                    icon: const Icon(Icons.chevron_left),
                  ),
                  Column(
                    children: [
                      IconButton.filledTonal(
                        onPressed: () => _move(0, -1),
                        icon: const Icon(Icons.keyboard_arrow_up),
                      ),
                      IconButton.filledTonal(
                        onPressed: () => _move(0, 1),
                        icon: const Icon(Icons.keyboard_arrow_down),
                      ),
                    ],
                  ),
                  IconButton.filledTonal(
                    onPressed: () => _move(1, 0),
                    icon: const Icon(Icons.chevron_right),
                  ),
                ],
              ),
              TextButton(
                onPressed: () => setState(() {
                  _playerX = 0;
                  _playerY = 0;
                  _targetIndex = 0;
                  _score = 0;
                }),
                child: const Text('Restart'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
