import 'package:attendance/core/widgets/attatchements/cashed_images.dart';
import 'package:attendance/core/widgets/attatchements/pdf_widget.dart';
import 'package:attendance/core/widgets/attatchements/vedio_widget.dart';
import 'package:attendance/features/notification/domain/entities/notification_entity.dart';
import 'package:attendance/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key, required this.notification});
  final NotificationEntity notification;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(Assets.icons.notification, width: 40),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notification.title ?? "",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      notification.body ?? "",
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      DateFormat(
                        'yyyy-MM-dd',
                      ).format(notification.date ?? DateTime.now()),
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 8),
                    if (notification.attatchments!.isNotEmpty)
                      SizedBox(
                        height: 100.h,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            spacing: 16,
                            children: List.generate(
                              notification.attatchments!.length,
                              (index) => AspectRatio(
                                aspectRatio: 1,
                                child: getAttatchmentWidget(
                                  url: notification.attatchments![index],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getAttatchmentWidget({required String url}) {
    switch (getAttatchmentType(url: url)) {
      case "jpg" || "jpeg" || "png" || "gif" || "webp":
        return CachedImage(url: url, radius: 20, showImageOnTap: true);
      case "pdf":
        return PdfWidget(url: url, showImageOnTap: true);
      case "mp4":
        return VideoWidget(url: url);
      default:
        return const SizedBox();
    }
  }

  String getAttatchmentType({required String url}) {
    return url.split('.').last;
  }
}
