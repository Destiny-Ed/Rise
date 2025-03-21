import 'package:flutter/material.dart';
import 'package:rise/core/config/extensions.dart';
import 'package:rise/core/theme/app_colors.dart';

Widget buildStreakCard(int streakInDays) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.local_fire_department, color: Colors.orange, size: 30),
            10.width(),
            Text("Current Streak: $streakInDays days", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    ),
  );
}

Widget buildLeaderBoardCard(int position) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.leaderboard, color: AppColors.secondaryColor, size: 30),
            10.width(),
            Text("Position In Leaderboard: Level $position", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    ),
  );
}
