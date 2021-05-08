import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodmagic/providers/auth.provider.dart';
import 'package:foodmagic/views/navbar.view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'auth/auth.view.dart';

class AppView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final auth = useProvider(authProvider);

    return auth.map(
        loading: (_) => Center(
              child: CircularProgressIndicator(),
            ),
        authenticated: (_) => NavbarView(),
        unauthenticated: (_) => AuthView());
  }
}
