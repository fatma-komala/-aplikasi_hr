
import 'package:flutter/foundation.dart';

class CutiNotifier extends ChangeNotifier {
  // NIK karyawan yang mengajukan cuti
  final List<String> _pengajuan = [];

  // Getter read-only
  List<String> get pengajuan => List.unmodifiable(_pengajuan);

  int get jumlah => _pengajuan.length;

  bool sudahMengajukan(String nik) =>
      _pengajuan.contains(nik);

  // Mengajukan cuti
  void ajukan(String nik) {
    if (sudahMengajukan(nik)) return;

    _pengajuan.add(nik);
    notifyListeners();
  }

  // Membatalkan cuti
  void batalkan(String nik) {
    if (_pengajuan.remove(nik)) {
      notifyListeners();
    }
  }
}
