import 'package:e_shop/viewmodels/home.dart';
import 'package:flutter/material.dart';

class HomeHot extends StatefulWidget {
  final SpecialRecommendResult result;
  final String type;
  const HomeHot({super.key, required this.result, required this.type});

  @override
  State<HomeHot> createState() => _HomeHotState();
}

class _HomeHotState extends State<HomeHot> {
  List<GoodsItem> get _items {
    if (widget.result.subTypes.isEmpty) {
      return [];
    }
    return widget.result.subTypes.first.goodsItems.items.take(2).toList();
  }

  List<Widget> _getChildrenList() {
    return _items.map((item) {
      return Container(
        width: 80,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                item.picture,
                width: 80,
                height: 100,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "lib/assets/home_cmd_inner.png",
                    width: 80,
                    height: 100,
                  );
                },
              ),
            ),
            SizedBox(height: 5),
            Text(
              "${item.price}元",
              style: TextStyle(
                fontSize: 12,
                color: const Color.fromARGB(255, 86, 24, 20),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Text(
          widget.type == "step" ? "一站買全" : "爆款推薦",
          style: TextStyle(
            color: const Color.fromARGB(255, 86, 24, 20),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(width: 10),
        Text(
          widget.type == "step" ? "精心優選" : "最受歡迎",
          style: TextStyle(
            fontSize: 12,
            color: const Color.fromARGB(255, 124, 63, 58),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: widget.type == "step"
              ? const Color.fromARGB(255, 249, 247, 219)
              : const Color.fromARGB(255, 211, 228, 240),
        ),
        child: Column(
          children: [
            _buildHeader(),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _getChildrenList(),
            ),
          ],
        ),
      ),
    );
  }
}
