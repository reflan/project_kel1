import 'package:flutter/material.dart';

class Navbar1 extends StatefulWidget {
  const Navbar1({Key? key}) : super(key: key);

  @override
  State<Navbar1> createState() => _Navbar1State();
}

class _Navbar1State extends State<Navbar1> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text("Ini halaman navbar 1"),
        ],
      ),
    );
  }
}
