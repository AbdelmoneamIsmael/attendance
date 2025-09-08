import 'package:attendance/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PdfWidget extends StatelessWidget {
  const PdfWidget({
    super.key,
    required this.url,
    this.errorWidget,
    this.fit,
    this.height,
    this.width,
    this.isBlur = false,
    this.radius = 0,
    this.elevation = 0,
    this.showImageOnTap = false,
    this.onTap,
  });
  final String url;
  final Widget? errorWidget;
  final BoxFit? fit;
  final double? height, width;
  final bool isBlur;
  final double radius, elevation;
  final bool showImageOnTap;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return PdfViewScreen(url: url);
            },
          ),
        );
      },
      child: SvgPicture.asset(Assets.icons.pdfIcon, width: width ?? 32.sp),
    );
  }
}

class PdfViewScreen extends StatelessWidget {
  const PdfViewScreen({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
          PDF(
            enableSwipe: true,
            swipeHorizontal: true,
            autoSpacing: false,
            pageFling: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            onError: (error) {
              print(error.toString());
            },
            onPageError: (page, error) {
              print('$page: ${error.toString()}');
            },
            onPageChanged: (page, total) {
              print('page change: $page/$total');
            },
          ).fromUrl(
            url,
            placeholder: (double progress) =>
                Center(child: Text('$progress %')),
            errorWidget: (dynamic error) =>
                Center(child: Text(error.toString())),
          ),
    );
  }
}
