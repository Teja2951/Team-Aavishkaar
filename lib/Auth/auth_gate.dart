import 'package:aavishkaar/Auth/auth_page.dart';
import 'package:aavishkaar/Articles/Part5/home_page.dart';
import 'package:aavishkaar/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context , snapshot){
        final session = snapshot.hasData ? snapshot.data!.session : null;
        if(session != null){
          return LandingPage();
        }
        else{
          return AuthPage();
        }
      }
    );
  }
}