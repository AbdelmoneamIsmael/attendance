import 'package:flutter/material.dart';

enum DirectionMarguee { oneDirection, twoDirection }

class MarqueeTextWidget extends StatefulWidget {
  const MarqueeTextWidget({
    super.key,
    required this.child,
    this.direction = Axis.horizontal,
    this.textDirection = TextDirection.ltr,
    this.animationDuration = const Duration(milliseconds: 5000),
    this.backDuration = const Duration(milliseconds: 5000),
    this.pauseDuration = const Duration(milliseconds: 2000),
    this.directionMarguee = DirectionMarguee.twoDirection,
    this.forwardAnimation = Curves.easeOut,
    this.backwardAnimation = Curves.easeOut,
    this.autoRepeat = true,
    this.showFadedBorder = true,
    this.fadeColor = const Color(0xFF41829A),
  });
  final Widget child;
  final TextDirection textDirection;
  final Axis direction;
  final Duration animationDuration, backDuration, pauseDuration;
  final DirectionMarguee directionMarguee;
  final Cubic forwardAnimation;
  final Cubic backwardAnimation;
  final bool autoRepeat;
  final bool showFadedBorder;
  final Color? fadeColor;

  @override
  State<MarqueeTextWidget> createState() => _MarqueeTextWidgetState();
}

class _MarqueeTextWidgetState extends State<MarqueeTextWidget> {
  final ScrollController _scrollController = ScrollController();

  Future<void> scroll(bool repeated) async {
    do {
      if (_scrollController.hasClients) {
        await Future.delayed(widget.pauseDuration);
        if (_scrollController.hasClients) {
          await _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: widget.animationDuration,
            curve: widget.forwardAnimation,
          );
        }

        await Future.delayed(widget.pauseDuration);
        if (_scrollController.hasClients) {
          switch (widget.directionMarguee) {
            case DirectionMarguee.oneDirection:
              _scrollController.jumpTo(
                0,
              );
              break;
            case DirectionMarguee.twoDirection:
              await _scrollController.animateTo(
                0,
                duration: widget.backDuration,
                curve: widget.backwardAnimation,
              );
              break;
          }
        }
        repeated = widget.autoRepeat;
      } else {
        await Future.delayed(widget.pauseDuration);
      }
    } while (repeated);
  }

  @override
  void initState() {
    super.initState();
    scroll(true);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: widget.textDirection,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 2, right: 4),
            child: SingleChildScrollView(
              scrollDirection: widget.direction,
              controller: _scrollController,
              child: widget.child,
            ),
          ),
          // Gradient on the left side
          if (widget.showFadedBorder)
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Container(
                width: 5, // Adjust the width as per your needs
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      widget.fadeColor!.withValues(alpha: 0.9),
                      widget.fadeColor!.withValues(alpha: 0.4),
                      widget.fadeColor!.withValues(alpha: 0.2),
                    ],
                  ),
                ),
              ),
            ),
          // Gradient on the right side
          if (widget.showFadedBorder)
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: Container(
                width: 5, // Adjust the width as per your needs
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      widget.fadeColor!.withValues(alpha: 0.9),
                      widget.fadeColor!.withValues(alpha: 0.4),
                      widget.fadeColor!.withValues(alpha: 0.2),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
