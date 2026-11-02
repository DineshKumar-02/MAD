import 'package:flutter/material.dart';

void main() => runApp(const ShopApp());

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Experiment 7 - Shopping app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const ShopPage(),
    );
  }
}

class Product {
  const Product(this.name, this.description, this.price, this.icon, this.color);

  final String name;
  final String description;
  final double price;
  final IconData icon;
  final Color color;
}

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  static const _products = [
    Product('Canvas Backpack', 'Everyday carry, 18 L', 39.99, Icons.backpack, Color(0xffe6f0e9)),
    Product('Travel Mug', 'Insulated stainless steel', 18.50, Icons.coffee, Color(0xffffefdc)),
    Product('Desk Lamp', 'Warm LED with touch control', 28.00, Icons.light, Color(0xffe8e8f7)),
    Product('Wireless Headphones', 'Comfort fit, 30-hour battery', 64.95, Icons.headphones, Color(0xfff8e6e9)),
  ];

  final Map<String, int> _cart = {};

  int get _itemCount => _cart.values.fold(0, (total, count) => total + count);

  double get _total => _products.fold(
        0,
        (total, product) => total + product.price * (_cart[product.name] ?? 0),
      );

  void _changeQuantity(Product product, int change) {
    setState(() {
      final next = (_cart[product.name] ?? 0) + change;
      if (next <= 0) {
        _cart.remove(product.name);
      } else {
        _cart[product.name] = next;
      }
    });
  }

  Future<void> _checkout() async {
    if (_cart.isEmpty) return;
    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Order placed'),
        content: Text('$_itemCount item(s) · \$${_total.toStringAsFixed(2)}'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Continue shopping'),
          ),
        ],
      ),
    );
    if (mounted) setState(_cart.clear);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Shop'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Badge(
                label: Text('$_itemCount'),
                child: const Icon(Icons.shopping_bag_outlined),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          for (final product in _products)
            Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: product.color,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(product.icon, size: 32),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                          Text(product.description, style: Theme.of(context).textTheme.bodySmall),
                          Text('\$${product.price.toStringAsFixed(2)}'),
                        ],
                      ),
                    ),
                    IconButton(
                      tooltip: 'Add ${product.name}',
                      onPressed: () => _changeQuantity(product, 1),
                      icon: const Icon(Icons.add_circle_outline),
                    ),
                    Text('${_cart[product.name] ?? 0}'),
                    IconButton(
                      tooltip: 'Remove ${product.name}',
                      onPressed: () => _changeQuantity(product, -1),
                      icon: const Icon(Icons.remove_circle_outline),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
          child: FilledButton(
            onPressed: _itemCount == 0 ? null : _checkout,
            child: Text('Checkout · $_itemCount items · \$${_total.toStringAsFixed(2)}'),
          ),
        ),
      ),
    );
  }
}
