import 'dart:ui';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:face_test/font_icons/face_logo_icons.dart';
import 'package:face_test/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../app/app.dart';
import '../presentation.dart';

@RoutePage()
class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Center(
              child: Icon(
                FaceLogo.logo,
                size: 45,
                color: theme.colors.brand.primary,
              ),
            ),
            AnimatedPositioned(
              bottom: 32,
              duration: const Duration(
                milliseconds: 300,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                height: 128,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    ActionButton(
                      text: S.of(context).loginButtonLabel,
                      textColor: theme.colors.ui.white,
                      color: theme.colors.brand.primary,
                      onPressed: () => showModalBottomSheet(
                        context: context,
                        builder: (context) => const MainScreen(),
                        isScrollControlled: true,
                        enableDrag: false,
                      ).then(
                        (value) => context.router.push(
                          const MainNavigationRoute(),
                        ),
                      ),
                    ),
                    const Gap(16),
                    ActionButton(
                      text: S.of(context).signInWithoutAuth,
                      textColor: theme.colors.brand.primary,
                      color: theme.colors.brand.secondary,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
