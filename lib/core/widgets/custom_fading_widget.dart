import 'package:flutter/material.dart';

class CustomFadingWidget extends StatefulWidget {
  const CustomFadingWidget(
      {required this.child,
      super.key,
      this.begin,
      this.end,
      this.duration,
      this.reverse});

  final Widget child;
  final num? begin, end;
  final Duration? duration;
  final bool? reverse;
  @override
  State<CustomFadingWidget> createState() => _CustomFadingWidgetState();
}

class _CustomFadingWidgetState extends State<CustomFadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation fadingAnimation;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: widget.duration ?? const Duration(milliseconds: 700),
    );
    fadingAnimation = Tween(begin: widget.begin ?? 0.2, end: widget.end ?? 1.0)
        .animate(animationController);
    animationController.forward();
    animationController.addListener(() {
      setState(() {});
    });
    animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: fadingAnimation.value,
      child: widget.child,
    );
  }
}
