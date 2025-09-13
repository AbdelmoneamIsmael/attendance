import 'package:attendance/core/themes/colors/colors.dart';
import 'package:attendance/core/themes/styles/app_text_style.dart';
import 'package:attendance/features/notification/domain/entities/notification_entity.dart';
import 'package:attendance/features/notification/presentation/controller/notification_controller.dart';
import 'package:attendance/features/notification/presentation/view/show_notification_details_sheet_view.dart';
import 'package:attendance/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key, required this.notification});
  final NotificationEntity notification;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.find<NotificationController>().updateNotificationStatus(notification);
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) =>
              NotificationDetailsSheet(notification: notification),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: notification.isRead
                ? LightColors.greyColor.withValues(alpha: 0.3)
                : LightColors.primaryColor.withValues(alpha: 0.2),
            width: notification.isRead ? 1 : 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              spreadRadius: 0,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Notification Icon with Status Indicator
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: notification.isRead
                        ? LightColors.greyColor.withValues(alpha: 0.1)
                        : LightColors.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: SvgPicture.asset(
                    Assets.icons.notification,
                    width: 20.w,
                    height: 20.h,
                    colorFilter: ColorFilter.mode(
                      notification.isRead
                          ? LightColors.darkGreyColor
                          : LightColors.primaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                // Unread indicator
                if (!notification.isRead)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: 8.w,
                      height: 8.h,
                      decoration: const BoxDecoration(
                        color: LightColors.primaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),

            SizedBox(width: 12.w),

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Time Row
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          notification.title ?? 'notification'.tr,
                          style: AppTextStyles.semiBold(context).copyWith(
                            fontSize: 14.sp,
                            color: notification.isRead
                                ? LightColors.textColor
                                : LightColors.primaryColor,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        _formatTime(notification.createDate ?? DateTime.now()),
                        style: AppTextStyles.regular(context).copyWith(
                          fontSize: 11.sp,
                          color: LightColors.darkGreyColor,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 4.h),

                  // Preview Text
                  Text(
                    notification.body ?? '',
                    style: AppTextStyles.regular(context).copyWith(
                      fontSize: 12.sp,
                      color: LightColors.darkGreyColor,
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  // Attachments Indicator
                  if (notification.attachment != null &&
                      notification.attachment!.isNotEmpty) ...[
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Icon(
                          Icons.attach_file,
                          size: 14.sp,
                          color: LightColors.darkGreyColor,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          '${notification.attachment!.length} ${'attachments'.tr}',
                          style: AppTextStyles.regular(context).copyWith(
                            fontSize: 11.sp,
                            color: LightColors.darkGreyColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),

            SizedBox(width: 8.w),

            // Arrow Icon
            Icon(
              Icons.arrow_forward_ios,
              size: 14.sp,
              color: LightColors.darkGreyColor,
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return DateFormat('MMM dd').format(dateTime);
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m';
    } else {
      return 'now'.tr;
    }
  }
}
