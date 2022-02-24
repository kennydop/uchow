import 'package:flutter/cupertino.dart';
import 'package:u_chow/utils/constants.dart';

class AppText extends StatelessWidget {
  final Color? color;
  final String? type;
  final String text;
  final double? size;
  final double? height;
  final bool? ignoreOverflow;
  final TextOverflow overflow;

  AppText(
      {Key? key,
      this.color,
      this.type,
      required this.text,
      this.size,
      this.height,
      this.ignoreOverflow,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case 'title':
        return Text(
          text,
          overflow: overflow,
          maxLines: ignoreOverflow == true ? 999 : 1,
          style: TextStyle(
              color: color ?? const Color(0xFF5A5A5A),
              fontWeight: FontWeight.w700,
              fontSize: size ?? AppDimensions.height24),
        );
      case 'subtext':
        return Text(
          text,
          overflow: overflow,
          maxLines: ignoreOverflow == true ? 999 : 1,
          style: TextStyle(
              color: color ?? const Color(0xFF626262),
              fontSize: size ?? AppDimensions.height10,
              fontWeight: FontWeight.w300,
              height: height ?? AppDimensions.height1p2),
        );
      default:
        return Text(
          text,
          overflow: overflow,
          maxLines: ignoreOverflow == true ? 999 : 1,
          style: TextStyle(
              color: color ?? const Color(0xFF707070),
              fontSize: size ?? AppDimensions.height16),
        );
    }
  }
}
