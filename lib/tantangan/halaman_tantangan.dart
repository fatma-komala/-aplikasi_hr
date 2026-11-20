
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'counter_lokal.dart';
import 'counter_provider.dart';
import 'widget_a_provider.dart';
import 'widget_a_riverpod.dart';

class HalamanTantangan extends StatelessWidget {
  const HalamanTantangan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tantangan 6.4'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Perbandingan State Management',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CounterLokal(),
                    ),
                  );
                },
                child: const Text('Counter dengan setState'),
              ),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChangeNotifierProvider(
                        create: (_) => CounterProvider(),
                        child: const WidgetAProvider(),
                      ),
                    ),
                  );
                },
                child: const Text('Counter dengan Provider'),
              ),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ProviderScope(
                        child: WidgetARiverpod(),
                      ),
                    ),
                  );
                },
                child: const Text('Counter dengan Riverpod'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
