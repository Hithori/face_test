import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:face_test/app/app.dart';
import 'package:face_test/app/widgets/widgets.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MainNavigationPage extends StatelessWidget {
  const MainNavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
      physics: const NeverScrollableScrollPhysics(),
      routes: const [
        MainRoute(),
        EventsRoute(),
        ChatRoute(),
        ProfileRoute(),
      ],
      builder: (context, child, pageController) {
        final tabsRouter = AutoTabsRouter.of(context);
        return SafeArea(
          child: Scaffold(
            backgroundColor: theme.colors.ui.white,
            body: child,
            bottomNavigationBar: _CustomNavBar(
              tabsRouter: tabsRouter,
            ),
          ),
        );
      },
    );
  }
}

class _CustomNavBar extends StatelessWidget {
  const _CustomNavBar({
    super.key,
    required this.tabsRouter,
  });

  final TabsRouter tabsRouter;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: theme.colors.background.gray4_2,
      selectedItemColor: theme.colors.ui.black,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(
        color: theme.colors.ui.black,
        fontFamily: 'Sansation',
        fontSize: 12,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.24,
      ),
      unselectedLabelStyle: TextStyle(
        color: theme.colors.background.gray4_2,
        fontFamily: 'Sansation',
        fontSize: 12,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.24,
      ),
      onTap: tabsRouter.setActiveIndex,
      currentIndex: tabsRouter.activeIndex,
      items: const [
        BottomNavigationBarItem(
          label: 'главная',
          icon: Icon(
            Icons.home_outlined,
          ),
        ),
        BottomNavigationBarItem(
          label: 'мероприятия',
          icon: Icon(
            Icons.calendar_today_outlined,
          ),
        ),
        BottomNavigationBarItem(
          label: 'чат',
          icon: Icon(
            Icons.chat_bubble_outline,
          ),
        ),
        BottomNavigationBarItem(
          label: 'мой профиль',
          icon: Icon(
            Icons.account_circle,
          ),
        ),
      ],
    );
  }
}
