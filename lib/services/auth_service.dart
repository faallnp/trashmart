import 'package:supabase_flutter/supabase_flutter.dart';
import 'supabase_client.dart'; // ini berisi Supabase.instance.client

class AuthService {
  final supabase = Supabase.instance.client;

  // REGISTER
  Future<String?> register(String email, String password) async {
    try {
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
      );

      if (response.user == null) {
        return "Gagal membuat akun";
      }

      return null; // sukses
    } on AuthException catch (e) {
      return e.message;
    } catch (e) {
      return "Terjadi kesalahan: $e";
    }
  }

  // LOGIN
  Future<String?> login(String email, String password) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user == null) {
        return "Email atau password salah";
      }

      return null; // sukses
    } on AuthException catch (e) {
      return e.message;
    } catch (e) {
      return "Terjadi kesalahan: $e";
    }
  }

  // LOGIN GOOGLE
  Future<String?> loginWithGoogle() async {
    try {
      await supabase.auth.signInWithOAuth(
        OAuthProvider.google,
        redirectTo: "io.supabase.flutter://login-callback/",
      );
      return null;
    } catch (e) {
      return "Google Login gagal: $e";
    }
  }
}
