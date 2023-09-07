import 'dart:ui';

import 'package:face_test/app/app.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ActionButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? icon;
  final Color? color;
  final EdgeInsets padding;
  final String? text;
  final TextStyle? textStyle;
  final Color? textColor;
  final double? minWidth;
  final int? counter;

  const ActionButton({
    super.key,
    this.icon,
    this.text,
    this.textStyle,
    this.textColor,
    this.onPressed,
    this.color,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 10,
    ),
    this.minWidth,
    this.counter,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      /// default value: 88 by material/button_theme.dart
      minWidth: minWidth ?? 88,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          FilledButton(
            onPressed: onPressed,
            style: ButtonStyle(
              minimumSize: const MaterialStatePropertyAll(
                Size(24, 24),
              ),
              padding: MaterialStatePropertyAll(
                padding,
              ),
              backgroundColor: MaterialStatePropertyAll(color),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              fixedSize: const MaterialStatePropertyAll(
                Size.fromHeight(56),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (text != null)
                  Text(
                    text!,
                    textAlign: TextAlign.center,
                    style: textStyle ??
                        TextStyle(
                          color: textColor ?? theme.colors.ui.black,
                          fontFeatures: const [
                            FontFeature('figa', 0),
                          ],
                          fontFamily: 'Sansation',
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700,
                          height: 20 / 16,
                        ),
                  ),
                if (text != null && icon != null) const Gap(8),
                if (icon != null) icon!,
              ],
            ),
          ),
          if (counter != null)
            Positioned(
              right: 0,
              top: -5,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: theme.colors.brand.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '$counter',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: theme.colors.ui.white,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Sansation',
                    fontSize: 12,
                    height: 16 / 12,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
