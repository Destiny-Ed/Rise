// Comment Tile with Reactions
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rise/core/config/constants.dart';
import 'package:rise/core/theme/app_colors.dart';

Widget commentTile(String username, String comment, int likes) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(child: CachedNetworkImage(imageUrl: avatar(username))),
            title: Text(username, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            subtitle: Text(comment, style: TextStyle(fontSize: 14)),
          ),

          // Reactions Row
          Row(
            children: [
              IconButton(icon: Icon(Icons.thumb_up, color: AppColors.primaryColor, size: 20), onPressed: () {}),
              Text("$likes", style: TextStyle(fontSize: 14)),
              SizedBox(width: 10),
            ],
          ),
        ],
      ),
    ),
  );
}
