import 'package:flutter/material.dart';

class HomeHot extends StatefulWidget {
  const HomeHot({super.key});

  @override
  State<HomeHot> createState() => _HomeHotState();
}

class _HomeHotState extends State<HomeHot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text("熱門商品", style: TextStyle(color: Colors.black)),
    );
  }
}
