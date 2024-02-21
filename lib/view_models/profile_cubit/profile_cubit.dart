import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges_acceptance/views/pages/profle_page.dart';

class ProfileCubit extends Cubit<ProfileState> {
  bool _isClosed = false;

  ProfileCubit() : super(ProfileInitial());

  @override
  Future<void> close() {
    _isClosed = true;
    return super.close();
  }

  void getProfileData() async {
    if (_isClosed) return;
    emit(ProfileLoading());
    try {
      final profile = profileList;
      await Future.delayed(const Duration(seconds: 1));
      if (_isClosed) return;
      emit(ProfileLoaded(profile));
    } catch (e) {
      if (_isClosed) return;
      emit(ProfileError(e.toString()));
    }
  }
}

sealed class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final List<ProfileListTile> profile;
  ProfileLoaded(this.profile);
}

class ProfileError extends ProfileState {
  final String message;
  ProfileError(this.message);
}
