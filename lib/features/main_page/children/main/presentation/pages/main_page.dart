import 'package:auto_route/annotations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:face_test/app/app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../widgets/widgets.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(
          MediaQuery.of(context).size.width,
          72,
        ),
        child: const SafeArea(
          child: FaceAppBar(),
        ),
      ),
      body: SizedBox(
        child: Column(
          children: [
            _CustomSegmentedControl(
              pageController: pageController,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 210,
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                children: [
                  const _Swiper(),
                  ListView.separated(
                    padding:
                        const EdgeInsets.only(left: 24, right: 24, top: 24),
                    itemCount: 15,
                    itemBuilder: (context, index) => TrendCard(
                      title:
                          'Последние разработки в области энергоэффективности, '
                          'инженерных систем, архитектуры и '
                          'дизайна: что покажет Россия на выставке UzBuild',
                      date: DateTime(2023, 2, 28),
                      howMuchToRead: '5 минут',
                      imageUrl:
                          'https://loremflickr.com/300/300/news?lock=$index',
                      onTap: () => showModalBottomSheet(
                        context: context,
                        useSafeArea: true,
                        showDragHandle: true,
                        enableDrag: true,
                        isScrollControlled: true,
                        backgroundColor: Colors.white,
                        builder: (context) => NewsDetailsModalBody(
                          title: 'Последние разработки в области '
                              'энергоэффективности, инженерных систем, '
                              'архитектуры и дизайна: что покажет '
                              'Россия на выставке UzBuild',
                          text:
                              '''28 февраля в Ташкенте Российский экспортный центр (входит в ВЭБ.РФ) впервые открыл российский павильон на крупнейшей строительной выставке в Узбекистане. Под брендом Made in Russia на UzBuild 20 российских компаний представят свои достижения и новейшие разработки в сфере строительства.
На выставке российские компании продемонстрируют инновационные технологии и материалы, которые уже успешно применяются в строительной отрасли. Посетители смогут ознакомиться с последними разработками в области энергоэффективности, инженерных систем, архитектуры и дизайна.
Экспозиция Made in Russia площадью более 350 кв.м занимает одно из главных мест на выставке. На стенде российские компании проведут переговоры с представителями специалистов строительной отрасли Узбекистана, Казахстана, Киргизии, Таджикистана и других стран.
«Участие России в UzBuild под национальным брендом является важным шагом в укреплении экономических связей и развитии строительной отрасли наших стран. В течение следующих четырех дней участники проведут более 150 целевых встреч с потенциальными партнерами и наладят деловые связи. Российский экспортный центр, в свою очередь, будет оказывать им поддержку на каждом этапе выхода на рынок Узбекистана», — отметил представитель РЭЦ в Узбекистане Павел Буханов.
«Узбекистан интересен российским компаниям, и главное, что этот интерес взаимный. Наши компании представляют на UzBuild качественную продукцию, которая пользуется спросом на местном рынке. Уверен, работа будет плодотворная и переговоры приведут к долгосрочному сотрудничеству», — отметил Заместитель председателя ВЭБ.РФ Даниил Алгульян.
Бренд «Сделано в России» Российский экспортный центр продвигает в партнерстве с Фондом Росконгресс.
''',
                          dateTime: DateTime.now(),
                          timeToRead: '5 мин',
                          imageUrl:
                              'https://loremflickr.com/500/600/news?lock=$index',
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => const Gap(8),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Swiper extends StatelessWidget {
  const _Swiper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Swiper(
        outer: true,
        // itemHeight: (500 / 812) * MediaQuery.of(context).size.height,

        /// пока outer: true мы не можем использовать иные виды пагинации
        pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            color: theme.colors.brand.secondary,
            activeColor: theme.colors.ui.black,
          ),
          alignment: Alignment.bottomCenter,
        ),
        indicatorLayout: PageIndicatorLayout.WARM,
        loop: false,
        // pagination: SwiperCustomPagination(
        //   builder: (context, config) {
        //     return Row(
        //       children: List.generate(
        //         config.itemCount,
        //         (index) {
        //           final active = config.activeIndex == index;
        //           return Container(
        //             width: active ? 16 : 8,
        //             height: 8,
        //             decoration: BoxDecoration(
        //               color: active
        //                   ? theme.colors.ui.black
        //                   : theme.colors.brand.secondary,
        //               borderRadius: BorderRadius.circular(24),
        //             ),
        //           );
        //         },
        //       ),
        //     );
        //   },
        // ),
        viewportFraction: .9,
        itemCount: 3,
        itemBuilder: (context, index) => SwiperCard(
          imageUrl: 'https://loremflickr.com/327/500/city?lock=$index',
          content: [
            const Icon(
              Icons.account_balance_sharp,
              size: 88,
              color: Color(0xFFD8BE95),
            ),
            const Gap(16),
            Text(
              '11–13 мая | Экспофорум ',
              style: TextStyle(
                fontFamily: 'Sansation',
                color: theme.colors.ui.white.withOpacity(.9),
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
            const Gap(16),
            Text(
              'Петербургский международный юридический форум 2023',
              style: TextStyle(
                fontFamily: 'Sansation',
                color: theme.colors.ui.white,
                fontSize: 20.3,
                fontWeight: FontWeight.w700,
                height: 1.5,
              ),
            ),
            const Gap(16),
            Text(
              'Санкт-Петербург, Россия',
              style: TextStyle(
                fontFamily: 'Sansation',
                color: theme.colors.ui.white,
                fontWeight: FontWeight.w400,
                fontSize: 12,
                height: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SwiperCard extends StatelessWidget {
  const SwiperCard({
    super.key,
    required this.imageUrl,
    required this.content,
    this.shareButtonCallback,
  });

  final String imageUrl;
  final List<Widget> content;
  final VoidCallback? shareButtonCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.all(8),
      height: 500 / 812 * MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: CachedNetworkImageProvider(
            imageUrl,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox.square(
                dimension: 48,
                child: ActionButton(
                  icon: Icon(
                    Icons.reply,
                    color: theme.colors.ui.white,
                    size: 24,
                  ),
                  minWidth: 48,
                  padding: const EdgeInsets.all(12),
                  color: theme.colors.ui.white.withOpacity(.32),
                  onPressed: shareButtonCallback,
                ),
              ),
            ],
          ),
          const Spacer(),
          ...content,
        ],
      ),
    );
  }
}

class _CustomSegmentedControl extends StatefulWidget {
  const _CustomSegmentedControl({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  State<_CustomSegmentedControl> createState() =>
      _CustomSegmentedControlState();
}

class _CustomSegmentedControlState extends State<_CustomSegmentedControl> {
  int groupValue = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl<int>(
      children: const {
        0: Text('Мероприятия'),
        1: Text('Новости'),
      },
      onValueChanged: (value) {
        if (value != null) {
          setState(() {
            groupValue = value;
          });
          widget.pageController.animateToPage(
            value,
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear,
          );
        }
      },
      groupValue: groupValue,
    );
  }
}
