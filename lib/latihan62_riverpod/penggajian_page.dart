
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'gaji_providers.dart';
import 'gaji_detail_page.dart';

class PenggajianPage extends ConsumerWidget {
  const PenggajianPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final daftarAsync = ref.watch(daftarGajiProvider);
    final proses = ref.watch(penggajianProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Penggajian Karyawan'),
        actions: [
          IconButton(
            tooltip: 'Muat ulang',
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.invalidate(daftarGajiProvider),
          ),
        ],
      ),
      body: daftarAsync.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Gagal memuat data: $error'),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: () => ref.invalidate(daftarGajiProvider),
                child: const Text('Coba Lagi'),
              ),
            ],
          ),
        ),
        data: (daftar) => Column(
          children: [
            Card(
              margin: const EdgeInsets.all(12),
              child: ListTile(
                title: const Text('Total Karyawan'),
                subtitle: Text('${daftar.length} karyawan'),
                trailing: Text(
                  '${proses.totalDiproses} diproses',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: daftar.length,
                itemBuilder: (context, index) {
                  final karyawan = daftar[index];
                  return ListTile(
                    title: Text(karyawan.nama),
                    subtitle: Text(karyawan.nik),
                    trailing: IconButton(
                      icon: const Icon(Icons.chevron_right),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => GajiDetailPage(
                              nik: karyawan.nik,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: proses.isProcessing
                      ? null
                      : () => ref
                          .read(penggajianProvider.notifier)
                          .prosesSemua(daftar),
                  child: Text(
                    proses.isProcessing
                        ? 'Memproses...'
                        : 'Proses Semua Gaji',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
