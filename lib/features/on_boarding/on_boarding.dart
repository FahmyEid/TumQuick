import 'package:flutter/material.dart';
import 'package:yumquick/core/app_assets.dart';
import 'package:yumquick/features/on_boarding/on_boarding_item.dart';
import 'package:yumquick/features/on_boarding/on_boarding_model.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController controller = PageController();
  int current = 0;

  final List<OnBoardingModel> list = [
    OnBoardingModel(
      image: AppAssets.onBoarding1,
      logo: AppAssets.transferIcon,
      title: "Order for Food",
      button: "Next",
      skip: "Skip >",
    ),
    OnBoardingModel(
      image: AppAssets.onBoarding2,
      logo: AppAssets.cardIcon,
      title: "Easy Payment",
      button: "Next",
      skip: "Skip >",
    ),
    OnBoardingModel(
      image: AppAssets.onBoarding3,
      logo: AppAssets.deliverBoyIcon,
      title: "Fast Delivery",
      button: "Next",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: controller,
        itemCount: list.length,
        onPageChanged: (index) {
          setState(() {
            current = index;
          });
        },
        itemBuilder: (context, index) {
          final model = list[index];
          return OnBoardingItem(
            model: model,
            controller: controller,
            currentIndex: current,
            totalPages: list.length,
            isLast: index == list.length - 1,
          );
        },
      ),
    );
  }
}
