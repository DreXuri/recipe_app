import 'package:flutter/material.dart';
import 'package:receipe_app/app/app.locator.dart';
import 'package:receipe_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProductItemModel extends BaseViewModel {
    final _navigationService = locator<NavigationService>();

  void navigateToProductDetail() {
    debugPrint('Go to single page');
    _navigationService.navigateToMyDishScreenView();
  }
}
