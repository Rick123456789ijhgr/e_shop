import 'package:flutter/material.dart';

class HomeRecommendation extends StatefulWidget {
  const HomeRecommendation({super.key});

  @override
  State<HomeRecommendation> createState() => _HomeRecommendationState();
}

class _HomeRecommendationState extends State<HomeRecommendation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 300,
        alignment: Alignment.center,
        color: Colors.amber,
        child: Text("推薦", style: TextStyle(color: Colors.black)),
      ),
    );
  }
}
