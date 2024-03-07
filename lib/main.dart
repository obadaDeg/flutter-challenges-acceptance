import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges_acceptance/firebase_options.dart';
import 'package:flutter_challenges_acceptance/utils/app_theme.dart';
import 'package:flutter_challenges_acceptance/utils/route/app_router.dart';
import 'package:flutter_challenges_acceptance/utils/route/app_routes.dart';
import 'package:flutter_challenges_acceptance/view_models/auth_cubit/auth_cubit.dart';
import 'package:flutter_challenges_acceptance/view_models/theme_cubit/theme_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = AuthCubit();
        cubit.getCurrentUser();
        return cubit;
      },
      child: Builder(builder: (context) {
        final cubit = BlocProvider.of<AuthCubit>(context);
        return BlocBuilder<AuthCubit, AuthState>(
          bloc: cubit,
          buildWhen: (previous, current) =>
              current is AuthInitial || current is AuthSuccess,
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'E-Commerce App',
              theme: AppTheme.lightTheme(),
              initialRoute: state is AuthSuccess
                  ? AppRoutes.bottomNavbar
                  : AppRoutes.homeLogin,
              onGenerateRoute: AppRouter.onGenerateRoute,
            );
          },
        );
      }),
    );
  }
}
