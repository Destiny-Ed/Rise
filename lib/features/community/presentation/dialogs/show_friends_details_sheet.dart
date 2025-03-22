import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rise/core/config/constants.dart';
import 'package:rise/core/config/extensions.dart';
import 'package:rise/core/theme/app_colors.dart';
import 'package:rise/features/community/presentation/widgets/comment_tile.dart';
import 'package:rise/features/home_screen/presentation/widgets/share_invite_friends_modal.dart';
import 'package:rise/shared/widgets/message.dart';

void showFriendDetailsBottomSheet(
  BuildContext context,
  String friendName,
  String habitName,
  int streakCount,
  int missedDays,
  int unmissedDays,
  List<Map<String, dynamic>> comments, {
  bool isCurrentUser = false,
}) {
  TextEditingController commentController = TextEditingController();

  showModalBottomSheet(
    context: context,
    useSafeArea: true,
    isScrollControlled: true,
    showDragHandle: true,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    builder: (ctx) {
      return Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            10.height(),

            // Friend's Avatar
            CircleAvatar(
              radius: 40,
              backgroundColor: AppColors.primaryColor,
              child: CachedNetworkImage(imageUrl: avatar(friendName)), // Replace with real image
            ),
            10.height(),

            // Friend's Name
            Text(friendName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

            // Habit Name
            Text("Current Habit: $habitName", style: TextStyle(fontSize: 16, color: Colors.grey[700])),
            10.height(),

            // Streak Count Section
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _streakBox("🔥 Streak", streakCount, Colors.orangeAccent),
                10.width(),
                _streakBox("✅ Unmissed", unmissedDays, AppColors.secondaryColor),
                10.width(),
                _streakBox("❌ Missed", missedDays, AppColors.red),
              ],
            ),
            16.height(),

            Row(
              children: [
                // Comments Section
                Text("Comments (${comments.length})", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.pop(ctx);
                    showShareHiveModal(context);
                  },
                  child: Row(
                    children: [
                      Text("Invite Friends", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      5.width(),
                      Icon(Icons.share),
                    ],
                  ),
                ),
              ],
            ),
            10.height(),

            // Comments List
            Expanded(
              child:
                  comments.isEmpty
                      ? Center(child: Text("No comments yet. Be the first!"))
                      : ListView.builder(
                        shrinkWrap: true,
                        itemCount: comments.length,
                        itemBuilder: (context, index) {
                          final comment = comments[index];
                          return commentTile(comment["username"], comment["comment"], comment["likes"]);
                        },
                      ),
            ),

            // Comment Input Field
            TextFormField(
              controller: commentController,
              decoration: InputDecoration(
                hintText: "Write a comment...",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                suffixIcon: IconButton(
                  icon: Icon(Icons.send, color: AppColors.primaryColor),
                  onPressed: () {
                    if (commentController.text.trim().isNotEmpty) {
                      successDialog(context: context, message: "Comment added!");
                      commentController.clear();
                    }
                  },
                ),
              ),
            ),
            30.height(),
          ],
        ),
      );
    },
  );
}

// Widget for streak/missed/unmissed days box
Widget _streakBox(String title, int count, Color color) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
    child: Column(
      children: [
        Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
        Text("$count", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
      ],
    ),
  );
}
