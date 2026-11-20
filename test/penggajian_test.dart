import 'package:aplikasi_hr/latihan62_riverpod/gaji_providers.dart';
import 'package:aplikasi_hr/models/karyawan.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('prosesSemua menandai semua karyawan', () async {
    final container = ProviderContainer();

    addTearDown(container.dispose);

    expect(
      container.read(penggajianProvider).totalDiproses,
      0,
    );

    await container
        .read(penggajianProvider.notifier)
        .prosesSemua(dummyKaryawan);

    expect(
      container.read(penggajianProvider).totalDiproses,
      dummyKaryawan.length,
    );
  });
}