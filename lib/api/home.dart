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
