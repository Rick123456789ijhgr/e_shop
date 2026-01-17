import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_shop/viewmodels/home.dart';
import 'package:flutter/material.dart';

class HomeSlider extends StatefulWidget {
  final List<BannerItem> bannerList;
  const HomeSlider({super.key, required this.bannerList});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  Widget _getSlider() {
    final double screenWidth = MediaQuery.of(context).size.width;
    return CarouselSlider(
      items: List.generate(widget.bannerList.length, (int index) {
        return Image.network(
          widget.bannerList[index].imgUrl,
          fit: BoxFit.cover,
          width: screenWidth,
        );
      }),
      options: CarouselOptions(
        viewportFraction: 1,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_getSlider()]);
    // return Container(
    //   height: 300,
    //   color: Colors.blue,
    //   alignment: Alignment.center,
    //   child: Text("輪播圖", style: TextStyle(fontSize: 20, color: Colors.black)),
    // );
  }
}
