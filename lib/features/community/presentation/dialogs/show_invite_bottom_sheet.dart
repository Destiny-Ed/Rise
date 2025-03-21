import 'package:flutter/material.dart';

void showInviteBottomSheet(BuildContext context, String inviterName, String habitName) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Avatar
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.blueAccent,
              child: Icon(Icons.person, size: 40, color: Colors.white),
            ),
            SizedBox(height: 12),

            // Title
            Text(
              "$inviterName invited you!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),

            // Habit Name
            Text(
              "Join the habit: \"$habitName\"",
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Decline Button
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Decline", style: TextStyle(color: Colors.red, fontSize: 16)),
                ),

                // Accept Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("You joined \"$habitName\"!"), backgroundColor: Colors.green),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text("Accept", style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
            SizedBox(height: 8),
          ],
        ),
      );
    },
  );
}
