import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Details and validation for a reception line.
class ReceptionLineDetailScreen extends ConsumerWidget {
  const ReceptionLineDetailScreen({super.key});

  Future<String> scanBarcode() async => 'TODO';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final lotController = TextEditingController();
    final dlcController = TextEditingController();
    final qtyController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Détail ligne')),
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
                controller: lotController,
                decoration: const InputDecoration(labelText: 'Lot'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: dlcController,
                decoration: const InputDecoration(labelText: 'DLC'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: qtyController,
                decoration: const InputDecoration(labelText: 'Qté reçue'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // TODO: ref.read(receptionProvider).validateLine(...)
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Ligne validée')));
                  }
                },
                child: const Text('Valider et continuer'),
              ),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: () {
                  showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Clôturer Réception ?'),
                      actions: [
                        TextButton(
                          onPressed: () => context.pop(false),
                          child: const Text('Non'),
                        ),
                        TextButton(
                          onPressed: () => context.pop(true),
                          child: const Text('Oui'),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text('Fermer support'),
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
