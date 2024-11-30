import 'package:supabase_flutter/supabase_flutter.dart';

class StreakService {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<void> handleStreak(String userId) async {
  final DateTime currentDate = DateTime.now();

  try {
    // Fetch existing streak data for the user
    final response = await supabase
        .from('streaks')
        .select()
        .eq('user_id', userId)
        .maybeSingle(); // Use maybeSingle to handle no or multiple rows

    // Check if the response is null (no row found)
    if (response == null) {
      // No streak data found, create a new streak
      await supabase.from('streaks').insert({
        'user_id': userId,
        'current_streak': 1,
        'highest_streak': 1,
        'last_active_date': currentDate.toIso8601String(),
      });
      print("New streak created for user $userId");
    } else {
      // Existing streak data found, handle it
      final lastLoginDate = DateTime.parse(response['last_active_date']);
      final difference = currentDate.difference(lastLoginDate).inDays;

      if (difference >= 1 && difference < 2) {
        //if(difference >= 0){
        // Streak should be incremented
        final newStreak = response['current_streak'] + 1;
        final newHighestStreak = newStreak > response['highest_streak']
            ? newStreak
            : response['highest_streak'];

        await supabase.from('streaks').update({
          'current_streak': newStreak,
          'highest_streak': newHighestStreak,
          'last_active_date': currentDate.toIso8601String(),
        }).eq('user_id', userId);

        print("Streak incremented for user $userId");
      } else if (difference >= 2) {
        // Reset the streak
        await supabase.from('streaks').update({
          'current_streak': 1,
          'last_active_date': currentDate.toIso8601String(),
        }).eq('user_id', userId);
        print("Streak reset for user $userId due to inactivity.");
      } else {
        print("No change in streak for user $userId it is $difference.");
      }
    }
  } catch (e) {
    print("Error handling streak: $e");
  }
}


 Future<int> getStreak(String userId) async {
  try {
    // Query Supabase to get the current_streak for a given user_id
    final response = await supabase
        .from('streaks')
        .select('current_streak')  // Correct column name 'current_streak'
        .eq('user_id', userId)
        .single();

    // Check if the response contains data
    if (response != null) {
      // Ensure that current_streak is converted to an integer
      var currentStreak = response['current_streak'];

      // If the value is a string, convert it to an integer
      if (currentStreak is String) {
        currentStreak = int.tryParse(currentStreak) ?? 0; // Convert string to int safely
      }

      print('Current streak: $currentStreak');
      return currentStreak;  // Return the current streak
    } else {
      print("No record found for the user.");
      return 0;  // No record found for the user
    }
  } catch (e) {
    print("Error fetching streak: $e");
    return 0;  // Return 0 in case of error
  }
}

String getUserId() {
  final user = Supabase.instance.client.auth.currentUser;
  if(user != null){
    return user.id;
  }
  else{
    return '';
  }
}


}
