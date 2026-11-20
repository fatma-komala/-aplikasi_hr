
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/karyawan.dart';
import 'gaji_providers.dart';

class GajiDetailPage extends ConsumerWidget {
  const GajiDetailPage({
    super.key,
    required this.nik,
  });

  final String nik;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(gajiDetailProvider(nik));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Gaji'),
      ),
      body: detailAsync.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => Center(
          child: Text('Gagal memuat detail: $error'),
        ),
        data: (karyawan) => Padding(
          padding: const EdgeInsets.all(20),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    karyawan.nama,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  Text('NIK: ${karyawan.nik}'),
                  Text('Divisi: ${karyawan.divisi}'),
                  const Divider(height: 32),
                  const Text('Gaji Pokok'),
                  Text(
                    formatRupiah(karyawan.gajiPokok),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
