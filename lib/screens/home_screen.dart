import 'package:drawer_app/components/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.go('/details/123'),
              child: const Text('Go to Details (ID: 123)'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/details'),
              child: const Text('Go to Details'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/settings'),
              child: const Text('Go to Setttings'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/nonexistent'),
              child: const Text('Go to Nonexistent'),
            ),
          ],
        ),
      ),
    );
  }
}