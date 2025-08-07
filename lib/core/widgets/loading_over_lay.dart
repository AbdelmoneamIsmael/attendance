import 'dart:ui';

import 'package:flutter/material.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 4,
        sigmaY: 4,
      ),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black.withValues( alpha: 0.65),
        child: const Center(
          child: CircularProgressIndicator.adaptive(
            // color: Colors.white,
            strokeWidth: 1,
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
