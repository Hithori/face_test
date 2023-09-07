import 'package:cached_network_image/cached_network_image.dart';
import 'package:face_test/app/app.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class TrendCard extends StatelessWidget {
  const TrendCard({
    super.key,
    required this.title,
    required this.date,
    required this.howMuchToRead,
    this.imageUrl,
    this.onTap,
  });

  final String title;
  final DateTime date;
  final String howMuchToRead;
  final String? imageUrl;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 130,
        width: MediaQuery.of(context).size.width - 48,
        padding: const EdgeInsets.all(16),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: theme.colors.background.gray4,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            SizedBox(
              // screen size - list padding - card padding - image size - gap
              width: MediaQuery.of(context).size.width - 48 - 32 - 96 - 18,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      title,
                      maxLines: 3,
                      style: TextStyle(
                        color: theme.colors.ui.black,
                        fontSize: 12,
                        height: 1.4,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Sansation',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Text(
                    '${DateFormat('dd MMM yyyy').format(date)} '
                    '$howMuchToRead',
                    style: TextStyle(
                      color: theme.colors.background.gray1,
                      fontSize: 10,
                      height: 1.4,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Sansation',
                    ),
                  ),
                ],
              ),
            ),
            const Gap(18),
            Container(
              width: 96,
              height: 96,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: (imageUrl != null)
                  ? CachedNetworkImage(
                      imageUrl: imageUrl!,
                    )
                  : Center(
                      child: Icon(
                        Icons.signal_wifi_connected_no_internet_4_outlined,
                        size: 32,
                        color: theme.colors.brand.primary,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
