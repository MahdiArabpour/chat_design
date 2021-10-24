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
    final blurRadius = blur ? 5.0 : 0.0;
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: blurRadius, sigmaY: blurRadius),
      child: Container(
        decoration: BoxDecoration(
          color: (color ?? themeData.colorScheme.background)
              .withOpacity(opacity ?? 0.5),
          borderRadius: borderRadius,
          boxShadow: [
            BoxShadow(
              color: themeData.colorScheme.secondary.withOpacity(0.4),
              offset: const Offset(0.0, 24.0),
              blurRadius: 28.0,
              spreadRadius: 1.5
            ),
            BoxShadow(
              color: themeData.colorScheme.background.withOpacity(0.3),
              offset: const Offset(0.0, 0.0),
              blurRadius: 30.0,
              spreadRadius: 0.9
            ),
          ]
        ),
        padding: padding,
        child: child,
      ),
    );
  }
}
