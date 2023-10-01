import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receipe_app/ui/common/app_colors.dart';
import 'package:receipe_app/ui/extension/app_typography.dart';
import 'package:receipe_app/ui/extension/palette.dart';

class CardTiles extends StatelessWidget {
  const CardTiles({
    super.key, required this.text, AppTypography? typography,

  });
final String? text;

  @override
  Widget build(BuildContext context) {
        ThemeData theme = Theme.of(context);
    AppTypography? typography = theme.extension<AppTypography>();
    Palette? palette = theme.extension<Palette>();
    return Card(
      color: kcBackgroundColor,
      child: Padding(
        padding: EdgeInsets.only(top:12.h, bottom: 16.h),
        child: Text(
          text ?? 'Fresh Tomatoes',
          textAlign: TextAlign.center,
          style: typography?.titleBold16?.copyWith(
            color: palette?.gray11,
          ),
        ),
      ),
    );
  }
}


