import 'package:aplikasi_organisasi_mobile/list_view_anggota.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  int _pageIndex = 0;

  static var _pages = [
    ListViewAnggota(
      aktif: false,
    ),
    ListViewAnggota(
      aktif: true,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Organisasi',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Aplikasi Organisasi"),
        ),
        body: Center(child: _pages.elementAt(_pageIndex)),
        bottomNavigationBar: BottomNavigationBar(
          onTap: _onItemTapped,
          currentIndex: _pageIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.indeterminate_check_box),
              label: "Tidak Aktif",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check_box),
              label: "Aktif",
            ),
          ],
        ),
      ),
    );
  }
}
