import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DragBottomSheetContainer extends StatelessWidget {
  const DragBottomSheetContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 4.h,
        width: 24.w,
        decoration: BoxDecoration(
          color: const Color(0xffB3B3B3),
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    );
  }
}
