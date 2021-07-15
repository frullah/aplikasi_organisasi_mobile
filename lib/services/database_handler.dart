import 'package:aplikasi_organisasi_mobile/model/anggota.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'data.db'),
      onCreate: (database, version) async {
        await database.execute(
          """
          CREATE TABLE anggota(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            kode_anggota VARCHAR NOT NULL,
            nama_anggota VARCHAR NOT NULL,
            tgl_registrasi DATE NOT NULL,
            alamat VARCHAR,
            telepon VARCHAR,
            status TINYINT NOT NULL DEFAULT 0
          )""",
        );

        List<Anggota> listAnggota = [
          Anggota(
              kode: "OG-2107001",
              nama: "Ahmad sanusi",
              tanggalRegistrasi: "13-07-2021",
              alamat: "Serang",
              telepon: "0812xxxxx",
              aktif: true),
          Anggota(
              kode: "OG-2107002",
              nama: "Awaludin",
              tanggalRegistrasi: "04-08-2019",
              alamat: "Jakarta",
              telepon: "08125xxxx",
              aktif: true),
          Anggota(
              kode: "OG-2107003",
              nama: "Rani Amelia",
              tanggalRegistrasi: "20-11-2015",
              alamat: "Bandung",
              telepon: "0877xxxxx",
              aktif: false),
          Anggota(
              kode: "OG-2107004",
              nama: "Reni",
              tanggalRegistrasi: "11-11-2018",
              alamat: "Jakarta",
              telepon: "0815xxxxx",
              aktif: false),
          Anggota(
              kode: "OG-2107005",
              nama: "Cici",
              tanggalRegistrasi: "12-06-2011",
              alamat: "Palembang",
              telepon: "08122xxxx",
              aktif: true)
        ];

        for (var anggota in listAnggota) {
          await database.insert('anggota', anggota.toMap());
        }
      },
      version: 1,
    );
  }

  Future<List<Anggota>> retrieve({bool? aktif}) async {
    String? where;

    if (aktif != null) {
      where = "status = $aktif";
    }

    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult =
        await db.query("anggota", where: where);
    return queryResult.map((e) => Anggota.fromMap(e)).toList();
  }
}
