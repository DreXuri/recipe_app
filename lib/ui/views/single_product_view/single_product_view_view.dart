import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:receipe_app/ui/common/app_images.dart';
import 'package:receipe_app/ui/common/ui_helpers.dart';
import 'package:receipe_app/ui/extension/app_typography.dart';
import 'package:receipe_app/ui/extension/palette.dart';
import 'package:receipe_app/ui/views/single_product_view/widget/card_tiles.dart';
import 'package:receipe_app/ui/widgets/common/richtext_widget.dart';
import 'package:stacked/stacked.dart';

import 'single_product_view_viewmodel.dart';

class SingleProductViewView extends StackedView<SingleProductViewViewModel> {
  const SingleProductViewView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SingleProductViewViewModel viewModel,
    Widget? child,
  ) {
    ThemeData theme = Theme.of(context);
    AppTypography? typography = theme.extension<AppTypography>();
    Palette? palette = theme.extension<Palette>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SvgPicture.asset(AppImages.logo),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(36.r),
                  topLeft: Radius.circular(36.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: sidePadding),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            RichTextWidget(
                              color1: palette?.gray8,
                              color2: palette?.gray11,
                              text1: '',
                              text2: '',
                            ),
                            RichTextWidget(
                              color1: palette?.gray8,
                              color2: palette?.gray11,
                              text1: '',
                              text2: '',
                            )
                          ],
                        ),
                        // FavoriteWidget(productModel: productModel),
                      ],
                    ),
                    Text(
                      'Ingredient',
                      textAlign: TextAlign.start,
                      style: typography?.titleBold16?.copyWith(
                        color: palette?.gray11,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      children: const [
                        CardTiles(
                          text: 'Fresh Tomatoes',
                        ),
                        CardTiles(text: 'Vegetable Oil'),
                        CardTiles(
                          text: '4 cups of white rice',
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      'Instructions',
                      textAlign: TextAlign.start,
                      style: typography?.titleBold16?.copyWith(
                        color: palette?.gray11,
                      ),
                    ),
                    Text(
                      '''Step 1
Wash tomatoes,pepper,ginger,garlic and one onion blend.
Step 2
Wash and chop onion thinly.
Step 3
Get a clean pot,wash meat put in the pot with spices and salt.
''',
                      textAlign: TextAlign.start,
                      style: typography?.labelRegular12?.copyWith(
                        color: palette?.gray11,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  SingleProductViewViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SingleProductViewViewModel();
}
