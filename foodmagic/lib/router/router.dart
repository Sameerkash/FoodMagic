import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:foodmagic/views/app.view.dart';
import 'package:foodmagic/views/auth/auth.view.dart';
import 'package:foodmagic/views/auth/signup.view.dart';

import '../views/navbar.view.dart';

class NavBarViewLocation extends BeamLocation {
  @override
  List<BeamPage> pagesBuilder(BuildContext context, BeamState state) {
    return [
      BeamPage(
        type: BeamPageType.cupertino,
        key: ValueKey('navView'),
        child: NavbarView(),
      ),
    ];
  }

  @override
  List<String> get pathBlueprints => ['/nav'];
}

class AppViewLocation extends BeamLocation {
  @override
  List<BeamPage> pagesBuilder(BuildContext context, BeamState state) {
    return [
      BeamPage(
        type: BeamPageType.cupertino,
        key: ValueKey('appView'),
        child: AppView(),
      ),
    ];
  }

  @override
  List<String> get pathBlueprints => ['/'];
}

class AuthViewLocation extends BeamLocation {
  @override
  List<BeamPage> pagesBuilder(BuildContext context, BeamState state) {
    return [
      BeamPage(
        type: BeamPageType.cupertino,
        key: ValueKey('signup'),
        child: SignUpView(),
      ),
    ];
  }

  @override
  List<String> get pathBlueprints => ['/signup'];
}