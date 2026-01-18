import 'package:e_shop/api/home.dart';
import 'package:e_shop/components/Home/HomeCategory.dart';
import 'package:e_shop/components/Home/HomeHot.dart';
import 'package:e_shop/components/Home/HomeMoreList.dart';
import 'package:e_shop/components/Home/HomeRecommendation.dart';
import 'package:e_shop/components/Home/HomeSlider.dart';
import 'package:e_shop/utils/Toastutils.dart';
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
              Expanded(
                child: HomeHot(result: _inVogueResult, type: "hot"),
              ),
              SizedBox(width: 10),
              Expanded(
                child: HomeHot(result: _oneStopResult, type: "step"),
              ),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      HomeMoreList(recommendList: _recommendList),
    ];
  }

  SpecialRecommendResult _specialRecommendResult = SpecialRecommendResult(
    id: "",
    title: "",
    subTypes: [],
  );

  SpecialRecommendResult _inVogueResult = SpecialRecommendResult(
    id: "",
    title: "",
    subTypes: [],
  );

  SpecialRecommendResult _oneStopResult = SpecialRecommendResult(
    id: "",
    title: "",
    subTypes: [],
  );

  List<GoodDetailItem> _recommendList = [];

  @override
  void initState() {
    super.initState();
    _registerEvent();
    Future.microtask(() {
      _Key.currentState?.show();
    });
  }

  Future<void> _getBannerList() async {
    _bannerList = await getBannerListAPI();
    setState(() {});
  }

  Future<void> _getCategoryList() async {
    _categoryList = await getCategoryListAPI();
    setState(() {});
  }

  Future<void> _getProductList() async {
    _specialRecommendResult = await getSpecialRecommendAPI();
    setState(() {});
  }

  Future<void> _getInVogueList() async {
    _inVogueResult = await getInVogueListAPI();
    setState(() {});
  }

  Future<void> _getOneStopList() async {
    _oneStopResult = await getOneStopListAPI();
    setState(() {});
  }

  int _currentPage = 1;
  bool _isLoading = false;
  bool _isLoadMore = true;

  Future<void> _getRecommendList() async {
    if (_isLoading || !_isLoadMore) {
      return;
    }
    _isLoading = true;
    int requestPage = _currentPage * 10;
    _recommendList = await getRecommendListAPI({"limit": requestPage});
    _isLoading = false;
    setState(() {});
    if (_recommendList.length < requestPage) {
      _isLoadMore = false;
      return;
    }
    _currentPage++;
  }

  void _registerEvent() {
    _controller.addListener(() {
      if (_controller.position.pixels >=
          _controller.position.maxScrollExtent - 50) {
        _getRecommendList();
      }
    });
  }

  final ScrollController _controller = ScrollController();
  final GlobalKey<RefreshIndicatorState> _Key =
      GlobalKey<RefreshIndicatorState>();

  Future<void> _onRefresh() async {
    _currentPage = 1;
    _isLoading = false;
    _isLoadMore = true;
    await _getBannerList();
    await _getCategoryList();
    await _getProductList();
    await _getInVogueList();
    await _getOneStopList();
    await _getRecommendList();
    ToastUtils.showToast(context, "加載成功了");
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _Key,
      onRefresh: () async {
        await _onRefresh();
      },
      child: CustomScrollView(
        controller: _controller,
        slivers: _getScrollChildren(),
      ),
    );
  }
}
