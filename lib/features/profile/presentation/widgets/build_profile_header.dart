import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rise/core/config/constants.dart';

Widget buildProfileHeader() {
  return Container(
    padding: EdgeInsets.all(20),
    alignment: Alignment.center,
    child: Column(
      children: [
        CircleAvatar(radius: 40, backgroundImage: CachedNetworkImageProvider(avatar("destinyed"))),
        SizedBox(height: 10),
        Text("Destiny Ed", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text("destiny.ed@example.com", style: TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    ),
  );
}
