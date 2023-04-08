import 'package:dictionary/screens/training/training_screen.dart';
import 'package:flutter/material.dart';

import 'components/app_navigation_bar.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Text('Home'),
        actions: const [
          Icon(Icons.person),
        ],
      ),
      body: const AppNavigationBar(),
    );
  }
}
