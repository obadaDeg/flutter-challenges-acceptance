import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges_acceptance/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final String userId;
  bool _isClosed = false;

  ProfileCubit(this.userId) : super(ProfileInitial());

  void safeEmit(ProfileState state) {
    if (!_isClosed) {
      emit(state);
    }
  }

  void getProfileData() async {
    safeEmit(ProfileLoading());
    try {
      final userDoc = await FirebaseFirestore.instance
          .collection('Users')
          .doc(userId)
          .get();
      final user = User.fromJson(userDoc.data()!);
      safeEmit(ProfileLoaded(user));
    } catch (e) {
      safeEmit(ProfileError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _isClosed = true;
    return super.close();
  }
}



sealed class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final User profile;
  ProfileLoaded(this.profile);
}

class ProfileError extends ProfileState {
  final String message;
  ProfileError(this.message);
}
