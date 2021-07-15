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
      },
      version: 1,
    );
  }

  Future<List<Anggota>> retrieve() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('anggota');
    return queryResult.map((e) => Anggota.fromMap(e)).toList();
  }
}
