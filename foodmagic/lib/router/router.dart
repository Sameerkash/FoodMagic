// import 'package:beamer/beamer.dart';
// import 'package:flutter/material.dart';

// import '../views/app.view.dart';
// import '../views/auth/signup.view.dart';
// import '../views/navbar.view.dart';

import 'package:auto_route/annotations.dart';
import 'package:foodmagic/views/app.view.dart';
import 'package:foodmagic/views/ar/ar.view.dart';
import 'package:foodmagic/views/auth/signup.view.dart';
import 'package:foodmagic/views/home/Item.detail.view.dart';
import 'package:foodmagic/views/order/order.view.dart';

@CupertinoAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: AppView, initial: true),
    AutoRoute(page: SignUpView),
    AutoRoute(page: ItemDetailView),
    AutoRoute(page: OrderView),

  ],
)
class $Router {}

// class NavBarViewLocation extends BeamLocation {
//   @override
//   List<BeamPage> pagesBuilder(BuildContext context, BeamState state) {
//     return [
//       BeamPage(
//         type: BeamPageType.cupertino,
//         key: ValueKey('navView'),
//         child: NavbarView(),
//       ),
//     ];
//   }

//   @override
//   List<String> get pathBlueprints => ['/nav'];
// }

// class AppViewLocation extends BeamLocation {
//   @override
//   List<BeamPage> pagesBuilder(BuildContext context, BeamState state) {
//     return [
//       BeamPage(
//         type: BeamPageType.cupertino,
//         key: ValueKey('appView'),
//         child: AppView(),
//       ),
//     ];
//   }

//   @override
//   List<String> get pathBlueprints => ['/'];
// }

// class AuthViewLocation extends BeamLocation {
//   @override
//   List<BeamPage> pagesBuilder(BuildContext context, BeamState state) {
//     return [
//       BeamPage(
//         type: BeamPageType.cupertino,
//         key: ValueKey('signup'),
//         child: SignUpView(),
//       ),
//     ];
//   }

//   @override
//   List<String> get pathBlueprints => ['/signup'];
// }
