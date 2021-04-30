import 'package:flutter/material.dart';
import 'package:foodmagic/controllers/auth.controller.dart';
import 'package:foodmagic/views/navbar.view.dart';
import 'package:get/get.dart';

import 'auth/auth.view.dart';

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
