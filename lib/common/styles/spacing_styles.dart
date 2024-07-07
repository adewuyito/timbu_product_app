import 'package:flutter/material.dart';
import '../../utils/constants/sizes.dart';

class BSpacing {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: CSizes.appBarHeight,
    bottom: CSizes.defaultSpacing,
    left: CSizes.defaultSpacing,
    right: CSizes.defaultSpacing,
  );
}
