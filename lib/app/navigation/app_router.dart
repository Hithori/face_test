import 'package:auto_route/auto_route.dart';
import 'package:face_test/features/main_page/children/chat/presentation/pages/chat_page.dart';
import 'package:face_test/features/main_page/children/events/presentation/pages/events_page.dart';
import 'package:face_test/features/main_page/children/main/presentation/pages/main_page.dart';
import 'package:face_test/features/main_page/children/profile/presentation/pages/profile_page.dart';
import 'package:face_test/features/main_page/presentation/pages/main_navigation_page.dart';
import 'package:face_test/features/my_events/presentation/pages/archived_events_page.dart';
import 'package:face_test/features/my_events/presentation/pages/my_events_page.dart';
import 'package:face_test/features/sign_in/sign_in.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SignInRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: MyEventsRoute.page,
        ),
        AutoRoute(
          page: ArchivedEventsRoute.page,
        ),
        AutoRoute(
          page: MainNavigationRoute.page,
          children: [
            AutoRoute(
              page: MainRoute.page,
              initial: true,
            ),
            AutoRoute(
              page: EventsRoute.page,
            ),
            AutoRoute(
              page: ChatRoute.page,
            ),
            AutoRoute(
              page: ProfileRoute.page,
            ),
          ],
        ),
      ];
}
