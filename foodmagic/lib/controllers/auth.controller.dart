import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:foodmagic/models/user/user.dart';
import 'package:foodmagic/services/locator.dart';
import 'package:foodmagic/services/repository.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final Rx<AuthenticationState> _state = AuthenticationState().obs;

  AuthenticationState get state => _state.value;

  @override
  onInit() {
    getAuthState();
    super.onInit();
  }

  void getAuthState() async {
    _state.value = AuthenticationLoading();

    final user = await getIt<Repository>().getLoggedInUser();
    print(user);
    if (user == null)
      _state.value = UnAuthenticated();
    else
      _state.value = Authenticated();
  }

  void signUp({String email, String name, String password}) async {
    await getIt<Repository>().createUser(email: email, password: password);
    getAuthState();
  }

  void signIn(String email, String password) async {
    await getIt<Repository>().signInUser(email: email, password: password);
    getAuthState();
  }

  void signOut() async {
    await getIt<Repository>().signOut();
    _state.value = UnAuthenticated();
  }
}

/// Authentication State
class AuthenticationState extends Equatable {
  const AuthenticationState();
  @override
  List<Object> get props => [];
}

class AuthenticationLoading extends AuthenticationState {}

class UnAuthenticated extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  // final AppUser user;

  // Authenticated({@required this.user});

  @override
  List<Object> get props => [];
}

class AuthenticationFailure extends AuthenticationState {
  final String message;

  AuthenticationFailure({@required this.message});

  @override
  List<Object> get props => [message];
}
