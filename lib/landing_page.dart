import 'package:aavishkaar/bookmarks_screen.dart';
import 'package:aavishkaar/chatbot2.dart';
import 'package:aavishkaar/streak_service.dart';
import 'package:animate_gradient/animate_gradient.dart';
import 'package:aavishkaar/article6_page.dart';
import 'package:aavishkaar/auth_service.dart';
import 'package:aavishkaar/chatbot.dart';
import 'package:aavishkaar/one_minute_read.dart';
import 'package:aavishkaar/pages/games_screen.dart';
import 'package:aavishkaar/home_page.dart';
import 'package:aavishkaar/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;
  int _streakCount = 0;
  StreakService _helper = StreakService();

  final Map<String, Widget> articleScreens = {
    "Part 5": HomePage(),
    "Part 6": Article6Page(),
  };

  late final List<Widget> _screens;
  @override
  void initState() {
    super.initState();
    _screens = [
      HomeScreen(articleScreens: articleScreens),
      GamesScreen(),
      OneMinuteRead(),
      EventsScreen(),
      ProfileScreen(),
    ];
  }

  Future<int> _fetchStreak() async {
    final _userId = await _helper.getUserId();
    return await _helper.getStreak(_userId);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimateGradient(
        primaryColors: const [
          Colors.pink,
          Colors.pinkAccent,
          Colors.white,
        ],
        secondaryColors: const [
          Colors.blue,
          Colors.blueAccent,
          Colors.white,
        ],
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_selectedIndex == 0) ...[
                  _buildGreetingSection(),
                  const SizedBox(height: 20),
                ],
                _screens[_selectedIndex],
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildNavBarItem(Icons.home, 'Home', 0),
                buildNavBarItem(Icons.gamepad, 'Games', 1),
                SizedBox(width: 20),
                buildNavBarItem(Icons.new_label, 'OneM', 2),
                buildNavBarItem(Icons.event, 'Events', 3),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: ClipOval(
        child: Material(
          color: const Color.fromARGB(255, 81, 0, 255),
          elevation: 10,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Chatbot2Screen()),
              );
            },
            child: SizedBox(
              width: 60,
              height: 60,
              child: Icon(Icons.mic, size: 28, color: Colors.white),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget buildNavBarItem(IconData icon, String label, int index) {
    return InkWell(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: _selectedIndex == index ? Colors.orange : Colors.black,
          ),
          Text(
            label,
            style: TextStyle(
                color: _selectedIndex == index ? Colors.orange : Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildGreetingSection() {
  final authService = AuthService();
  final username = authService.getUserEmail();
  String name = username!.replaceAll("@gmail.com", "");
  final user = Supabase.instance.client.auth.currentUser;

  // Example streak count
  final streakCount = _helper.getStreak(user!.id); // Replace with actual logic to fetch streak count

  return Stack(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Profile icon
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Colors.deepPurple, Colors.blueAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: IconButton(
                    icon: const Icon(
                      Icons.person_2_rounded,
                      size: 30,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfileScreen()),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Greeting text
          Stack(
            children: [
              Container(
                height: 175,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Positioned(
                top: 20,
                child: Container(
                  height: 150,
                  width: 325,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: const Color.fromARGB(255, 0, 0, 0), width: 0),
                    color: const Color.fromARGB(255, 8, 100, 166),
                  ),
                ),
              ),
              Positioned(
                top: 20,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello,\n$name!',
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      const Text(
                        'What U wanna learn....',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: -10,
                left: 190,
                child: Container(
                  height: 100,
                  width: 150,
                  child: Image.asset('assets/containerGraphic.png'),
                ),
              )
            ],
          )
        ],
      ),
      // Streak icon at the top-right
      Positioned(
        top: 25,
        right: -20,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>  ProfileScreen(),
              ),
                      );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                const Icon(
                  Icons.local_fire_department, // Fire icon
                  color: Colors.orangeAccent,
                  size: 36,
                ),
                const SizedBox(width: 4),
                // FutureBuilder to fetch and display streak count
                FutureBuilder<int>(
                  future: _fetchStreak(), // Fetch streak count asynchronously
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      return Text(
              '${snapshot.data}', // Display the fetched streak count
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.orangeAccent,
              ),
                      );
                    } else {
                      return const Text('N/A.');
                    }
                  },
                ),
              ],
              
                ),
              ),

                SizedBox(width: 20,),


               GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BookmarksScreen(),
        ),
      );
    },
    child: Container(
      height: 40, // Same height as the Streaks button
      width: 40,  // Same width as the Streaks button
      decoration: BoxDecoration(
        //color: Colors.blueAccent, // Matching or complementary color
        borderRadius: BorderRadius.circular(12), // Rounded corners for consistency
        
      ),
      child: Icon(
        Icons.bookmark_rounded,
        color: Colors.orangeAccent, // White for better contrast
        size: 30, // Appropriately sized icon
      ),
    ),
  ),

            ],
          ),
        ),
      ),
    ],
  );
}
}

class HomeScreen extends StatelessWidget {
  final Map<String, Widget> articleScreens;
  const HomeScreen({super.key, required this.articleScreens});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildGridSection(
            context,
            title: 'Explore Constitution',
            cards: [
              _buildPartCard(context, "Part 5", Icons.book, Colors.blueAccent,
                  Colors.lightBlue),
              _buildPartCard(context, "Part 6", Icons.gavel,
                  Colors.greenAccent, Colors.lightGreen),
              _buildPartCard(context, "Preamble", Icons.library_books,
                  Colors.orangeAccent, Colors.amber),
              _buildPartCard(context, "Amendments", Icons.account_balance,
                  Colors.purpleAccent, Colors.deepPurple),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGridSection(BuildContext context,
      {required String title, required List<Widget> cards}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Divider(color: Colors.black,),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: cards,
        ),
      ],
    );
  }

  Widget _buildPartCard(BuildContext context, String title, IconData icon,
      Color primaryColor, Color secondaryColor) {
    return GestureDetector(
      onTap: () {
        final screen = articleScreens[title];
        if (screen != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        }
      },
      child: Card(
        color: secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [primaryColor, secondaryColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 40, color: Colors.white),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}