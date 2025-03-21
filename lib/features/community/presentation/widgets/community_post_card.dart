import 'package:flutter/material.dart';
import 'package:rise/core/theme/app_colors.dart';

/// Community Post Card
class CommunityPostCard extends StatelessWidget {
  final String username;
  final String profilePic;
  final String postContent;
  final String timeAgo;

  const CommunityPostCard({
    super.key,
    required this.username,
    required this.profilePic,
    required this.postContent,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      color: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundImage: NetworkImage(profilePic), radius: 22),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(username, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(timeAgo, style: TextStyle(color: AppColors.grey, fontSize: 12)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(postContent),
            SizedBox(height: 8),
            Row(
              children: [
                IconButton(icon: Icon(Icons.thumb_up_alt_outlined), onPressed: () {}),
                Text("23", style: TextStyle(color: AppColors.darkGrey, fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
