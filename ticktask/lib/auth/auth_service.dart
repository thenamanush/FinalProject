import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  // sign in with email and password
  Future<AuthResponse> signinWithPassword(String email, String password) async {
    return await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  // sign up with email and passwod
  Future<AuthResponse> signupWithEmailPassword(
    String email,
    String password,
  ) async {
    return await _supabase.auth.signUp(email: email, password: password);
  }

  // sign out
  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  // get user email
}
