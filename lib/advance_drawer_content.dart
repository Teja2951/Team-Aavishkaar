import 'package:aavishkaar/Bills/bill_list_page.dart';
import 'package:aavishkaar/article6_page.dart';
import 'package:aavishkaar/landing_page.dart';
import 'package:aavishkaar/streak_widget.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AdvancedDrawerContent extends StatefulWidget {
  @override
  State<AdvancedDrawerContent> createState() => _AdvancedDrawerContentState();
}

class _AdvancedDrawerContentState extends State<AdvancedDrawerContent> {
  @override
  Widget build(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser;
     String userName =  user?.email!.split('@')[0] ?? 'Your Name';
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
  colors: [
    Color(0xFFFF0000), // Bright Red
    Color(0xFFFF1493), // Deep Pink
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
)



        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(height: 20,),
            // Header
            Container(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Display the username (without the email domain part)
                      Text(
                        userName, // Only the username (before @)
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        overflow: TextOverflow.ellipsis, // Handle long text overflow
                      ),
                      // Display the full email address below the username
                      Text(
                        user?.email ?? 'Your Email', // Full email
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.ellipsis, // Handle long text overflow
                      ),
                    ],
                  ),
                ],
              ),
            ),


             Padding(
              padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
              child: StreakWidget(),
            ),
        
            //**************************************************************//
            //                 Dont forgrt to link back to                  //
            //                  to landingpage to avoid nav stack           //
            //                                                              //
            //**************************************************************//
            Expanded(
              child: ListView(
                children: [
                  _buildListTile(Icons.home, 'Home',LandingPage()),
                  _buildListTile(Icons.book_online_rounded, 'Billl',BillsListScreen()),
                  _buildListTile(Icons.sports, 'Contests',LandingPage()),
                  _buildListTile(Icons.event, 'Events',LandingPage()),
                  _buildListTile(Icons.search, 'Resources',Article6Page()),
                ],
              ),
            ),

            Divider(),
        
            // Footer
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
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


                  Text(
                    'Made with 😍 by Team Aavishkaar',
                    style: TextStyle(fontSize: 14, color: Colors.amber),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

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


   Widget _buildListTile(IconData icon, String title, Widget screen , {Color iconColor = Colors.black}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15), // Semi-transparent background
        borderRadius: BorderRadius.circular(15), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: iconColor),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => screen),
            );
        },
      ),
    );
  }



}
