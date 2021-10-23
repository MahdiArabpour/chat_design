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
          color: (color ?? themeData.colorScheme.background)
              .withOpacity(opacity ?? 0.5),
          borderRadius: borderRadius,
          boxShadow: [
            BoxShadow(
              color: themeData.colorScheme.secondary.withOpacity(0.8),
              offset: const Offset(0.0, 24.0),
              blurRadius: 30.0,
              spreadRadius: 1.2
            ),
            BoxShadow(
              color: themeData.colorScheme.background.withOpacity(0.5),
              offset: const Offset(0.0, 0.0),
              blurRadius: 30.0,
              spreadRadius: 0.9
            ),
          ]
        ),
        padding: padding,
        child: child,
      ),
    ) : child;
  }
}
