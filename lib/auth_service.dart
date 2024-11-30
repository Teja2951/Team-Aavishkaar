import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final _supabase = Supabase.instance.client;

  Future<AuthResponse> signInWithEmailPassword(String email , String password) async{
    return await _supabase.auth.signInWithPassword(
      email: email,
      password: password
    );
  }

  Future<AuthResponse> signUpWithEmailPassword(String email , String password) async{
    return await _supabase.auth.signUp(
      email: email,
      password: password
    );
  }

  Future<void> SignOut() async {
    return _supabase.auth.signOut();
  }

  String? getUserEmail() {
    final session = Supabase.instance.client.auth.currentSession;
    final user = session?.user;
    return user?.email; 
  } 

  String? getUserId() {
    final user = Supabase.instance.client.auth.currentUser;
    return user!.id;
  }


}