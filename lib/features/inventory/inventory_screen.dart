import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Screen for inventory with tabs.
class InventoryScreen extends ConsumerWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Inventaire'),
          bottom: const TabBar(tabs: [
            Tab(text: 'Emplacement'),
            Tab(text: 'Support'),
            Tab(text: 'Produit'),
          ]),
        ),
        body: const TabBarView(
          children: [
            _InventoryTab(),
            _InventoryTab(),
            _InventoryTab(),
          ],
        ),
      ),
    );
  }
}

class _InventoryTab extends StatelessWidget {
  const _InventoryTab();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final qtyController = TextEditingController();

    final lines = <String>[]; // TODO: inventory lines

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: _LinesList(lines: lines)),
            TextFormField(
              controller: qtyController,
              decoration: const InputDecoration(labelText: 'Qté'),
              keyboardType: TextInputType.number,
              validator: (v) => v == null || v.isEmpty ? 'Requis' : null,
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  // TODO: validate qty
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Inventaire validé')));
                }
              },
              child: const Text('Valider'),
            ),
          ],
        ),
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
