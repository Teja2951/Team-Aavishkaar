import 'package:aavishkaar/auth_service.dart';
import 'package:aavishkaar/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isSignIn = true;
  final authService = AuthService();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void logIn() async {
    final email = emailController.text;
    final password = passwordController.text;

    try {
      await authService.signInWithEmailPassword(email, password);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('error $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }


  void signup() async {
    final email = emailController.text;
    final password = passwordController.text;
    final confirmpassoword = confirmPasswordController.text;

    if (password != confirmpassoword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password don\'t match')),
      );
      return;
    }

    try {
      await authService.signUpWithEmailPassword(email, password);
      setState(() {
        isSignIn = true;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('error $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                height: 80,
                width: double.infinity,
                child: Image.asset('assets/Logo.png'),
              ),
              const SizedBox(height: 20),
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    width: 4,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/appBanner.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                child: Container(
                  height: 60,
                  width: double.infinity,
                  color: Colors.greenAccent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isSignIn = true;
                          });
                        },
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: isSignIn ? Colors.black : Colors.green,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isSignIn = false;
                          });
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: !isSignIn ? Colors.black : Colors.green,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isSignIn)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Welcome Again!!',
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'Continue your journey into the constitution.',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.email),
                              labelText: 'Email',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(color: Colors.black, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock),
                              labelText: 'Password',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(color: Colors.black, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
                              ),
                            ),
                            obscureText: true,
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                              ),
                              onPressed: logIn,
                              child: const Text(
                                'Sign In',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      )
                    else
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Create a new account',
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.email),
                              labelText: 'Email',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(color: Colors.black, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock),
                              labelText: 'Password',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(color: Colors.black, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
                              ),
                            ),
                            obscureText: true,
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            controller: confirmPasswordController,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock),
                              labelText: 'Confirm Password',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(color: Colors.black, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
                              ),
                            ),
                            obscureText: true,
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                              ),
                              onPressed: signup,
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              const Text(
                'version 1.0',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
