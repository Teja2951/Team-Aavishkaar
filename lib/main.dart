import 'package:aavishkaar/Auth/auth_gate.dart';
import 'package:aavishkaar/Auth/auth_page.dart';
import 'package:aavishkaar/Profile/Streaks/streak_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://gcgmapbczlophcztzcvj.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdjZ21hcGJjemxvcGhjenR6Y3ZqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzE2OTI0MDEsImV4cCI6MjA0NzI2ODQwMX0.FzDN31kSqG6GR_k8jjWKX01WIcTJyDjQfcLIU3KRsFk',
  );

  Gemini.init(
    apiKey: 'AIzaSyAiiK5e3IczRDfbb-wz59_m2x0XQ12Vnno',
  );



  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          displayMedium: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
          displaySmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
          headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
          bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
          labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          labelSmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
          ),
      ),
      home: AuthGate(),
    );
  }
}