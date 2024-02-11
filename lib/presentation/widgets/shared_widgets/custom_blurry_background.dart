import 'dart:ui';

import 'package:abyaty/core/assets_path/svg_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BlurryBackground extends StatelessWidget {
  final Widget child;

  const BlurryBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: SvgPicture.asset(
              SvgPath.topLeft,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: SvgPicture.asset(
              SvgPath.bottomRight,
            ),
          ),
          Positioned(
            top: 200.h,
            right: 18.w,
            child: SvgPicture.asset(
              SvgPath.topRight,
            ),
          ),
          Positioned(
            bottom: 200.h,
            left: 18.w,
            child: SvgPicture.asset(
              SvgPath.bottomLeft,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 50.w, sigmaY: 50.h),
              child: Container(
                color: Colors.white.withOpacity(.86),
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
