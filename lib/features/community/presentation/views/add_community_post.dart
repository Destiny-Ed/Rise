import 'package:flutter/material.dart';
import 'dart:io';

import 'package:rise/core/theme/app_colors.dart';
import 'package:rise/shared/widgets/message.dart';

class AddCommunityPostScreen extends StatefulWidget {
  const AddCommunityPostScreen({super.key});

  @override
  _AddCommunityPostScreenState createState() => _AddCommunityPostScreenState();
}

class _AddCommunityPostScreenState extends State<AddCommunityPostScreen> {
  final TextEditingController _postController = TextEditingController();

  // Function to handle post submission
  void _submitPost() {
    if (_postController.text.isEmpty) {
      errorDialog(context: context, message: "Post cannot be empty!");
      return;
    }

    // Handle posting logic here
    successDialog(context: context, message: "Post submitted successfully!");

    // Clear fields after submission
    _postController.clear();

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text("Create Post", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _postController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "What's on your mind?",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.darkGrey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.darkGrey),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Image Preview
            // if (_selectedImage != null)
            //   Stack(
            //     children: [
            //       ClipRRect(
            //         borderRadius: BorderRadius.circular(10),
            //         child: Image.file(_selectedImage!, height: 200, width: double.infinity, fit: BoxFit.cover),
            //       ),
            //       Positioned(
            //         right: 8,
            //         top: 8,
            //         child: CircleAvatar(
            //           backgroundColor: Colors.red,
            //           child: IconButton(
            //             icon: Icon(Icons.close, color: Colors.white),
            //             onPressed: () => setState(() => _selectedImage = null),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            SizedBox(height: 12),

            // Add Image Button
            ElevatedButton.icon(
              onPressed: _submitPost,
              icon: Icon(Icons.post_add),
              label: Text("Post"),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: AppColors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
