import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:attendance/core/const/app_const.dart';
import 'package:photo_view/photo_view.dart';
// import 'package:photo_view/photo_view.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({
    this.onTap,
    super.key,
    required this.url,
    this.elevation = 0,
    this.radius = 0,
    this.errorWidget,
    this.fit,
    this.height,
    this.width,
    this.isBlur = false,
    this.showImageOnTap = false,
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
    return GestureDetector(
      onTap: showImageOnTap
          ? () {
              if (showImageOnTap) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return ShowImageDialog(url: url);
                  },
                );
              }
            }
          : onTap,
      child: Material(
        borderRadius: BorderRadius.circular(radius.r),
        elevation: elevation,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius.r),
          child: CachedNetworkImage(
            fit: fit ?? BoxFit.cover,
            height: height,
            width: width,
            colorBlendMode: isBlur ? BlendMode.colorBurn : null,
            color: isBlur ? Colors.black26 : null,
            imageUrl: "${url.contains("http") ? "" : prodBaseURl}$url",
            filterQuality: FilterQuality.high,
            placeholder: (context, url) {
              return BlurHash(
                hash: 'LKO2:N%2Tw=w]~RBVZRi};RPxuwH',
                imageFit: fit ?? BoxFit.fill,
              );
            },
            errorWidget: (context, url, error) =>
                errorWidget ?? const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}

class ShowImageDialog extends StatelessWidget {
  const ShowImageDialog({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close, color: Colors.white),
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PhotoView(
                imageProvider: CachedNetworkImageProvider(
                  "${url.contains("http") ? "" : prodBaseURl}$url",
                ),
              ),
            ),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
