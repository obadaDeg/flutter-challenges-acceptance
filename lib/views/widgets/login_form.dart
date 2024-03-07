import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges_acceptance/utils/app_colors.dart';
import 'package:flutter_challenges_acceptance/view_models/auth_cubit/auth_cubit.dart';
import 'package:flutter_challenges_acceptance/views/widgets/form_text_feild.dart';
import 'package:flutter_challenges_acceptance/views/widgets/main_button.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  bool _isVisible = false;
  bool isLogin = true;

  void toggleForm() {
    setState(() {
      isLogin = !isLogin;
      _formKey.currentState?.reset();
    });
  }

  void togglePasswordVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    return null;
  }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your username';
    }
    return null;
  }

  void handleAuthAction() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;
      if (isLogin) {
        context.read<AuthCubit>().signInWithEmailAndPassword(email, password);
      } else {
        final username = _usernameController.text;
        context
            .read<AuthCubit>()
            .signUpWithEmailAndPassword(email, password, username);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (!isLogin)
                CustomFormField(
                  controller: _usernameController,
                  labelText: 'Username',
                  validator: validateUsername,
                  keyboardType: TextInputType.text,
                  icon: const Icon(
                    Icons.person,
                    color: AppColors.grey,
                  ),
                ),
              const SizedBox(height: 16),
              CustomFormField(
                controller: _emailController,
                labelText: isLogin ? 'Email or Phone Number' : 'Email',
                validator: validateEmail,
                keyboardType: TextInputType.emailAddress,
                icon: const Icon(
                  Icons.email,
                  color: AppColors.grey,
                ),
              ),
              const SizedBox(height: 16),
              CustomFormField(
                controller: _passwordController,
                labelText: 'Password',
                validator: validatePassword,
                isPassword: true,
                keyboardType: TextInputType.text,
                isVisible: _isVisible,
                onPressedVisibility: togglePasswordVisibility,
                icon: const Icon(
                  Icons.lock,
                  color: AppColors.grey,
                ),
              ),
              const SizedBox(height: 24),
              MainButton(
                onPressed: handleAuthAction,
                title: isLogin ? 'Sign In' : 'Create Account',
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextButton(
                    onPressed: toggleForm,
                    child: Text(
                      isLogin
                          ? "Don't have an account? Register"
                          : "Already have an account? Login",
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              if (isLogin) ...[
                SignInButton(
                  Buttons.Google,
                  onPressed: () {},
                  text: "Sign in with Google",
                ),
                const SizedBox(height: 16),
                SignInButton(
                  Buttons.Facebook,
                  onPressed: () {},
                  text: "Sign in with Facebook",
                ),
              ] else ...[
                SignInButton(
                  Buttons.Google,
                  onPressed: () {},
                  text: "Sign up with Google",
                ),
                const SizedBox(height: 16),
                SignInButton(
                  Buttons.Facebook,
                  onPressed: () {},
                  text: "Sign up with Facebook",
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
