import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenges_acceptance/firebase_options.dart';
import 'package:flutter_challenges_acceptance/utils/app_theme.dart';
import 'package:flutter_challenges_acceptance/utils/route/app_router.dart';
import 'package:flutter_challenges_acceptance/utils/route/app_routes.dart';
import 'package:flutter_challenges_acceptance/views/pages/custom_bottom_navbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      theme: AppTheme.lightTheme(),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.bottomNavbar,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
