import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Home screen with navigation tiles.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final agentName = 'Nom de l\'agent';

    return Scaffold(
      appBar: AppBar(title: const Text('WMS Mobile')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(agentName, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                children: [
                  _HomeTile(label: 'Réception', route: '/reception'),
                  _HomeTile(label: 'Rangement', route: '/rangement'),
                  _HomeTile(label: 'Réappro.', route: '/replenishment'),
                  _HomeTile(label: 'Commande', route: '/orders'),
                  _HomeTile(label: 'Chargement', route: '/orders/loading'),
                  _HomeTile(label: 'Inventaire', route: '/inventory'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeTile extends StatelessWidget {
  final String label;
  final String route;
  const _HomeTile({required this.label, required this.route});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.go(route),
      child: Card(
        child: Center(child: Text(label, textAlign: TextAlign.center)),
      ),
    );
  }
}
