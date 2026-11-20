
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/karyawan.dart';
import 'gaji_api.dart';

final gajiApiProvider = Provider<GajiApi>((ref) => GajiApi());

// (a) FutureProvider: daftar gaji 10 karyawan
final daftarGajiProvider = FutureProvider<List<Karyawan>>(
  (ref) => ref.watch(gajiApiProvider).fetchDaftarGaji(),
);

// (d) Family: detail gaji berdasarkan NIK
final gajiDetailProvider = FutureProvider.family<Karyawan, String>(
  (ref, nik) => ref.watch(gajiApiProvider).fetchDetail(nik),
);

// (b) State penggajian yang immutable
class PenggajianState {
  final List<String> diproses;
  final bool isProcessing;

  const PenggajianState({
    this.diproses = const [],
    this.isProcessing = false,
  });

  int get totalDiproses => diproses.length;

  PenggajianState copyWith({
    List<String>? diproses,
    bool? isProcessing,
  }) {
    return PenggajianState(
      diproses: diproses ?? this.diproses,
      isProcessing: isProcessing ?? this.isProcessing,
    );
  }
}

// (b) Notifier untuk Riverpod 3
class PenggajianNotifier extends Notifier<PenggajianState> {
  @override
  PenggajianState build() => const PenggajianState();

  Future<void> prosesSemua(List<Karyawan> daftar) async {
    state = state.copyWith(isProcessing: true);

    await Future.delayed(const Duration(seconds: 1));

    if (!ref.mounted) return;

    state = PenggajianState(
      diproses: [for (final k in daftar) k.nik],
      isProcessing: false,
    );
  }

  void reset() => state = const PenggajianState();
}

final penggajianProvider =
    NotifierProvider<PenggajianNotifier, PenggajianState>(
  PenggajianNotifier.new,
);
