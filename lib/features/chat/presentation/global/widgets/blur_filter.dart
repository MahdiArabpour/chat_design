import 'dart:ui';

import 'package:flutter/material.dart';

class BlurFilter extends StatelessWidget {
  final Color? color;
  final double? opacity;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final Widget child;
  final bool blur;

  const BlurFilter({
    Key? key,
    this.color,
    this.opacity,
    this.borderRadius,
    this.padding,
    required this.child, this.blur = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return blur ? BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
      child: Container(
        decoration: BoxDecoration(
          color: (color ?? themeData.colorScheme.secondary)
              .withOpacity(opacity ?? 0.2),
          borderRadius: borderRadius,
        ),
        padding: padding,
        child: child,
      ),
    ) : child;
  }
}
