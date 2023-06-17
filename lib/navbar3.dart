import 'package:flutter/material.dart';

class Navbar3 extends StatefulWidget {
  const Navbar3({Key? key}) : super(key: key);

  @override
  State<Navbar3> createState() => _Navbar3State();
}

class _Navbar3State extends State<Navbar3> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text("Ini halaman navbar 3"),
        ],
      ),
    );
  }
}
