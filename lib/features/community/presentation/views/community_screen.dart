import 'package:flutter/material.dart';
import 'package:rise/core/config/constants.dart';
import 'package:rise/core/config/extensions.dart';
import 'package:rise/features/community/data/models/user_avatar_model.dart';
import 'package:rise/features/community/presentation/dialogs/show_invite_bottom_sheet.dart';
import 'package:rise/features/community/presentation/views/add_community_post.dart';
import 'package:rise/features/community/presentation/widgets/community_post_card.dart';
import 'package:rise/features/community/presentation/widgets/horizontal_avatar_list.dart';
import 'package:rise/shared/widgets/section_title_widget.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Community", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: false,
        elevation: 0,
        forceMaterialTransparency: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Pending Invites & Friends
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionTitle(title: "Pending Invites"),
                  HorizontalAvatarList(
                    isInvites: true,
                    items: List.generate(5, (index) => UserProfile(name: "User ${index + 1}", imageUrl: avatar(index))),
                  ),
                  12.height(),
                  SectionTitle(title: "Friends"),
                  HorizontalAvatarList(
                    isInvites: false,
                    items: List.generate(
                      8,
                      (index) => UserProfile(name: "Friend ${index + 1}", imageUrl: avatar(index + 5)),
                    ),
                  ),
                ],
              ),
            ),

            // Recent Posts (Scrollable Together)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SectionTitle(title: "Recent Community Posts"),
            ),
            10.height(),

            ListView.builder(
              physics: NeverScrollableScrollPhysics(), // Disable separate scrolling
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: 10,
              itemBuilder: (context, index) {
                return CommunityPostCard(
                  username: "User ${index + 1}",
                  profilePic: avatar({index + 10}),
                  postContent: "This is a sample community post from User ${index + 1}.",
                  timeAgo: "${index + 2}h ago",
                );
              },
            ),
          ],
        ),
      ),

      // Floating Button to Add Community Post
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle post creation
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddCommunityPostScreen()));
        },
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.add, size: 28, color: Colors.white),
      ),
    );
  }
}
