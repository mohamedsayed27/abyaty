import 'package:shimmer/shimmer.dart';

import '../../../core/constants/route_exports.dart';

class CustomShimmer extends StatelessWidget {
  final Color? baseColor;
  final Color? highLightColor;

  const CustomShimmer({
    super.key,
    this.baseColor,
    this.highLightColor,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.grey[300]!,
      highlightColor: highLightColor ?? Colors.grey[200]!,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
