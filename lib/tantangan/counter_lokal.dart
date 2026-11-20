
import 'package:flutter/material.dart';

class CounterLokal extends StatefulWidget {
  const CounterLokal({super.key});

  @override
  State<CounterLokal> createState() => _CounterLokalState();
}

class _CounterLokalState extends State<CounterLokal> {
  int counter = 0;

  void tambah() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Lokal - setState'),
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
              onPressed: tambah,
              child: const Text('Tambah'),
            ),
          ],
        ),
      ),
    );
  }
}
