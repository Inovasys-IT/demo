import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Screen for loading process.
class LoadingScreen extends ConsumerWidget {
  const LoadingScreen({super.key});

  Future<String> scanBarcode() async => 'TODO';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final articleController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Chargement')),
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
                child: const Text('Scanner article'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: articleController,
                decoration: const InputDecoration(labelText: 'Article'),
                validator: (v) => v == null || v.isEmpty ? 'Requis' : null,
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // TODO: ref.read(orderProvider).validateLoading(...)
                    context.go('/orders/summary');
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
