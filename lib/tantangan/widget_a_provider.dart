
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_provider.dart';

class WidgetAProvider extends StatelessWidget {
  const WidgetAProvider({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = context.watch<CounterProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter dengan Provider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Nilai Counter: ${counter.counter}',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.read<CounterProvider>().tambah();
              },
              child: const Text('Tambah'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                context.read<CounterProvider>().reset();
              },
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
