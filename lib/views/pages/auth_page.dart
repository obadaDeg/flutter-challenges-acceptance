import 'package:flutter/material.dart';
import 'package:flutter_challenges_acceptance/utils/app_colors.dart';
import 'package:flutter_challenges_acceptance/views/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.05),
              Text(
                'Welcome to our store! 🎉',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Please, login with registered account or register!',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: AppColors.grey,
                    ),
              ),
              const SizedBox(height: 16),
              const LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
