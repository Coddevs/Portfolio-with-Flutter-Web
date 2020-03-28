import 'package:flutter/widgets.dart';

class ScrollNoGlow extends ScrollBehavior {
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}