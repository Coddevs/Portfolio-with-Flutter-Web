import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget mediumScreen;
  final Widget smallScreen;
  ResponsiveWidget({
    @required this.largeScreen,
    this.mediumScreen,
    this.smallScreen
  }) : assert(largeScreen!=null);

  static Text toTitle(String text, {TextStyle style}) {
    assert(text!=null);
    return Text(text, textScaleFactor: 3.5, style: style);
  }

  static Text toSubtitle(String text, {TextStyle style}) {
    assert(text!=null);
    return Text(text, textScaleFactor: 1.5, style: style);
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width>=1200;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width>=600 && MediaQuery.of(context).size.width<1200;
  }

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width<600;
  }

  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, BoxConstraints constraints) {
        if (constraints.maxWidth>=1200) {
          return largeScreen;
        } else if (constraints.maxWidth>=600 && constraints.maxWidth<1200) {
          return mediumScreen ?? largeScreen;
        } else {
          return smallScreen ?? largeScreen;
        }
      },
    );
  }
}