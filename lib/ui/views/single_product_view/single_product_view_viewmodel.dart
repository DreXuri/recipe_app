import 'package:flutter/material.dart';
import 'package:receipe_app/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SingleProductViewViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();


  void goBack() {
    debugPrint('Goto add product page');
// TODO  below should be replased with navigate to add product page
    _navigationService.back();
  }
}
