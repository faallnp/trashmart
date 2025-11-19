import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  static Future<void> init() async {
    await Supabase.initialize(
     url: 'https://vulbrvagbwglsknavrek.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZ1bGJydmFnYndnbHNrbmF2cmVrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjMyODMyOTYsImV4cCI6MjA3ODg1OTI5Nn0.bieMLRaqBU4nHaNeEZNCuVhXFiGGzJrxg_vzF_VIBS4',
    );
  }
}

final supabase = Supabase.instance.client;
