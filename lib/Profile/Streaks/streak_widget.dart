import 'package:aavishkaar/Profile/Streaks/streak_service.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


// Make this a future rather than set state to update on change

class StreakWidget extends StatefulWidget {
  const StreakWidget({Key? key}) : super(key: key);

  @override
  _StreakWidgetState createState() => _StreakWidgetState();
}

class _StreakWidgetState extends State<StreakWidget> {
  final SupabaseClient supabase = Supabase.instance.client;
  int userStreak = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchStreak();
  }

  Future<void> _fetchStreak() async {
    final user = supabase.auth.currentUser;
    if (user != null) {
      final streakService = StreakService();
      try {
        final streak = await streakService.getStreak(user.id);
        setState(() {
          userStreak = streak;
          isLoading = false;
        });
      } catch (e) {
        print("Error fetching streak: $e");
        setState(() {
          isLoading = false;
        });
      }
    } else {
      print("No user found");
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _updateStreak() async {
    final SupabaseClient supabase = Supabase.instance.client;
    final DateTime currentDate = DateTime.now();
    final user = Supabase.instance.client.auth.currentUser;
    
    if (user != null) {
      final streakService = StreakService();
      await streakService.handleStreak(user.id); // This will handle streak update
      await streakService.getStreak(user.id);
      var userStreak = streakService.getStreak(user.id);
      setState((){
        userStreak = userStreak;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.indigoAccent,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: isLoading
          ? Center(child: CircularProgressIndicator(color: Colors.white))
          : Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Your Streak",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "$userStreak Days!",
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  userStreak > 1
                      ? "Keep up the great work! 🔥"
                      : "Start your streak today!",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: _updateStreak,
                    splashColor: Colors.white.withOpacity(0.3), // Ripple color
                    highlightColor: Colors.white.withOpacity(0.1), // Pressed color
                    borderRadius: BorderRadius.circular(8),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 150),
                      curve: Curves.easeInOut,
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Text(
                        "Boost My Streak!",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
