import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:receipe_app/ui/common/app_colors.dart';
import 'package:receipe_app/ui/common/app_images.dart';
import 'package:receipe_app/ui/common/ui_helpers.dart';
import 'package:receipe_app/ui/extension/app_typography.dart';
import 'package:receipe_app/ui/extension/palette.dart';
import 'package:receipe_app/ui/views/homepage/widgets/product_item/product_item.dart';
import 'package:stacked/stacked.dart';

import 'my_dish_screen_viewmodel.dart';

class MyDishScreenView extends StackedView<MyDishScreenViewModel> {
  const MyDishScreenView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MyDishScreenViewModel viewModel,
    Widget? child,
  ) {
    ThemeData theme = Theme.of(context);
    AppTypography? typography = theme.extension<AppTypography>();
    Palette? palette = theme.extension<Palette>();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kcBackground,
          elevation: 0,
          leading: InkWell(
              onTap: viewModel.openDrawer,
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 2.w,
                    top: 8.h,
                  ),
                  child: SvgPicture.asset(
                    AppImages.burgerLog,
                    width: 24.7.w,
                    height: 24.h,
                  ),
                ),
              )),
          title: Text(
            'My Dish',
            style: typography?.titleBold16?.copyWith(color: palette?.gray11),
          )),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 18.h,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: sidePadding),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.67,
                    mainAxisSpacing: 20.h,
                    crossAxisSpacing: 16.w,
                    mainAxisExtent: 252.h,
                  ),
                  itemCount: viewModel.productItems.length,
                  itemBuilder: (context, index) {
                    final productModels =
                        viewModel.productItems.elementAt(index);
                    return ProductItem(
                      productModel: productModels,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  MyDishScreenViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MyDishScreenViewModel();
}
