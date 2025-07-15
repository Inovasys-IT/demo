import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Screen to choose the equipment used by the agent.
class EquipmentScreen extends ConsumerWidget {
  const EquipmentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    String? selectedEquipment;

    return Scaffold(
      appBar: AppBar(title: const Text('Équipement')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButtonFormField<String>(
                decoration:
                    const InputDecoration(labelText: 'Chariot / Transpalette'),
                items: const [
                  DropdownMenuItem(value: 'chariot', child: Text('Chariot')),
                  DropdownMenuItem(
                      value: 'transpalette', child: Text('Transpalette')),
                ],
                onChanged: (value) => selectedEquipment = value,
                validator: (value) => value == null ? 'Requis' : null,
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // TODO: ref.read(equipmentProvider).select(...)
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Équipement sélectionné')),
                    );
                    context.go('/home');
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
