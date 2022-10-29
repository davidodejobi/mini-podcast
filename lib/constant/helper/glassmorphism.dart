import 'dart:ui';

import 'package:flutter/material.dart';

extension Glassmorphism on Widget {
  glassmorphism({
    Gradient? gradient,
    Color color = Colors.black,
  }) =>
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 20,
            sigmaY: 20,
          ),
          child: this,
        ),
      );
}
