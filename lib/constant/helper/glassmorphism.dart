import 'dart:ui';

import 'package:flutter/material.dart';

extension Glassmorphism on Widget {
  glassmorphism({
    Color color = Colors.black,
  }) =>
      ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF98C1D9).withOpacity(0.1),
                  const Color(0xFF98C1D9).withOpacity(0.5),
                ],
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
              ),
            ),
            child: this,
          ),
        ),
      );
}
