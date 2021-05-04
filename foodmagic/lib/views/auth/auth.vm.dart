import 'package:foodmagic/models/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
part 'auth.vm.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticated() = _Authenticated;
  const factory AuthState.unauthenticated({required User user}) =
      _UnAuthenticated;
}

class AuthVM extends StateNotifier<AuthState> {
  AuthVM() : super(AuthState.loading());
}
