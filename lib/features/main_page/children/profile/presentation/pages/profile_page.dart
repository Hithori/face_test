import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:face_test/app/app.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      style: ListTileStyle.list,
      horizontalTitleGap: 10,
      tileColor: theme.colors.background.gray3,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: theme.colors.background.gray2,
          width: 1,
        ),
      ),
      iconColor: theme.colors.background.gray1,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'мой профиль',
              style: TextStyle(
                color: theme.colors.ui.black,
                fontSize: 32,
                fontWeight: FontWeight.w700,
                height: 1.2,
                letterSpacing: -1.3,
                fontFamily: 'Sansation',
              ),
            ),
            const Gap(18),
            const ProfileRow(),
            const Gap(24),
            const Text('Основное'),
            ListTile(
              leading: const _IconWrapper(
                Icons.notifications_outlined,
                isRed: true,
              ),
              title: Text(
                'Центр уведомлений',
                style: baseTextStyle,
              ),
              trailing: const _IconWrapper(Icons.chevron_right),
            ),
            const Gap(8),
            ListTile(
              onTap: () => context.router.push(
                const MyEventsRoute(),
              ),
              leading: const _IconWrapper(
                Icons.calendar_today_outlined,
                isRed: true,
              ),
              title: Text(
                'Мои мероприятия',
                style: baseTextStyle,
              ),
              trailing: const _IconWrapper(Icons.chevron_right),
            ),
            const Gap(8),
            ListTile(
              leading: const _IconWrapper(
                Icons.work_outline,
                isRed: true,
              ),
              title: Text(
                'Сервисы',
                style: baseTextStyle,
              ),
              trailing: const _IconWrapper(Icons.chevron_right),
            ),
            const Gap(8),
            ListTile(
              leading: const _IconWrapper(
                Icons.verified_outlined,
                isRed: true,
              ),
              title: Text(
                'Статус бейдж и ТС',
                style: baseTextStyle,
              ),
              trailing: const _IconWrapper(Icons.chevron_right),
            ),
            const Gap(8),
            ListTile(
              leading: const _IconWrapper(
                Icons.settings_outlined,
                isRed: true,
              ),
              title: Text(
                'Настройки аккаунта',
                style: baseTextStyle,
              ),
              trailing: const _IconWrapper(Icons.chevron_right),
            ),
            const Gap(24),
            ListTile(
              title: Text(
                'Выйти из аккаунта',
                style: baseTextStyle.copyWith(
                  fontSize: 16,
                  height: 1.375,
                  color: const Color(0xFFFF4141),
                ),
              ),
              onTap: () => context.router.replaceAll([
                const SignInRoute(),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  static final baseTextStyle = TextStyle(
    color: theme.colors.ui.black,
    fontFamily: 'Sansation',
    fontWeight: FontWeight.w700,
    height: 1.47,
    fontSize: 15,
  );
}

class ProfileRow extends StatelessWidget {
  const ProfileRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Padding(
        padding: EdgeInsets.only(bottom: 8.0),
        child: Text(
          'Николай Кунаев',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            height: 1.2,
            fontFamily: 'Sansation',
          ),
        ),
      ),
      subtitle: Wrap(
        children: [
          Badge(
            largeSize: 24,
            backgroundColor: theme.colors.ui.black,
            label: const Text(
              'ID: 5707',
              style: TextStyle(
                fontFamily: 'Sansation',
                fontSize: 14,
                height: 1.43,
                fontWeight: FontWeight.w700,
              ),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 2,
            ),
          ),
        ],
      ),
      leading: const CircleAvatar(
        radius: 36,
        foregroundImage: CachedNetworkImageProvider(
          'https://avatars.githubusercontent.com/u/46851754?v=4',
        ),
      ),
    );
  }
}

class _IconWrapper extends StatelessWidget {
  const _IconWrapper(
    this.icon, {
    this.isRed = false,
  });

  final bool isRed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 24,
      color: isRed ? theme.colors.brand.primary : theme.colors.ui.black,
    );
  }
}
