import 'package:e_shop/api/home.dart';
import 'package:e_shop/components/Home/HomeCategory.dart';
import 'package:e_shop/components/Home/HomeHot.dart';
import 'package:e_shop/components/Home/HomeMoreList.dart';
import 'package:e_shop/components/Home/HomeRecommendation.dart';
import 'package:e_shop/components/Home/HomeSlider.dart';
import 'package:e_shop/viewmodels/home.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<CategoryItem> _categoryList = [];
  List<BannerItem> _bannerList = [];
  List<Widget> _getScrollChildren() {
    return [
      SliverToBoxAdapter(child: HomeSlider(bannerList: _bannerList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: HomeCategory(categoryList: _categoryList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: HomeRecommendation(
          specialRecommendResult: _specialRecommendResult,
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: HomeHot()),
              SizedBox(width: 10),
              Expanded(child: HomeHot()),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      HomeMoreList(),
    ];
  }

  SpecialRecommendResult _specialRecommendResult = SpecialRecommendResult(
    id: "",
    title: "",
    subTypes: [],
  );

  @override
  void initState() {
    super.initState();
    _getBannerList();
    _getCategoryList();
    _getProductList();
  }

  void _getBannerList() async {
    _bannerList = await getBannerListAPI();
    setState(() {});
  }

  void _getCategoryList() async {
    _categoryList = await getCategoryListAPI();
    setState(() {});
  }

  void _getProductList() async {
    _specialRecommendResult = await getSpecialRecommendAPI();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollChildren());
  }
}
