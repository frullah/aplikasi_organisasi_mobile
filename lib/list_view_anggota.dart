import 'package:aplikasi_organisasi_mobile/model/anggota.dart';
import 'package:aplikasi_organisasi_mobile/services/database_handler.dart';
import 'package:flutter/material.dart';

class ListViewAnggota extends StatefulWidget {
  ListViewAnggotaState createState() => ListViewAnggotaState();
}

class ListViewAnggotaState extends State<ListViewAnggota> {
  late DatabaseHandler handler;

  void initState() {
    super.initState();
    this.handler = DatabaseHandler();
    this.handler.initializeDB();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: this.handler.retrieve(),
        builder: (BuildContext context, AsyncSnapshot<List<Anggota>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, i) {
                  var data = snapshot.data![i];
                  return Card(
                      child: ListTile(
                    title: Text(data.nama),
                    subtitle: Text(data.kode),
                  ));
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
