import 'package:flutter/material.dart';
import 'package:food_delivery_appb/common/nav_item.dart';
import 'package:go_router/go_router.dart';

class BottomBar extends StatefulWidget {
  final Widget child;
  const BottomBar({super.key, required this.child});

  @override
  State<BottomBar> createState() => _BottomBar();
}

class _BottomBar extends State<BottomBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar:
          CustomBottomNavBar(currentIndex: currentIndex, onTap: changeTab),
    );
  }

  void changeTab(int index) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/home');
        break;
      case 2:
        context.push('/orders');
        break;
      case 3:
        context.go('/home');
        break;
    }

    setState(() {
      currentIndex = index;
    });
  }
}
