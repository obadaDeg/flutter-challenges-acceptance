import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges_acceptance/models/user_model.dart';
import 'package:flutter_challenges_acceptance/view_models/profile_cubit/profile_cubit.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>(
      create: (context) {
        final userId =
            'O3wOl9q4GSbdavy1yAeTcFbZ7w03'; // Use the actual user ID here
        final cubit = ProfileCubit(userId);
        cubit.getProfileData();
        return cubit;
      },
      child: Scaffold(
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProfileError) {
              return Center(child: Text(state.message));
            } else if (state is ProfileLoaded) {
              final user = state.profile;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(user.profileImage ?? ''),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${user.firstName ?? ''} ${user.lastName ?? ''}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      user.email ?? '',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: 190,
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO: Add navigation to edit profile
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Edit Profile',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
