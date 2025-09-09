import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class VideoWidget extends StatefulWidget {
  const VideoWidget({super.key, required this.url, this.height, this.width});
  final String url;
  final double? height, width;

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  Uint8List? _thumbnail;

  @override
  void initState() {
    super.initState();
    _generateThumbnail();
  }

  Future<void> _generateThumbnail() async {
    final uint8list = await VideoThumbnail.thumbnailData(
      video: widget.url,
      imageFormat: ImageFormat.JPEG,
      maxWidth: 128, // Resize width, keep null for original
      quality: 75,
    );

    if (mounted) {
      setState(() {
        _thumbnail = uint8list;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return VedioPlayerWidget(url: widget.url);
            },
          ),
        );
      },
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryFixed,
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
        ),
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            _thumbnail != null
                ? ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.r)),
                    child: Image.memory(
                      _thumbnail!,
                      colorBlendMode: BlendMode.colorBurn,
                      color: Colors.black26,
                      fit: BoxFit.fill,
                      width: widget.width,
                      height: widget.height,
                    ),
                  )
                : const BlurHash(
                    hash: 'LKO2:N%2Tw=w]~RBVZRi};RPxuwH',
                    imageFit: BoxFit.fill,
                  ),

            const Center(
              child: Icon(Icons.play_arrow_outlined, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class VedioPlayerWidget extends StatefulWidget {
  const VedioPlayerWidget({super.key, required this.url});
  final String url;

  @override
  State<VedioPlayerWidget> createState() => _VedioPlayerWidgetState();
}

class _VedioPlayerWidgetState extends State<VedioPlayerWidget> {
  VideoPlayerController? vedioPlayerController;
  bool isPlaying = true;
  double opacity = 1;
  @override
  void initState() {
    vedioPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.url))
          ..addListener(() => setState(() {}))
          ..setLooping(true)
          ..initialize().then((value) {
            isPlaying = true;
            return vedioPlayerController?.play();
          });

    super.initState();
  }

  @override
  void dispose() {
    vedioPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onTap: () {
          opacity = opacity == 0 ? 1 : 0;
          setState(() {});
        },
        child: Builder(
          builder: (context) {
            if (vedioPlayerController != null &&
                vedioPlayerController!.value.isInitialized) {
              return Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AspectRatio(
                      aspectRatio: vedioPlayerController!.value.aspectRatio,
                      child: VideoPlayer(vedioPlayerController!),
                    ),
                    AnimatedOpacity(
                      opacity: opacity,
                      duration: const Duration(milliseconds: 400),
                      child: Center(
                        child: IconButton(
                          icon: Icon(
                            isPlaying
                                ? Icons.pause_circle_filled_outlined
                                : Icons.play_circle_fill_rounded,
                            color: Colors.white,
                            size: 40,
                          ),
                          onPressed: () {
                            if (vedioPlayerController!.value.isPlaying) {
                              vedioPlayerController?.pause();
                              isPlaying = false;
                              setState(() {});
                            } else {
                              vedioPlayerController?.play();
                              isPlaying = true;
                              opacity = opacity == 0 ? 1 : 0;

                              setState(() {});
                            }
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 25.h,
                      right: 0,
                      left: 0,
                      child: SafeArea(
                        child: AnimatedOpacity(
                          opacity: opacity,
                          duration: const Duration(milliseconds: 400),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            child: Row(
                              spacing: 10.w,
                              children: [
                                Text(
                                  "${formatDuration(vedioPlayerController!.value.position.inSeconds)} ",
                                ),
                                Expanded(
                                  child: VideoProgressIndicator(
                                    vedioPlayerController!,
                                    allowScrubbing: true,
                                  ),
                                ),
                                Text(
                                  " ${formatDuration(vedioPlayerController!.value.duration.inSeconds)}",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
          },
        ),
      ),
    );
  }

  String formatDuration(int seconds) {
    final duration = Duration(seconds: seconds);
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final secs = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$secs";
  }
}
