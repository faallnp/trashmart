import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'pages/login_page.dart';
import 'pages/register_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://vulbrvagbwglsknavrek.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZ1bGJydmFnYndnbHNrbmF2cmVrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjMyODMyOTYsImV4cCI6MjA3ODg1OTI5Nn0.bieMLRaqBU4nHaNeEZNCuVhXFiGGzJrxg_vzF_VIBS4',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // HALAMAN AWAL
      initialRoute: '/login',

      // ROUTES LIST
      routes: {
        '/login': (_) => const LoginPage(),
        '/register': (_) => const RegisterPage(),

        // USER
        
      },
    );
  }
}
