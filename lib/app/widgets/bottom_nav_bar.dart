import 'package:face_test/app/app.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _BottomNavBarItem(
          label: 'главная',
          icon: Icon(
            Icons.house_outlined,
            size: 24,
            color: theme.colors.ui.black,
          ),
          isActive: true,
        ),
        _BottomNavBarItem(
          label: 'мероприятия',
          icon: Icon(
            Icons.event,
            size: 24,
            color: theme.colors.ui.black,
          ),
          isActive: true,
        ),
        _BottomNavBarItem(
          label: 'чат',
          icon: Icon(
            Icons.chat,
            size: 24,
            color: theme.colors.ui.black,
          ),
          isActive: true,
        ),
        _BottomNavBarItem(
          label: 'мой профиль',
          icon: Icon(
            Icons.account_circle,
            size: 24,
            color: theme.colors.ui.black,
          ),
          isActive: true,
        ),
      ],
    );
  }
}

class _BottomNavBarItem extends StatelessWidget {
  const _BottomNavBarItem({
    super.key,
    required this.icon,
    required this.label,
    this.labelColor,
    required this.isActive,
  });

  final Icon icon;
  final String label;
  final Color? labelColor;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        icon,
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: labelColor ?? theme.colors.ui.black,
            fontFamily: 'Sansation',
            fontSize: 12,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.24,
          ),
        ),
        Container(
          width: 4,
          height: 4,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.colors.brand.primary,
          ),
        ),
      ],
    );
  }
}
