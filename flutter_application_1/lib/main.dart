import 'package:flutter/material.dart';

import 'experiments/exp_01_setup.dart' as exp1;
import 'experiments/exp_02_widgets.dart' as exp2;
import 'experiments/exp_03_calculator.dart' as exp3;
import 'experiments/exp_04_game.dart' as exp4;
import 'experiments/exp_05_movies.dart' as exp5;
import 'experiments/exp_06_http.dart' as exp6;
import 'experiments/exp_07_shopping.dart' as exp7;
import 'experiments/exp_08_notifications.dart' as exp8;
import 'experiments/exp_09_maps.dart' as exp9;
import 'experiments/exp_10_bmi.dart' as exp10;
import 'experiments/exp_11_detection.dart' as exp11;

void main() {
  runApp(const MadLabMasterApp());
}

class MadLabMasterApp extends StatelessWidget {
  const MadLabMasterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MAD Lab (23IT703)',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1E3A8A),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const MasterDashboardPage(),
    );
  }
}

class LabExperimentItem {
  final String number;
  final String title;
  final String category;
  final IconData icon;
  final Color color;
  final Widget page;

  const LabExperimentItem({
    required this.number,
    required this.title,
    required this.category,
    required this.icon,
    required this.color,
    required this.page,
  });
}

class MasterDashboardPage extends StatelessWidget {
  const MasterDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<LabExperimentItem> experiments = [
      LabExperimentItem(
        number: 'Ex 01',
        title: 'Study & Installation of Flutter/KMP',
        category: 'Environment Setup',
        icon: Icons.install_desktop,
        color: Colors.blue.shade700,
        page: const exp1.SetupPage(),
      ),
      LabExperimentItem(
        number: 'Ex 02',
        title: 'Widgets, GUI Components, Fonts & Colors',
        category: 'UI / UX Design',
        icon: Icons.palette,
        color: Colors.indigo,
        page: const exp2.WidgetsPage(),
      ),
      LabExperimentItem(
        number: 'Ex 03',
        title: 'Native Calculator Application',
        category: 'Utility App',
        icon: Icons.calculate,
        color: Colors.deepOrange,
        page: const exp3.CalculatorPage(),
      ),
      LabExperimentItem(
        number: 'Ex 04',
        title: '2D Animation & Gestures Gaming App',
        category: 'Game Dev',
        icon: Icons.sports_esports,
        color: Colors.green.shade700,
        page: const exp4.GamePage(),
      ),
      LabExperimentItem(
        number: 'Ex 05',
        title: 'Movie Rating Application (IMDb)',
        category: 'Entertainment',
        icon: Icons.movie,
        color: Colors.amber.shade800,
        page: const exp5.MoviesPage(),
      ),
      LabExperimentItem(
        number: 'Ex 06',
        title: 'HTTP Web Service & REST API Client',
        category: 'Networking',
        icon: Icons.cloud_sync,
        color: Colors.teal.shade700,
        page: const exp6.HttpDemoPage(),
      ),
      LabExperimentItem(
        number: 'Ex 07',
        title: 'Simple Shopping Application (Cart)',
        category: 'E-Commerce',
        icon: Icons.shopping_cart,
        color: Colors.purple.shade700,
        page: const exp7.ShopPage(),
      ),
      LabExperimentItem(
        number: 'Ex 08',
        title: 'Web Server Supporting Push Notifications',
        category: 'WebSockets / Push',
        icon: Icons.notifications_active,
        color: Colors.red.shade700,
        page: const exp8.NotificationsPage(),
      ),
      LabExperimentItem(
        number: 'Ex 09',
        title: 'Google Maps Integration Application',
        category: 'Location Services',
        icon: Icons.map,
        color: Colors.blue.shade600,
        page: const exp9.MapPage(),
      ),
      LabExperimentItem(
        number: 'Ex 10',
        title: 'Mini Project: BMI Calculator App',
        category: 'Health & Fitness',
        icon: Icons.favorite,
        color: const Color(0xFFEB1555),
        page: const exp10.BmiPage(),
      ),
      LabExperimentItem(
        number: 'Ex 11',
        title: 'CBS: Real-Time Object Detection (TFLite)',
        category: 'Machine Learning',
        icon: Icons.camera_alt,
        color: Colors.cyan.shade800,
        page: const exp11.DetectionPage(),
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          'MAD LAB (23IT703)',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.5),
        ),
        backgroundColor: const Color(0xFF1E3A8A),
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 2,
      ),
      body: CustomScrollView(
        slivers: [
          // College Header
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1E3A8A), Color(0xFF2563EB)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(50),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.school, color: Colors.white, size: 28),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ERODE SENGUNTHAR ENGG COLLEGE',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                letterSpacing: 0.5,
                              ),
                            ),
                            Text(
                              'Department of Information Technology',
                              style: TextStyle(color: Colors.white70, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(color: Colors.white24, height: 24),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Course', style: TextStyle(color: Colors.white60, fontSize: 11)),
                          Text(
                            'MAD Lab (23IT703)',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Year / Semester', style: TextStyle(color: Colors.white60, fontSize: 11)),
                          Text(
                            'IV / VII',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Total Practicals', style: TextStyle(color: Colors.white60, fontSize: 11)),
                          Text(
                            '11 Experiments',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 6),
              child: Text(
                'Select Any Experiment to Execute:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                ),
              ),
            ),
          ),

          // All 11 Experiments List
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final exp = experiments[index];
                  return Card(
                    elevation: 1.5,
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey.shade200),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => exp.page),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Row(
                          children: [
                            Container(
                              width: 52,
                              height: 52,
                              decoration: BoxDecoration(
                                color: exp.color.withAlpha(30),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(exp.icon, color: exp.color, size: 28),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                        decoration: BoxDecoration(
                                          color: exp.color.withAlpha(35),
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: Text(
                                          exp.number,
                                          style: TextStyle(
                                            color: exp.color,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        exp.category,
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    exp.title,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF0F172A),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                childCount: experiments.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 30)),
        ],
      ),
    );
  }
}
