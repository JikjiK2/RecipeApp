import 'package:cook_app_project/src/responsive/breakpoint.dart';
import 'package:flutter/material.dart';

class ReponsiveCenter extends StatelessWidget {
  const ReponsiveCenter({
    Key? key,
    this.maxContentWidth = BreakPoint.tablet,
    this.padding = EdgeInsets.zero,
    required this.child,
  }) : super(key: key);
  final double maxContentWidth;
  final EdgeInsetsGeometry padding;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: maxContentWidth,
      child: Padding(
        padding: padding,
        child: child,
      ),
    ));
  }
}
