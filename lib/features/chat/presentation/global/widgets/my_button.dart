import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final String? tooltip;

  const MyButton({
    Key? key,
    required this.child,
    required this.onTap,
    this.tooltip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xfffab38b),
              offset: Offset(0.0, 3.0),
              blurRadius: 14.0,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          shape: SquircleBorder(
            side:
                BorderSide(color: themeData.colorScheme.background, width: 2.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: themeData.colorScheme.background,
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 14.0,
                    spreadRadius: 2.0,
                  ),
                ],
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

class SquircleBorder extends ShapeBorder {
  final BorderSide side;
  final double superRadius;

  const SquircleBorder({
    this.side = BorderSide.none,
    this.superRadius = 5.0,
  });

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(side.width);

  @override
  ShapeBorder scale(double t) {
    return SquircleBorder(
      side: side.scale(t),
      superRadius: superRadius * t,
    );
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return _squirclePath(rect.deflate(side.width), superRadius);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return _squirclePath(rect, superRadius);
  }

  static Path _squirclePath(Rect rect, double superRadius) {
    final c = rect.center;
    final dx = c.dx * (1.0 / superRadius);
    final dy = c.dy * (1.0 / superRadius);
    return Path()
      ..moveTo(c.dx, 0.0)
      ..relativeCubicTo(c.dx - dx, 0.0, c.dx, dy, c.dx, c.dy)
      ..relativeCubicTo(0.0, c.dy - dy, -dx, c.dy, -c.dx, c.dy)
      ..relativeCubicTo(-(c.dx - dx), 0.0, -c.dx, -dy, -c.dx, -c.dy)
      ..relativeCubicTo(0.0, -(c.dy - dy), dx, -c.dy, c.dx, -c.dy)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    switch (side.style) {
      case BorderStyle.none:
        break;
      case BorderStyle.solid:
        var path = getOuterPath(rect.deflate(side.width / 2.0),
            textDirection: textDirection);
        canvas.drawPath(path, side.toPaint());
    }
  }
}
