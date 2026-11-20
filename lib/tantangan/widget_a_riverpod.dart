
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'counter_riverpod.dart';

class WidgetARiverpod extends ConsumerWidget {
  const WidgetARiverpod({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter dengan Riverpod'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Nilai Counter: $counter',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ref.read(counterProvider.notifier).tambah();
              },
              child: const Text('Tambah'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                ref.read(counterProvider.notifier).reset();
              },
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
