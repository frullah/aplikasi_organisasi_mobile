import 'dart:developer';

import 'package:aplikasi_organisasi_mobile/model/anggota.dart';
import 'package:aplikasi_organisasi_mobile/services/database_handler.dart';
import 'package:flutter/material.dart';

class ListViewAnggota extends StatelessWidget {
  final anggota = ["Anggota 1", "Anggota 2", "Anggota 3"];

  late DatabaseHandler handler;

  void initState() {}

  @override
  Widget build(BuildContext context) {
    this.handler = DatabaseHandler();
    this.handler.initializeDB().whenComplete(() async {
      await this.addUsers();
    });

    return FutureBuilder(
        future: this.handler.getAnggota(),
        builder: (BuildContext context, AsyncSnapshot<List<Anggota>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, i) {
                  return Card(
                      child: ListTile(
                    title: Text(snapshot.data![i].nama),
                  ));
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  Future<int> addUsers() async {
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
    return await this.handler.insertUser(listAnggota);
  }
}
