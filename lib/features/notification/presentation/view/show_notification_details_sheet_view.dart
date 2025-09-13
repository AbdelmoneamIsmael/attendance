import 'package:attendance/core/themes/colors/colors.dart';
import 'package:attendance/core/themes/styles/app_text_style.dart';
import 'package:attendance/core/widgets/attatchements/cashed_images.dart';
import 'package:attendance/core/widgets/attatchements/vedio_widget.dart';
import 'package:attendance/features/notification/domain/entities/notification_entity.dart';
import 'package:attendance/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class NotificationDetailsSheet extends StatelessWidget {
  const NotificationDetailsSheet({super.key, required this.notification});

  final NotificationEntity notification;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            margin: EdgeInsets.only(top: 12.h),
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: LightColors.greyColor,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),

          // Header
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: LightColors.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: SvgPicture.asset(
                    Assets.icons.notification,
                    width: 24.w,
                    height: 24.h,
                    colorFilter: const ColorFilter.mode(
                      LightColors.primaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'notification_details'.tr,
                        style: AppTextStyles.bold(
                          context,
                        ).copyWith(fontSize: 18.sp),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'view_notification_details'.tr,
                        style: AppTextStyles.regular(context).copyWith(
                          color: LightColors.darkGreyColor,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.close,
                    color: LightColors.darkGreyColor,
                    size: 24.sp,
                  ),
                ),
              ],
            ),
          ),

          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title Section
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: LightColors.backgroundColor,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: LightColors.greyColor.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'title'.tr,
                          style: AppTextStyles.semiBold(context).copyWith(
                            color: LightColors.darkGreyColor,
                            fontSize: 12.sp,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          notification.title ?? '',
                          style: AppTextStyles.bold(
                            context,
                          ).copyWith(fontSize: 16.sp),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 16.h),

                  // Body Section
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: LightColors.backgroundColor,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: LightColors.greyColor.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'message'.tr,
                          style: AppTextStyles.semiBold(context).copyWith(
                            color: LightColors.darkGreyColor,
                            fontSize: 12.sp,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          notification.body ?? '',
                          style: AppTextStyles.regular(
                            context,
                          ).copyWith(fontSize: 14.sp, height: 1.5),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 16.h),

                  // Date and User Info Section
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            color: LightColors.backgroundColor,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                              color: LightColors.greyColor.withValues(
                                alpha: 0.3,
                              ),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'date'.tr,
                                style: AppTextStyles.semiBold(context).copyWith(
                                  color: LightColors.darkGreyColor,
                                  fontSize: 12.sp,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  DateFormat('yyyy-MM-dd hh:mm a').format(
                                    notification.createDate ?? DateTime.now(),
                                  ),
                                  style: AppTextStyles.medium(
                                    context,
                                  ).copyWith(fontSize: 14.sp),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            color: LightColors.backgroundColor,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                              color: LightColors.greyColor.withValues(
                                alpha: 0.3,
                              ),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'status'.tr,
                                style: AppTextStyles.semiBold(context).copyWith(
                                  color: LightColors.darkGreyColor,
                                  fontSize: 12.sp,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.w,
                                  vertical: 4.h,
                                ),
                                decoration: BoxDecoration(
                                  color: notification.isRead
                                      ? LightColors.greenColor.withValues(
                                          alpha: 0.1,
                                        )
                                      : LightColors.yelloColor.withValues(
                                          alpha: 0.1,
                                        ),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Text(
                                  notification.isRead ? 'read'.tr : 'unread'.tr,
                                  style: AppTextStyles.medium(context).copyWith(
                                    fontSize: 12.sp,
                                    color: notification.isRead
                                        ? LightColors.greenColor
                                        : LightColors.yelloColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Attachments Section
                  if (notification.attachment != null &&
                      notification.attachment!.isNotEmpty) ...[
                    SizedBox(height: 16.h),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: LightColors.backgroundColor,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: LightColors.greyColor.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'attachments'.tr,
                            style: AppTextStyles.semiBold(context).copyWith(
                              color: LightColors.darkGreyColor,
                              fontSize: 12.sp,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 12.w,
                                  mainAxisSpacing: 12.h,
                                  childAspectRatio: 1.2,
                                ),
                            itemCount: notification.attachment!.length,
                            itemBuilder: (context, index) {
                              return _buildAttachmentItem(
                                context,
                                notification.attachment![index],
                                index,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],

                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAttachmentItem(BuildContext context, String url, int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: LightColors.greyColor.withValues(alpha: 0.3)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: getAttachmentWidget(context: context, url: url),
      ),
    );
  }

  Widget getAttachmentWidget({
    required BuildContext context,
    required String url,
  }) {
    final fileType = getAttachmentType(url: url);

    switch (fileType) {
      case 'jpg':
      case 'jpeg':
      case 'png':
      case 'gif':
      case 'webp':
        return CachedImage(
          url: url,
          radius: 8,
          showImageOnTap: true,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        );
      case 'pdf':
        return Container(
          padding: EdgeInsets.all(8.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.icons.pdfIcon,
                width: 32.w,
                height: 32.h,
                colorFilter: const ColorFilter.mode(
                  LightColors.redColor,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'PDF',
                style: AppTextStyles.medium(
                  context,
                ).copyWith(fontSize: 12.sp, color: LightColors.redColor),
              ),
            ],
          ),
        );
      case 'mp4':
      case 'avi':
      case 'mov':
        return VideoWidget(
          url: url,
          height: double.infinity,
          width: double.infinity,
        );
      default:
        return Container(
          padding: EdgeInsets.all(8.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.attach_file,
                size: 32,
                color: LightColors.darkGreyColor,
              ),
              SizedBox(height: 8.h),
              Text(
                fileType.toUpperCase(),
                style: AppTextStyles.medium(
                  context,
                ).copyWith(fontSize: 12.sp, color: LightColors.darkGreyColor),
              ),
            ],
          ),
        );
    }
  }

  String getAttachmentType({required String url}) {
    return url.split('.').last.toLowerCase();
  }
}
