import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receipe_app/ui/extension/app_typography.dart';
import 'package:receipe_app/ui/extension/palette.dart';

class CardTiles extends StatelessWidget {
  const CardTiles({
    super.key,
    required this.text,
    AppTypography? typography,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppTypography? typography = theme.extension<AppTypography>();
    Palette? palette = theme.extension<Palette>();
    return Container(
      height: 60.h,
      width: 90.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: palette?.gray1,
      ),
      child: Padding(
        padding:
            EdgeInsets.only(top: 12.h, bottom: 16.h, left: 10.w, right: 10.w),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: typography?.labelRegular12?.copyWith(
            color: palette?.gray11,
          ),
        ),
      ),
    );
  }
}
