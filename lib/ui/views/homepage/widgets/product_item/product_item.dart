import 'package:flutter/material.dart';
import 'package:receipe_app/ui/extension/palette.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receipe_app/data_model/product_model.dart';
import 'package:receipe_app/ui/views/homepage/widgets/favourite_widget.dart';
import 'package:receipe_app/ui/widgets/common/richtext_widget.dart';
import 'product_item_model.dart';

class ProductItem extends StackedView<ProductItemModel> {
  final ProductModel productModel;
  const ProductItem({
    super.key,
    required this.productModel,
  });

  @override
  Widget builder(
    BuildContext context,
    ProductItemModel viewModel,
    Widget? child,
  ) {
    ThemeData theme = Theme.of(context);
    Palette? palette = theme.extension<Palette>();
    return InkWell(
      onTap: () {
        viewModel.navigateToProductDetail(productModel);
      },
      child: SizedBox(
        height: 252.h,
        width: 171.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Hero(
                  tag: productModel.id,
                  child: Image.asset(
                    productModel.image,
                    height: 200.h,
                    fit: BoxFit.contain,
                  ),
                ),
                FavoriteWidget(productModel: productModel)
              ],
            ),
            SizedBox(height: 8.h),
            RichTextWidget(
              color1: palette?.gray8,
              color2: palette?.primary6,
              text1: 'Name: ',
              text2: productModel.title,
            ),
            RichTextWidget(
              color1: palette?.gray8,
              color2: palette?.gray11,
              text1: 'Date Created: ',
              text2: productModel.date,
            ),
          ],
        ),
      ),
    );
  }

  @override
  ProductItemModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProductItemModel();
}
