import 'package:auto_route/annotations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:face_test/app/app.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

@RoutePage()
class ArchivedEventsPage extends StatelessWidget {
  const ArchivedEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'архив мероприятий',
          style: smallTextStyle.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            height: 1,
          ),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            child: Text(
              'очистить',
              style: smallTextStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                height: 1,
              ),
            ),
          ),
          const Gap(16),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.only(
          right: 16,
          left: 16,
          top: 24,
        ),
        separatorBuilder: (context, index) => const Gap(8),
        itemCount: 2,
        itemBuilder: (context, index) => _EventsTile(
          smallTextStyle: smallTextStyle,
        ),
      ),
    );
  }

  static final smallTextStyle = TextStyle(
    color: theme.colors.ui.black,
    height: 1.2,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'Sansation',
  );
}

class _EventsTile extends StatelessWidget {
  const _EventsTile({
    super.key,
    required this.smallTextStyle,
  });

  final TextStyle smallTextStyle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: theme.colors.background.gray4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      contentPadding: const EdgeInsets.all(16),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Text(
          'Петербургский международный экономический форум',
          style: TextStyle(
            color: theme.colors.ui.black,
            height: 1.2,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            fontFamily: 'Sansation',
            letterSpacing: -0.27,
          ),
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'роль: дирекция и тех персонал',
            style: smallTextStyle.copyWith(
              color: const Color(0xFF333037).withOpacity(.5),
            ),
          ),
          const Gap(8),
          Text(
            '18 - 23 фев',
            style: smallTextStyle.copyWith(
              fontSize: 12,
              color: const Color(0xFF333037).withOpacity(.5),
            ),
          ),
        ],
      ),
      trailing: const CircleAvatar(
        radius: 24,
        backgroundImage: CachedNetworkImageProvider(
          'https://loremflickr.com/200/200/news',
        ),
      ),
    );
  }
}
