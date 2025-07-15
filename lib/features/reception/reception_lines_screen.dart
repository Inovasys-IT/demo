import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../models/wms_models.dart';

/// Screen showing reception lines.
class ReceptionLinesScreen extends ConsumerWidget {
  const ReceptionLinesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lines = <ReceptionLine>[]; // TODO: load from provider

    return Scaffold(
      appBar: AppBar(title: const Text('Lignes de réception')),
      body: _LinesList(
        lines: lines,
        onTap: (line) => context.go('/reception/lineDetail'),
      ),
    );
  }
}

class _LinesList extends StatelessWidget {
  final List<ReceptionLine> lines;
  final ValueChanged<ReceptionLine> onTap;

  const _LinesList({required this.lines, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: lines.length,
      itemBuilder: (context, index) {
        final line = lines[index];
        return ListTile(
          title: Text(line.itemNo),
          subtitle: Text(line.description),
          trailing: Text('${line.expectedQty} ${line.unitOfMeasure}'),
          onTap: () => onTap(line),
        );
      },
    );
  }
}
