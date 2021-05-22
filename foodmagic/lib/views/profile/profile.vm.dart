import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/user/user.dart';
import '../../providers/auth.provider.dart';
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
        super(ProfileState.loading());

  void getUserProfile() async {



  }
}
