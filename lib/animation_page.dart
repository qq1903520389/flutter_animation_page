library animation_page;

import 'package:flutter/material.dart';

mixin AnimationPageMixin<T extends StatefulWidget> on TickerProviderStateMixin<T> {
  AnimationController animationController;
  Duration animationPageDuration = const Duration(milliseconds: 1000);

  @override
  void initState() {
    super.initState();
    animationController ??= AnimationController(duration: animationPageDuration, vsync: this);
    animationController.forward();
  }

  ///瀛愮被閲嶅啓widgetList get鏂规硶
  @protected
  List<Widget> get widgetList;

  List<Widget> initAnimationList() {
    List<Widget> list = [];
    int count = widgetList.length;
    for (int i = 0; i < count; i++) {
      final Animation<double> animation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Interval((1 / count) * i, 1.0, curve: Curves.fastOutSlowIn),
        ),
      );
      list.add(buildAnimationWidget(animation, animationController, widgetList[i]));
    }
    return list;
  }

  buildAnimationWidget(Animation animation, AnimationController controller, Widget child) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return Opacity(
          opacity: animation.value,
          child: Transform(
            transform: buildTransform(animation),
            child: child,
          ),
        );
      },
      child: child,
    );
  }

  buildTransform(Animation animation) {
    return Matrix4.translationValues(0, 10 * (1.0 - animation.value), 0.0);
  }
}