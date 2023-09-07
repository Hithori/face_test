import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import 'package:face_test/app/app.dart';

class NewsDetailsModalBody extends StatelessWidget {
  const NewsDetailsModalBody({
    super.key,
    required this.text,
    required this.title,
    required this.dateTime,
    required this.timeToRead,
    this.imageUrl,
  });

  final String text;
  final String title;
  final DateTime dateTime;
  final String timeToRead;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ListView(
        children: [
          AppBar(
            title: Text(
              'Новость',
              style: TextStyle(
                color: theme.colors.ui.black,
                fontFamily: 'Sansation',
                fontSize: 18,
                fontWeight: FontWeight.w700,
                height: 1.33,
              ),
            ),
            centerTitle: true,
            leading: SizedBox.shrink(),
            backgroundColor: Colors.transparent,
            actions: const [
              CloseButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Color(0xFFF2F3F7),
                  ),
                ),
                color: Colors.black,
              ),
            ],
          ),
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: theme.colors.background.gray1,
              borderRadius: BorderRadius.circular(12),
            ),
            child: CachedNetworkImage(
              imageUrl: imageUrl ?? '',
              height: 170,
              width: 330,
              imageBuilder: (context, imageProvider) => Image(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
              placeholder: (context, url) => Center(
                child: SizedBox.square(
                  dimension: 32,
                  child: CircularProgressIndicator(
                    color: theme.colors.brand.primary,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Icon(
                Icons.signal_wifi_connected_no_internet_4_outlined,
                color: theme.colors.brand.primary,
                size: 32,
              ),
            ),
          ),
          const Gap(16),
          Text(
            title,
            style: TextStyle(
              color: theme.colors.ui.black,
              fontFamily: 'Sansation',
              fontSize: 18,
              fontWeight: FontWeight.w700,
              height: 1.4,
            ),
          ),
          const Gap(10),
          Text(
            '${DateFormat('dd MMM yyyy').format(dateTime)} '
            '$timeToRead',
            style: TextStyle(
              color: theme.colors.background.gray1,
              fontSize: 12,
              height: 1.4,
              fontWeight: FontWeight.w400,
              fontFamily: 'Sansation',
            ),
          ),
          const Gap(16),
          Text(
            text,
            style: TextStyle(
              color: theme.colors.background.gray1,
              fontFamily: 'Sansation',
              height: 1.4,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
