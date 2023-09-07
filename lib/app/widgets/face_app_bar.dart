import 'dart:ui';

import 'package:face_test/app/app.dart';
import 'package:face_test/font_icons/face_logo_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FaceAppBar extends StatelessWidget {
  const FaceAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16,
      ),
      child: Row(
        children: [
          Icon(
            FaceLogo.logo,
            size: 42,
            color: theme.colors.brand.primary,
          ),
          const Spacer(),
          ActionButton(
            text: 'О фонде',
            textColor: theme.colors.ui.black,
            color: theme.colors.background.gray4,
          ),
          const Gap(6),
          ActionButton(
            padding: const EdgeInsets.all(8),
            icon: Icon(
              Icons.notifications_outlined,
              size: 24,
              color: theme.colors.ui.black,
            ),
            counter: 1,
            color: theme.colors.background.gray4,
          ),
        ],
      ),
    );
  }
}
