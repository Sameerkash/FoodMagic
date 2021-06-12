import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/user/user.dart';
import '../../providers/providers.dart';
import '../../services/repository.dart';

part 'profile.vm.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.loading() = _Loading;
  const factory ProfileState.data({required User user}) = _Data;
  const factory ProfileState.error({String? error}) = _Error;
}

class ProfileVM extends StateNotifier<ProfileState> {
  Repository repo;

  ProfileVM(ProviderReference ref)
      : repo = ref.read(repoProvider),
        super(ProfileState.loading()) {
    getUserProfile();
  }

  void getUserProfile() async {
    final res = await repo.getProfile();

    if (res != null) {
      state = ProfileState.data(user: res);
    } else {
      state = ProfileState.error();
    }
  }

  void updateProfile(Map<String, dynamic> form) async {
    print(form);
    User user = User.fromJson(form);
    final res = await repo.updateProfile(user: user);
    if (res != null) state = ProfileState.data(user: res);
  }

  void updateImage(String path) async {
    final current = state;
    if (current is _Data) {
      final u = current.user;

      final res = await repo.updateImageUrl(user: u, path: path);

      if (res != null) state = ProfileState.data(user: res);
    }
  }
}
