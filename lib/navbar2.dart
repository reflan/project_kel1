import 'package:flutter/material.dart';

class navbar2 extends StatefulWidget {
  const navbar2({Key? key}) : super(key: key);

  @override
  State<navbar2> createState() => _navbar2State();
}

class _navbar2State extends State<navbar2> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text("ini halaman navbar 2"),
        ],
      ),
    );
  }
}
