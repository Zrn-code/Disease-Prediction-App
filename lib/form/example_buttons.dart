import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:appinio_swiper/appinio_swiper.dart';

class ExampleButton extends StatelessWidget {
  final Function onTap;
  final Widget child;

  const ExampleButton({
    required this.onTap,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: child,
    );
  }
}

//swipe card to the right side
Widget swipeRightButton(AppinioSwiperController controller) {
  return ExampleButton(
    onTap: () => controller.swipeRight(),
    child: Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: CupertinoColors.activeGreen,
        borderRadius: BorderRadius.circular(50),
      ),
      alignment: Alignment.center,
      child: const Icon(
        Icons.check,
        color: CupertinoColors.white,
        size: 40,
      ),
    ),
  );
}

//swipe card to the left side
Widget swipeLeftButton(AppinioSwiperController controller) {
  return ExampleButton(
    onTap: () => controller.swipeLeft(),
    child: Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: const Color(0xFFFF3868),
        borderRadius: BorderRadius.circular(50),
      ),
      alignment: Alignment.center,
      child: const Icon(
        Icons.close,
        color: CupertinoColors.white,
        size: 40,
      ),
    ),
  );
}

//unswipe card
Widget unswipeButton(AppinioSwiperController controller) {
  return ExampleButton(
    onTap: () => controller.unswipe(),
    child: Container(
      height: 60,
      width: 60,
      alignment: Alignment.center,
      child: const Icon(
        Icons.rotate_left_rounded,
        color: CupertinoColors.systemGrey2,
        size: 40,
      ),
    ),
  );
}

Widget selectFemaleButton(AppinioSwiperController controller) {
  return ExampleButton(
    onTap: () => controller.swipeLeft(),
    child: Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: CupertinoColors.systemPink,
        borderRadius: BorderRadius.circular(50),
      ),
      alignment: Alignment.center,
      child: const Icon(
        Icons.female,
        color: CupertinoColors.white,
        size: 40,
      ),
    ),
  );
}

//swipe card to the left side
Widget selectMaleButton(AppinioSwiperController controller) {
  return ExampleButton(
    onTap: () => controller.swipeRight(),
    child: Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: CupertinoColors.activeBlue,
        borderRadius: BorderRadius.circular(50),
      ),
      alignment: Alignment.center,
      child: const Icon(
        Icons.male,
        color: CupertinoColors.white,
        size: 40,
      ),
    ),
  );
}
