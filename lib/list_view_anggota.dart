import 'package:flutter/material.dart';

class ListViewAnggota extends StatelessWidget {
  final anggota = ["Anggota 1", "Anggota 2", "Anggota 3"];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: anggota.length,
        itemBuilder: (context, i) {
          return Card(
              child: ListTile(
            title: Text(anggota[i]),
          ));
        });
  }
}
