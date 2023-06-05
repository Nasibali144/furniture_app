import 'package:flutter/material.dart';
import 'package:furniture_app/screens/product_screen.dart';
import 'package:furniture_app/services/constants/images.dart';
import 'package:furniture_app/services/constants/svg_icons.dart';
import 'package:furniture_app/views/home_components/products_widgets.dart';

class CustomProduct extends StatefulWidget {
  const CustomProduct({Key? key}) : super(key: key);

  @override
  State<CustomProduct> createState() => _CustomProductState();
}

class _CustomProductState extends State<CustomProduct> {

  late final ScrollController scrollController;

  List<AppImage> list = [
    AppImage.product,
    AppImage.product1,
    AppImage.product2,
    AppImage.product3,
    AppImage.product4,
    AppImage.product5,
    AppImage.product6,
    AppImage.product7,
    AppImage.product8,
    AppImage.product9,
    AppImage.product10,
    AppImage.product11,
    AppImage.product12,
    AppImage.product13,
  ];
  List<String> title = [];

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: scrollController,
      padding: const EdgeInsets.all(10.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        childAspectRatio: 2 / 3.3,
      ),
      itemCount: list.length,
      itemBuilder: (context, i) => CustomProductWidget(
        onPressedProduct: () {
          Navigator.of(context).pushNamed(ProductScreen.id);
        },
        imageProvider: list[i].img,
        onPressedCart: () {},
        widget: SvgIcon.bag,
        title: "Coffee Table",
        subTitle: "\$ 50.00",
      ),
    );
  }
}
