import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth.controller.dart';
import 'auth/auth.view.dart';
import 'navbar.view.dart';

class AppView extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return GetX<AuthController>(
      builder: (controller) {
        if (controller.state is UnAuthenticated)
          return AuthView();
        else if (controller.state is Authenticated)
          return NavbarView();
        else
          return Center(
            child: CircularProgressIndicator(),
          );
      },
    );
  }
}
