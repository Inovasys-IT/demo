import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Screen displaying loading summary.
class LoadingSummaryScreen extends ConsumerWidget {
  const LoadingSummaryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lines = <String>[]; // TODO: summary lines

    return Scaffold(
      appBar: AppBar(title: const Text('Résumé chargement')),
      body: Column(
        children: [
          Expanded(
            child: _LinesList(lines: lines),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: FilledButton(
              onPressed: () {
                // TODO: finalize loading
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Chargement validé')),
                );
                context.go('/home');
              },
              child: const Text('Terminer'),
            ),
          ),
        ],
      ),
    );
  }
}

class _LinesList extends StatelessWidget {
  final List<String> lines;
  const _LinesList({required this.lines});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: lines.length,
      itemBuilder: (context, index) => ListTile(title: Text(lines[index])),
    );
  }
}
