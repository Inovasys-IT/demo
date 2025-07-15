import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Screen for picking tasks.
class PickingTaskScreen extends ConsumerWidget {
  const PickingTaskScreen({super.key});

  Future<String> scanBarcode() async => 'TODO';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lines = <String>[]; // TODO: order lines

    return Scaffold(
      appBar: AppBar(title: const Text('Préparation')),
      body: _LinesList(
        lines: lines,
        onTap: (_) => context.go('/orders/support-validation'),
      ),
    );
  }
}

class _LinesList extends StatelessWidget {
  final List<String> lines;
  final ValueChanged<String> onTap;
  const _LinesList({required this.lines, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: lines.length,
      itemBuilder: (context, index) {
        final line = lines[index];
        return ListTile(
          title: Text(line),
          onTap: () => onTap(line),
        );
      },
    );
  }
}
