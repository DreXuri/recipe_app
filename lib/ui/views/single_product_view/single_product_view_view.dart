import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receipe_app/data_model/product_model.dart';
import 'package:receipe_app/ui/common/app_colors.dart';
import 'package:receipe_app/ui/common/app_images.dart';
import 'package:receipe_app/ui/common/ui_helpers.dart';
import 'package:receipe_app/ui/extension/app_typography.dart';
import 'package:receipe_app/ui/extension/palette.dart';
import 'package:receipe_app/ui/views/homepage/widgets/favourite_widget.dart';
import 'package:receipe_app/ui/views/single_product_view/widget/card_tiles.dart';
import 'package:receipe_app/ui/widgets/common/richtext_widget.dart';
import 'package:stacked/stacked.dart';
import 'single_product_view_viewmodel.dart';
import 'package:transparent_image/transparent_image.dart';

class SingleProductViewView extends StackedView<SingleProductViewViewModel> {
  const SingleProductViewView({required this.products, Key? key})
      : super(key: key);
  final ProductModel products;
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
        child: SizedBox(
          height: screenHeight(context),
          child: Stack(
            children: [
              InkWell(
                onTap: viewModel.goBack,
                child: SizedBox(
                  height: 456.h,
                  child: Hero(
                    tag: products.id,
                    child: Image.asset(
                      products.image,
                      height: 456.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 403,
                child: Container(
                  height: 403.h,
                  width: screenWidth(context),
                  decoration: BoxDecoration(
                    color: kcBackground,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(36.r),
                      topLeft: Radius.circular(36.r),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: sidePadding,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSemiSpaceMedium,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichTextWidget(
                                  color1: palette?.gray8,
                                  color2: palette?.gray11,
                                  text1: 'Name: ',
                                  text2: products.title,
                                ),
                                RichTextWidget(
                                  color1: palette?.gray8,
                                  color2: palette?.gray11,
                                  text1: 'Created by: ',
                                  text2: products.date,
                                )
                              ],
                            ),
                            FavoriteWidget(productModel: products),
                          ],
                        ),
                        verticalSpaceMedium,
                        Text(
                          'Ingredient',
                          textAlign: TextAlign.start,
                          style: typography?.titleBold16?.copyWith(
                            color: palette?.gray11,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            CardTiles(text: 'Fresh Tomatoes'),
                            CardTiles(text: 'Vegetable Oil'),
                            CardTiles(text: '4 cups of white rice'),
                          ],
                        ),
                        verticalSpaceMedium,
                        Text(
                          'Instructions',
                          textAlign: TextAlign.start,
                          style: typography?.titleBold16?.copyWith(
                            color: palette?.gray11,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          '''Step 1
 Wash tomatoes,pepper,ginger,garlic and one onion blend.
 Step 2
 Wash and chop onion thinly.
 Step 3
 Get a clean pot,wash meat put in the pot with spices and salt.
   ''',
                          textAlign: TextAlign.justify,
                          style: typography?.labelRegular12?.copyWith(
                            color: palette?.gray11,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
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
