import 'package:aavishkaar/chatbot.dart';
import 'package:aavishkaar/streak_service.dart';
import 'package:aavishkaar/streak_widget.dart';
import 'package:flutter/material.dart';
import 'package:aavishkaar/auth_service.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser;

    int completedArticles = 12;
    int totalArticles = 20;
    double progress = totalArticles > 0
        ? (completedArticles / totalArticles).clamp(0, 1)
        : 0.0;

    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.white, // Deep purple to contrast with the background
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.purple.shade100, Colors.blue.shade100], // Gradient background
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Avatar and email row
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage('https://static.vecteezy.com/system/resources/previews/002/002/403/non_2x/man-with-beard-avatar-character-isolated-icon-free-vector.jpg'),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            user?.email ?? 'Your Email',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),

                          Text('any headline'),


                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Streak widget - Take full width with better styling
              
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: StreakWidget(),
              ), 

              // Cards Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    // Progress Card
                    _buildDashboardCard(
                      title: "Progress",
                      content: CircularPercentIndicator(
                        radius: 70.0,
                        lineWidth: 10.0,
                        animation: true,
                        percent: progress,
                        center: Text(
                          "${(progress * 100).toStringAsFixed(1)}%",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        progressColor: Colors.greenAccent,
                        backgroundColor: Colors.grey.shade200,
                      ),
                      cardColor: Colors.blue.shade300, // Card color changed to a gradient blue
                    ),
                    // Achievements Card
                    _buildDashboardCard(
                      title: "Achievements",
                      content: Icon(
                        Icons.star_border_outlined,
                        color: Colors.white,
                        size: 100,
                      ),
                      cardColor: Colors.orange.shade300, // Card color changed to a warm orange
                    ),
                    
                  ],
                ),
              ),

              Divider(color: Colors.black45, thickness: 0.5),

              // Full-width Logout Button with modern look
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
      ),
    );
  }

  // Method to build Dashboard Cards with consistent style and custom colors
  Widget _buildDashboardCard({required String title, required Widget content, required Color cardColor}) {
    return Container(
      height: 250,
      width: 180,
      decoration: BoxDecoration(
        color: cardColor, // Use passed card color
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(2, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Center(child: content),
        ],
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
