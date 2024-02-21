import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges_acceptance/utils/app_colors.dart';
import 'package:flutter_challenges_acceptance/view_models/profile_cubit/profile_cubit.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>(
      create: (context) {
        final cubit = ProfileCubit();
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
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(
                                'assets/images/me.jpg'), // Placeholder image
                          ),
                          Positioned(
                            bottom: -3,
                            right: -5,
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.edit,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Obada Daghlas', // Placeholder name
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'obada2daghlas@gmail.com', // Placeholder email
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
                          backgroundColor: AppColors.primary,
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
                    const SizedBox(height: 20),
                    _buildSectionHeader(title: 'General'),
                    ..._buildProfileListTiles(state.profile),
                    _buildSectionHeader(title: 'Preferences'),
                    ..._buildPreferencesListTiles(),
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

  Widget _buildSectionHeader({required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }

  List<Widget> _buildProfileListTiles(List<ProfileListTile> tiles) {
    return tiles
        .map((detail) => ListTile(
              leading: Icon(detail.icon, color: AppColors.primary),
              title: Text(detail.title),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
              onTap: detail.onTap,
            ))
        .toList();
  }

  List<Widget> _buildPreferencesListTiles() {
    return preferencesList
        .map((detail) => ListTile(
              leading: Icon(detail.icon, color: AppColors.primary),
              title: Text(detail.title),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
              onTap: detail.onTap,
            ))
        .toList();
  }
}

class ProfileListTile {
  final IconData icon;
  final String title;
  final Function()? onTap;
  const ProfileListTile({
    required this.icon,
    required this.title,
    this.onTap,
  });
}

List<ProfileListTile> profileList = const [
  ProfileListTile(
    icon: Icons.person_outline,
    title: 'Profile',
    onTap: null,
  ),
  ProfileListTile(
    icon: Icons.notifications_none_outlined,
    title: 'Notifications',
    onTap: null,
  ),
  ProfileListTile(
    icon: Icons.credit_card_outlined,
    title: 'Payment',
    onTap: null,
  ),
  ProfileListTile(
    icon: Icons.location_on_outlined,
    title: 'Address',
    onTap: null,
  ),
];

List<ProfileListTile> preferencesList = const [
  ProfileListTile(
    icon: Icons.notifications_none_outlined,
    title: 'Notifications',
    onTap: null,
  ),
  ProfileListTile(
    icon: Icons.credit_card_outlined,
    title: 'Payment',
    onTap: null,
  ),
  ProfileListTile(
    icon: Icons.location_on_outlined,
    title: 'Address',
    onTap: null,
  ),
  ProfileListTile(
    icon: Icons.settings_outlined,
    title: 'Settings',
    onTap: null,
  ),
  ProfileListTile(
    icon: Icons.help_outline,
    title: 'Help',
    onTap: null,
  ),
  ProfileListTile(
    icon: Icons.logout,
    title: 'Logout',
    onTap: null,
  ),
];
