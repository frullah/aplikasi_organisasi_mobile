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

  Future<int> insertUser(List<Anggota> anggota) async {
    int result = 0;
    final Database db = await initializeDB();
    for (var user in anggota) {
      result = await db.insert('anggota', user.toMap());
    }
    return result;
  }

  Future<List<Anggota>> getAnggota() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('anggota');
    return queryResult.map((e) => Anggota.fromMap(e)).toList();
  }

  Future<void> deleteUser(int id) async {
    final db = await initializeDB();
    await db.delete(
      'anggota',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
