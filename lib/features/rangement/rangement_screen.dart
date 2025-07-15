import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Screen for rangement (put away) process.
class RangementScreen extends ConsumerWidget {
  const RangementScreen({super.key});

  Future<String> scanBarcode() async => 'TODO';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final locationController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Rangement')),
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
                controller: locationController,
                decoration:
                    const InputDecoration(labelText: 'Emplacement destination'),
                validator: (v) => v == null || v.isEmpty ? 'Requis' : null,
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // TODO: ref.read(rangementProvider).validate(...)
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Rangement effectué')));
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
