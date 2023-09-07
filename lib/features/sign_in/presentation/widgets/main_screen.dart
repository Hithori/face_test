import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:face_test/app/app.dart';
import 'package:face_test/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final PageController pageController;

  late final List<String Function()> titles;

  late final List<String Function()> descriptions;

  late final TextStyle titleTextStyle;
  late final TextStyle descriptionTextStyle;

  int page = 0;

  @override
  void initState() {
    super.initState();

    titleTextStyle = TextStyle(
      color: theme.colors.ui.white,
      fontFamily: 'Sansation',
      fontSize: 24,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      height: 20 / 24,
    );

    descriptionTextStyle = TextStyle(
      color: theme.colors.ui.white,
      fontFamily: 'Sansation',
      fontFeatures: const [
        FontFeature('figa', 0),
      ],
      fontSize: 16,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      height: 20 / 16,
    );

    pageController = PageController();
    titles = <String Function()>[
      () => S.of(context).uniqueServices,
      () => S.of(context).notificationCenter,
      () => S.of(context).eventProgram,
    ];

    descriptions = <String Function()>[
      () => S.of(context).uniqueServicesDesc,
      () => S.of(context).notificationCenterDesc,
      () => S.of(context).eventProgramDesc,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: pageController,
          onPageChanged: (value) {
            setState(() {
              page = value;
            });
          },
          children: const [
            _PhotoWrapper(
              imagePath: 'assets/main_screen/1.jpeg',
            ),
            _PhotoWrapper(
              imagePath: 'assets/main_screen/2.jpeg',
            ),
            _PhotoWrapper(
              imagePath: 'assets/main_screen/3.jpeg',
            ),
          ],
        ),
        Container(
          alignment: Alignment.topRight,
          margin: const EdgeInsets.only(
            top: 61,
            right: 24,
          ),
          child: FilledButton(
            onPressed: context.router.pop,
            style: ButtonStyle(
              backgroundColor: const MaterialStatePropertyAll(
                Color.fromRGBO(242, 243, 245, .4),
              ),
              padding: const MaterialStatePropertyAll(
                EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
              ),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            child: Text(
              'Пропустить',
              style: descriptionTextStyle.copyWith(
                fontSize: 12,
                height: 20 / 12,
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.only(bottom: 32),
          child: Container(
            width: MediaQuery.of(context).size.width - 48,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            height: 200,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    titles[page](),
                    textAlign: TextAlign.center,
                    style: titleTextStyle,
                  ),
                  const Gap(16),
                  Text(
                    descriptions[page](),
                    textAlign: TextAlign.center,
                    style: descriptionTextStyle,
                  ),
                  const Gap(16),
                  ActionButton(
                    icon: Text(
                      page != titles.length - 1 ? 'Далее' : 'Начать работу',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: theme.colors.ui.white,
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
                    color: theme.colors.brand.primary,
                    onPressed: page != titles.length - 1
                        ? () => pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linear,
                            )
                        : () {
                            context.router.pop();
                          },
                  ),
                  const Gap(16),
                  ConstrainedBox(
                    constraints: BoxConstraints.loose(
                      const Size(44, 8),
                    ),
                    child: SizedBox(
                      width: 44,
                      height: 8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ...List.generate(
                            3,
                            (index) {
                              final active = index == page;
                              return Container(
                                width: active ? 16 : 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: active
                                      ? theme.colors.brand.primary
                                      : theme.colors.brand.secondary,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _PhotoWrapper extends StatelessWidget {
  const _PhotoWrapper({
    required this.imagePath,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage(
            imagePath,
          ),
        ),
      ),
      child: const DecoratedBox(
        decoration: BoxDecoration(
          gradient: Gradients.mainScreen,
        ),
      ),
    );
  }
}
