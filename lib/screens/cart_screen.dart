import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/controllers/cart_controller.dart';
import 'package:furniture_app/controllers/data_controller/cart_manager.dart';
import 'package:furniture_app/models/cart_item_model.dart';
import 'package:furniture_app/models/cart_model.dart';
import 'package:furniture_app/models/category_model.dart';
import 'package:furniture_app/models/product_model.dart';
import 'package:furniture_app/services/constants/colors.dart';
import 'package:furniture_app/services/constants/strings.dart';
import 'package:furniture_app/services/theme/text_styles.dart';
import 'package:furniture_app/views/cart_components/cart_components.dart';

void main(List<String> args) {
  runApp(const CartScreen());
}

class CartScreen extends StatefulWidget {
  static const id = "/cart";
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  late final CartController controller;

  @override
  void initState() {
    controller = CartController(updater: setState);
    super.initState();
  }

  TextEditingController promoCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.cFFFFFF,
            elevation: 0,
            leading: GestureDetector(
              onTap: () => controller.getBack(context),
              child: const Icon(
                CupertinoIcons.chevron_back,
                color: Colors.black,
                size: 30,
              ),
            ),
            title: Text(
              Strings.myCart.text,
              style: AppTextStyles.merriWeatherBold18.copyWith(
                color: AppColors.c303030,
              ),
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.58,
                      child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          return CartItemWidget(
                            
                            textLink: Strings.minimalStand.text,
                            controller: controller,
                            index: index,
                          );
                        },
                        itemCount: cartManager.cart.carts.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Divider(),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 55,
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: AppColors.cFFFFFF,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: TextField(
                                  controller: promoCodeController,
                                  decoration: const InputDecoration(
                                      hintText: "Enter your promo code",
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none)),
                                ),
                              ),
                              SizedBox(
                                height: 55,
                                width: 55,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: AppColors.c303030),
                                  child: const Center(
                                      child: Icon(
                                    CupertinoIcons.chevron_forward,
                                    color: AppColors.cFFFFFF,
                                  )),
                                ),
                              )
                            ],
                          )),
                    ),
                    TotalSumm(
                      controller: controller,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.5),
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              fixedSize:
                                  Size(MediaQuery.of(context).size.width, 60),
                              backgroundColor: AppColors.c303030,
                              elevation: 15,
                              shadowColor: Colors.black),
                          child: Text(
                            Strings.checkOut.text,
                            style: AppTextStyles.nunitoSansBold20,
                          )),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
