// Horizontal Avatar List with Names
import 'package:flutter/material.dart';
import 'package:rise/core/theme/app_colors.dart';
import 'package:rise/features/community/data/models/user_avatar_model.dart';
import 'package:rise/features/community/presentation/dialogs/show_friends_details_sheet.dart';
import 'package:rise/features/community/presentation/dialogs/show_invite_bottom_sheet.dart';

class HorizontalAvatarList extends StatelessWidget {
  final List<UserProfile> items;
  final bool isInvites;
  const HorizontalAvatarList({super.key, required this.items, required this.isInvites});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110, // Adjusted height to fit images + usernames
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(vertical: 8),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (isInvites) {
                showInviteBottomSheet(context, items[index].name, "Read book every day");
              } else {
                showFriendDetailsBottomSheet(
                  context,
                  "Treasure",
                  "Morning Workout",
                  12, // Streak Count
                  3, // Missed Days
                  9, // Unmissed Days
                  [
                    {"username": "Destiny", "comment": "Keep it up!🔥", "likes": 5},
                    {"username": "Alice", "comment": "Amazing streak!", "likes": 2},
                  ],
                );
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(items[index].imageUrl),
                    backgroundColor: AppColors.secondaryColor.withAlpha(40),
                  ),
                  SizedBox(height: 5),
                  Text(items[index].name, style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
