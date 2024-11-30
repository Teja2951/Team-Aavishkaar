import 'package:aavishkaar/chatbot.dart';
import 'package:aavishkaar/streak_service.dart';
import 'package:aavishkaar/streak_widget.dart';
import 'package:flutter/material.dart';
import 'package:aavishkaar/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';  // Make sure your AuthService is imported

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.indigoAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Edit profile functionality
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.purpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Profile Header Section
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage('https://static.vecteezy.com/system/resources/previews/002/002/403/non_2x/man-with-beard-avatar-character-isolated-icon-free-vector.jpg'),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      user?.email ?? 'Your Email',
                      style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 0, 0, 0)),
                    ),
                    const SizedBox(height: 16),
                    // Streak Widget
                    Container(
                      width: double.infinity,
                      child: StreakWidget()
                    ),
                    const SizedBox(height: 16),
                    Divider(color: Colors.white,),

                  ],
                ),
              ),
            ),

            // Divider above Logout button
            Divider(color: Colors.black),

            // Full-width Logout Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  _showLogoutDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFDC143C), // Background color (Crimson Red)
                  foregroundColor: Colors.white, // Foreground color (Text color)
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 18),
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                  ),
                  elevation: 5, // Add elevation for a shadow effect
                  minimumSize: Size(double.infinity, 0),
                ),
                child: Text(
                  'Log Out',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to show a confirmation dialog before logging out
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text('Are you sure?', style: TextStyle(fontWeight: FontWeight.bold)),
          content: Text(
            'Do you really want to log out? You’ll need to log in again to access your profile.',
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Cancel', style: TextStyle(color: Colors.grey)),
            ),
            TextButton(
              onPressed: () async {
                await Supabase.instance.client.auth.signOut();  // Use Supabase signOut
                Navigator.pop(context);  // Close the dialog
                Navigator.pop(context);  // Go back to previous screen after logging out
              },
              child: Text('Log Out', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}
