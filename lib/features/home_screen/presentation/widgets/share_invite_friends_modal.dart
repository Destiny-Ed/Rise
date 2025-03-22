import 'package:avatar_stack/animated_avatar_stack.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rise/core/config/constants.dart';
import 'package:rise/core/config/extensions.dart';
import 'package:rise/core/theme/app_colors.dart';

void showShareHiveModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,

    isScrollControlled: true,
    builder: (context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.3,
        maxChildSize: 0.5,
        builder: (context, scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header (Title + Close Button)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Share and $appName", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    IconButton(icon: Icon(Icons.close, size: 24), onPressed: () => Navigator.pop(context)),
                  ],
                ),
                15.height(),

                Text(
                  "You are more likely to stick to your habits if someone finds out about your progress.",
                  style: TextStyle(fontSize: 18, color: AppColors.darkGrey),
                  textAlign: TextAlign.center,
                ),

                15.height(),

                // Subtitle
                Text(
                  "Invite your friends to join the $appName and grow together!",
                  style: TextStyle(fontSize: 16, color: AppColors.darkGrey),
                  textAlign: TextAlign.center,
                ),

                15.height(),

                // Horizontal List of Friends
                Center(
                  child: AnimatedAvatarStack(
                    height: 100,
                    avatars: [for (var n = 0; n < 15; n++) CachedNetworkImageProvider(avatar(n))],
                  ),
                ),

                15.height(),

                // "Select More Friends" Button
                OutlinedButton.icon(
                  onPressed: () {
                    // Open friend selection screen
                  },
                  icon: Icon(Icons.person_add, color: AppColors.primaryColor),
                  label: Text("Select More Friends", style: TextStyle(color: AppColors.primaryColor)),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.primaryColor),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),

                15.height(),

                // Share/Invite Button
                ElevatedButton(
                  onPressed: () {
                    // Handle invite action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    minimumSize: Size(double.infinity, 48),
                  ),
                  child: Text(
                    "Invite",
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
