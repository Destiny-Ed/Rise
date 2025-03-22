import 'package:flutter/material.dart';
import 'package:rise/core/config/extensions.dart';
import 'package:rise/core/theme/app_colors.dart';
import 'package:rise/features/profile/presentation/widgets/build_list_tile.dart';
import 'package:rise/features/profile/presentation/widgets/build_profile_header.dart';
import 'package:rise/features/profile/presentation/widgets/build_cards.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final habitLevel = getHabitLevel(60);

    return Scaffold(
      appBar: AppBar(title: Text("Profile"), centerTitle: false, forceMaterialTransparency: true),
      body: Column(
        children: [
          // Profile Picture & Username
          buildProfileHeader(),

          // Settings List
          buildStreakCard(12),
          buildLeaderBoardCard(30),
          20.height(),

          // Gamified Badge Section
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("🎖️ Your Habit Level: ${habitLevel.title}", style: TextStyle(fontSize: 16)),
                      Spacer(),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(AppColors.primaryColor),
                          foregroundColor: WidgetStateProperty.all(AppColors.white),
                        ),
                        onPressed: () {},
                        child: Text("Upgrade"),
                      ),
                    ],
                  ),

                  10.height(),
                  LinearProgressIndicator(
                    value: habitLevel.value / 100,
                    color: habitLevel.color,
                    backgroundColor: Colors.white.withOpacity(0.2),
                    minHeight: 8,
                  ),
                ],
              ),
            ),
          ),
          10.height(),

          buildListTile(
            icon: Icons.dark_mode,
            title: "Dark Mode",
            trailing: Switch(
              value: isDarkMode,
              onChanged: (val) {
                // TODO: Implement Theme Switching Logic
              },
            ),
          ),

          buildListTile(
            icon: Icons.notifications,
            title: "Notifications",
            trailing: Switch(
              value: true,
              onChanged: (val) {
                // TODO: Implement Notification Toggle Logic
              },
            ),
          ),
          Spacer(),

          buildListTile(
            icon: Icons.info_outline,
            title: "About App",
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: "Rise - Habit Tracker",
                applicationVersion: "1.0.0",
                applicationIcon: Icon(Icons.track_changes, size: 40),
                children: [
                  Text(
                    "Rise is a powerful habit tracker designed to help users build and maintain habits, stay consistent, and reach their goals. With features like streak tracking, social habit sharing, reminders, and leaderboards, Rise makes habit-building engaging and effective.",
                  ),
                ],
              );
            },
          ),

          buildListTile(
            icon: Icons.logout,
            title: "Logout",
            titleColor: Colors.red,
            onTap: () {
              // TODO: Implement Logout Logic
            },
          ),

          30.height(),
        ],
      ),
    );
  }

  ({Color color, String title, int value}) getHabitLevel(int level) {
    switch (level) {
      case < 50:
        return (color: AppColors.red, title: "Silver", value: level);
      case > 49 && < 100:
        return (color: AppColors.amber, title: "Bronze", value: level);
      case >= 100:
        return (color: AppColors.secondaryColor, title: "Platinum", value: level);
      default:
        return (color: AppColors.red, title: "No Level", value: level);
    }
  }
}
