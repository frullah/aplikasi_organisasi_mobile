class Anggota {
  final int? id;
  final String kode;
  final String nama;
  final String tanggalRegistrasi;
  final String? alamat;
  final String? telepon;
  final bool? aktif;

  Anggota(
      {this.id,
      required this.nama,
      required this.kode,
      required this.tanggalRegistrasi,
      this.telepon,
      this.alamat,
      this.aktif});

  Anggota.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        nama = res["nama_anggota"],
        kode = res["kode_anggota"],
        tanggalRegistrasi = res["tgl_registrasi"],
        alamat = res["alamat"],
        telepon = res["telepon"],
        aktif = res["status"] == 1;

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'nama_anggota': nama,
      'kode_anggota': kode,
      'tgl_registrasi': tanggalRegistrasi,
      'alamat': alamat,
      'telepon': telepon,
      'status': aktif,
    };
  }
}
