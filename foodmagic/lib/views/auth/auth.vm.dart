import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/user/user.dart';
import '../../providers/providers.dart';
import '../../services/repository.dart';

part 'auth.vm.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticated({User? user}) = _Authenticated;
  const factory AuthState.unauthenticated() = _UnAuthenticated;
}

class AuthVM extends StateNotifier<AuthState> {
  Repository repo;
  AuthVM(ProviderReference ref)
      : repo = ref.read(repoProvider),
        super(AuthState.loading()) {
    checkUserAuth();
  }

  Future<void> checkUserAuth() async {
    final res = await repo.getLoggedInUser();
    if (res != null)
      state = AuthState.authenticated();
    else
      state = AuthState.unauthenticated();
  }

  Future<void> signIn({required String email, required String password}) async {
    await repo.signInUser(password: password, email: email);

    checkUserAuth();
  }

  Future<String?> signUp(
      {required String email,
      required String password,
      required String name}) async {
    final res =
        await repo.createUser(name: name, password: password, email: email);
    return res;
  }

  Future<void> logout() async {
    await repo.signOut();
    checkUserAuth();
  }
}
