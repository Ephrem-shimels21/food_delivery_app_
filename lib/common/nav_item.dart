import "package:flutter/material.dart";
import "package:food_delivery_appb/utils/color_extension.dart";

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () => onTap(0),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: currentIndex == 0
                    ? UniversalColors.primary.withOpacity(0.2)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(Icons.home,
                      color: currentIndex == 0
                          ? UniversalColors.primary
                          : UniversalColors.primary.withOpacity(0.6)),
                  const SizedBox(width: 5),
                  currentIndex == 0 ? const Text('Home') : Container(),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => onTap(1),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: currentIndex == 1
                    ? UniversalColors.primary.withOpacity(0.2)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(Icons.person,
                      color: currentIndex == 1
                          ? UniversalColors.primary
                          : UniversalColors.primary.withOpacity(0.6)),
                  const SizedBox(width: 5),
                  currentIndex == 1 ? const Text('Profile') : Container(),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => onTap(2),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: currentIndex == 2
                    ? UniversalColors.primary.withOpacity(0.2)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.shopping_cart_outlined,
                      color: currentIndex == 2
                          ? UniversalColors.primary
                          : UniversalColors.primary.withOpacity(0.6)),
                  const SizedBox(width: 10),
                  currentIndex == 2 ? const Text('Cart') : Container(),
                ],
              ),
            ),
          ),

          GestureDetector(
            onTap: () => onTap(3),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: currentIndex == 3
                    ? UniversalColors.primary.withOpacity(0.2)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(Icons.message_outlined,
                      color: currentIndex == 3
                          ? UniversalColors.primary
                          : UniversalColors.primary.withOpacity(0.6)),
                  const SizedBox(width: 5),
                  currentIndex == 3 ? const Text('Chat') : Container(),
                ],
              ),
            ),
          ),
          // Add more items...
        ],
      ),
    );
  }
}
