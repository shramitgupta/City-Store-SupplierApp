import 'package:flutter/material.dart';
import 'package:ms_supplier_app/auth/supplier_login.dart';
import 'package:ms_supplier_app/auth/supplier_signup.dart';
import 'package:ms_supplier_app/main_screens/customer_home.dart';
import 'package:ms_supplier_app/main_screens/onboarding_screen.dart';
import 'package:ms_supplier_app/main_screens/supplier_home.dart';
import 'package:ms_supplier_app/main_screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ms_supplier_app/providers/cart_provider.dart';
import 'package:ms_supplier_app/providers/wish_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/welcome_screen',
      routes: {
        '/welcome_screen': (context) => const WelcomeScreen(),
        '/onboarding_screen': (context) => const Onboardingscreen(),
        '/customer_home': (context) => const CustomerHomeScreen(),
        '/supplier_home': (context) => const SupplierHomeScreen(),
        '/supplier_signup': (context) => const SupplierRegister(),
        '/supplier_login': (context) => const SupplierLogin(),
      },
    );
  }
}
