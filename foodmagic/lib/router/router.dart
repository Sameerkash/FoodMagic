import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:foodmagic/views/navbar.view.dart';

class NavBarLocation extends BeamLocation {
  @override
  List<BeamPage> pagesBuilder(BuildContext context, BeamState state) {
    return [
      BeamPage(
        key: ValueKey('navbar'),
        child: NavbarView(),
      ),
    ];
  }

  @override
  List<String> get pathBlueprints => ['/'];
}

class AuthLocation extends BeamLocation {
  @override
  List<BeamPage> pagesBuilder(BuildContext context, BeamState state) {
    return [
      

    ];
  }

  @override
  List<String> get pathBlueprints => ['/auth', '/signin', 'signup', '/sign'];
}
