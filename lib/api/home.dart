import 'package:e_shop/constants/index.dart';
import 'package:e_shop/utils/DioRequest.dart';
import 'package:e_shop/viewmodels/home.dart';

Future<List<BannerItem>> getBannerListAPI() async {
  return ((await dioRequest.get(HttpConstants.BANNER_LIST)) as List).map((
    item,
  ) {
    return BannerItem.fromJson(item as Map<String, dynamic>);
  }).toList();
}

Future<List<CategoryItem>> getCategoryListAPI() async {
  return ((await dioRequest.get(HttpConstants.CATEGORY_LIST)) as List).map((
    item,
  ) {
    return CategoryItem.fromJson(item as Map<String, dynamic>);
  }).toList();
}

Future<SpecialRecommendResult> getSpecialRecommendAPI() async {
  return SpecialRecommendResult.fromJson(
    await dioRequest.get(HttpConstants.PRODUCT_LIST),
  );
}

Future<SpecialRecommendResult> getInVogueListAPI() async {
  return SpecialRecommendResult.fromJson(
    await dioRequest.get(HttpConstants.IN_VOGUE_LIST),
  );
}

Future<SpecialRecommendResult> getOneStopListAPI() async {
  return SpecialRecommendResult.fromJson(
    await dioRequest.get(HttpConstants.ONE_STOP_LIST),
  );
}

Future<List<GoodDetailItem>> getRecommendListAPI(
  Map<String, dynamic> params,
) async {
  return ((await dioRequest.get(HttpConstants.RECOMMEND_LIST, params: params))
          as List)
      .map((item) {
        return GoodDetailItem.fromJson(item as Map<String, dynamic>);
      })
      .toList();
}
