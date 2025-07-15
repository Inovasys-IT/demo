import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Screen for replenishment process.
class ReplenishmentScreen extends ConsumerWidget {
  const ReplenishmentScreen({super.key});

  Future<String> scanBarcode() async => 'TODO';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final sourceController = TextEditingController();
    final destController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Réapprovisionnement')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FilledButton(
                onPressed: () async {
                  await scanBarcode();
                },
                child: const Text('Scanner support'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: sourceController,
                decoration:
                    const InputDecoration(labelText: 'Emplacement source'),
                validator: (v) => v == null || v.isEmpty ? 'Requis' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: destController,
                decoration:
                    const InputDecoration(labelText: 'Emplacement destination'),
                validator: (v) => v == null || v.isEmpty ? 'Requis' : null,
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // TODO: ref.read(replenishmentProvider).validate(...)
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Réappro effectué')));
                  }
                },
                child: const Text('Valider'),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: () => context.pop(),
                child: const Text('Retour'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
