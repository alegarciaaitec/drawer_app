import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:drawer_app/screens/detail_screen.dart';
import 'package:drawer_app/screens/home_screen.dart';
import 'package:drawer_app/screens/settings_screen.dart';

final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details/:id',
          builder: (context, state) {
            final String? id = state.pathParameters['id'];
            return DetailScreen(id: id!);
          },
        ),
        GoRoute(
          path: 'details',
          builder: (context, state) {
            return const DetailScreen(id: null);
          },
        ),
        GoRoute(
          path: 'settings',
          builder: (context, state) {
            return const SettingsScreen();
          },
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) {
    return Scaffold(
      appBar: AppBar(title: Text('Pagina no encontrada')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Error: Ruta "${state.uri.path}" no existe.'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.go('/');
              },
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    );
  },
);