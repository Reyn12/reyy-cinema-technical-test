import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/features/main_navigation/widgets/custom_bottom_nav_bar_item.dart';

class NavItem {
  final String label;
  final String iconPath;
  final String? activeIconPath;

  const NavItem({
    required this.label,
    required this.iconPath,
    this.activeIconPath,
  });
}

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final List<NavItem> navItems;
  final Function(int) onNavItemSelected;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.navItems,
    required this.onNavItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: EdgeInsets.only(
        top: 10,
        bottom: MediaQuery.of(context).padding.bottom + 5,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        // boxShadow: [
        //   BoxShadow(
        //     color: AppColors.shadowColor.withValues(alpha: 0.1),
        //     spreadRadius: 0,
        //     blurRadius: 7,
        //     offset: const Offset(0, -2),
        //   ),
        // ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: navItems
                .asMap()
                .entries
                .map(
                  (entry) => Expanded(
                    child: CustomBottomNavBarItem(
                      isActive: entry.key == currentIndex,
                      index: entry.key,
                      label: entry.value.label,
                      iconPath: entry.value.iconPath,
                      activeIconPath: entry.value.activeIconPath,
                      onTap: () => onNavItemSelected(entry.key),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

