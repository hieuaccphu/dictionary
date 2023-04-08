import 'package:dictionary/providers/navigation_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'navigator/components/app_navigation_bar.dart';
import 'navigator/navigation.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BottomNavBarState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My app',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AppNavigationBar(),
      ),
    );
  }
}
