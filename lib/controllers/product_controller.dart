import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:furniture_app/controllers/base_controller.dart';
import 'package:furniture_app/models/cart_item_model.dart';
import 'package:furniture_app/models/product_model.dart';
import 'package:furniture_app/services/constants/colors.dart';
import 'package:furniture_app/services/constants/strings.dart';
import 'package:furniture_app/services/theme/text_styles.dart';
import 'package:furniture_app/views/product_components/text_button.dart';

class ProductController extends BaseController {
  void Function(void Function())? updater;
  // Product barcha pagelarda suzib yurish uchun olingan !
  Product product;
  bool isLoading = false;
  int count = 1;
  double sum = 0;
  bool isFavourite = false;
  int color = 0;

  ProductController({
    this.updater,
    required this.product,
  }) {
    sum = product.price;
  }

  //  Maxsulotga ++ qiluvchi Amal
  void increment() {
    count++;
    sum += product.price;
    updater!(() {});
  }

  //  Maxsulotga -- qiluvchi Amal
  void decrement() {
    if (count > 1) {
      count--;
      sum -= product.price;
      updater!(() {});
    }
  }

  void btnFavourite() {
    isFavourite = !isFavourite;
    updater!(() {});
  }

  void btnBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  void addToCard(BuildContext context) async {
    updater!(() {});
    final cart = CartItem(
      id: Random().nextInt(100).toString(),
      product: product,
      total: sum,
      createAt: DateTime.now().toString(),
      modifyAt: DateTime.now().toString(),
      userId: "01",
      quantity: count,
      color: color,
    );
    print(cart);
    showSuccessMessage(context);
    updater!(() {});
  }

  // Rating Review
  void btnReview(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.black,
      context: context,
      builder: (context) => BottomSheet(
        onClosing: () {},
        builder: (context) => SizedBox(
          width: MediaQuery.of(context).size.width * .8,
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              AppTextButton(
                label: Strings.addToCart.text,
                onPress: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showSuccessMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.c303030,
        content: Text(
          Strings.success.text,
          style: AppTextStyles.nunitoSansBold14,
        ),
      ),
    );
  }
}
