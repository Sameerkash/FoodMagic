import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/auth.provider.dart';
import 'auth/auth.view.dart';
import 'navbar.view.dart';

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
