import 'package:flutter/material.dart';
import 'package:furniture_app/services/constants/colors.dart';
import 'package:furniture_app/services/constants/strings.dart';
import 'package:furniture_app/services/theme/text_styles.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          Strings.makeHome.text,
          style: AppTextStyles.gelasioSemiBold18.copyWith(
            color: AppColors.c909090,
          ),
        ),
        Text(
          Strings.beautiful.text,
          style: AppTextStyles.gelasioBold30
              .copyWith(color: AppColors.c303030, fontSize: 18),
        ),
      ],
    );
  }
}