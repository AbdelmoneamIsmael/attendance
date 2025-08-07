// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:attendance/core/themes/colors/colors.dart';
// import 'package:attendance/core/themes/styles/app_text_style.dart';
// import 'package:attendance/gen/assets.gen.dart';

// class AppIconWidget extends StatelessWidget {
//   const AppIconWidget({
//     super.key,
//     this.raduis = 30,
//     this.appNameSize,
//     this.watermarkSize,
//   });
//   final double raduis;
//   final double? appNameSize, watermarkSize;
//   @override
//   Widget build(BuildContext context) {
//     return CircleAvatar(
//       radius: raduis,
//       backgroundImage: AssetImage(Assets.images.appIcon.path),
//     );
//   }
// }

// class AppIconWidgetWithDes extends StatelessWidget {
//   const AppIconWidgetWithDes({
//     super.key,
//     this.raduis = 30,
//     this.appNameSize,
//     this.watermarkSize,
//   });
//   final double raduis;
//   final double? appNameSize, watermarkSize;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         CircleAvatar(
//           radius: raduis,
//           backgroundImage: AssetImage(Assets.images.appIcon.path),
//         ),
//         const SizedBox(height: 10),
//         Text(
//           'Pharma +',
//           style: AppTextStyles.bold(context).copyWith(
//             fontSize: appNameSize ?? 30.h,
//             color: LightColors.buttonColor,
//           ),
//         ),
//         const SizedBox(height: 10),

//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             DottedBorder(
//               options: const CircularDottedBorderOptions(
//                 strokeWidth: 1,

//                 dashPattern: [60, 20],
//                 color: LightColors.buttonColor,
//               ),
//               child: Container(
//                 height: appNameSize ?? 30,
//                 width: appNameSize ?? 30,
//                 decoration: const BoxDecoration(shape: BoxShape.circle),
//                 child: Center(
//                   child: Text(
//                     'tk',
//                     style: AppTextStyles.bold(context).copyWith(
//                       fontSize: watermarkSize ?? 10.h,
//                       color: LightColors.buttonColor,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 10),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'takamul',
//                   style: AppTextStyles.bold(context).copyWith(
//                     fontSize: watermarkSize ?? 10.h,
//                     color: LightColors.buttonColor,
//                   ),
//                 ),

//                 Text(
//                   'e-commerce & management Solutions',
//                   style: AppTextStyles.bold(context).copyWith(
//                     fontSize: watermarkSize != null ? watermarkSize! / 2 : 5.h,
//                     color: LightColors.buttonColor,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
