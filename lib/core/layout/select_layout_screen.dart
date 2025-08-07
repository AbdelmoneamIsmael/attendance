import 'package:flutter/material.dart';

class SelectLayoutSCreen extends StatelessWidget {
  const SelectLayoutSCreen({
    super.key,
    required this.mobileBuilder,
    required this.tabletBuilder,
    required this.webBuilder,
  });
  final WidgetBuilder mobileBuilder, tabletBuilder, webBuilder;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 500) {
          return mobileBuilder(context);
        } else if (constraints.maxWidth <= 1070) {
          return tabletBuilder(context);
        } else {
          return webBuilder(context);
        }
      },
    );
  }
}
