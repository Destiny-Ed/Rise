import 'package:flutter/material.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  _LeaderboardScreenState createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> with SingleTickerProviderStateMixin {
  final String currentUser = "John Doe"; // Logged-in user

  List<Map<String, dynamic>> leaderboardData = [
    {"name": "Alice Johnson", "streak": 35, "avatar": "https://via.placeholder.com/150"},
    {"name": "John Doe", "streak": 30, "avatar": "https://via.placeholder.com/150"}, // Current user
    {"name": "Emma Smith", "streak": 28, "avatar": "https://via.placeholder.com/150"},
    {"name": "Mike Brown", "streak": 26, "avatar": "https://via.placeholder.com/150"},
    {"name": "Sophia Wilson", "streak": 24, "avatar": "https://via.placeholder.com/150"},
  ];

  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(duration: Duration(milliseconds: 500), vsync: this);

    _slideAnimation = Tween<Offset>(
      begin: Offset(0.0, -0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeOut));

    Future.delayed(Duration(milliseconds: 200), () {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Leaderboard")),
      body: Column(
        children: [
          _buildTopThree(),
          Expanded(
            child: ListView.builder(
              itemCount: leaderboardData.length,
              itemBuilder: (context, index) {
                final user = leaderboardData[index];
                return SlideTransition(position: _slideAnimation, child: _buildUserTile(index + 1, user));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopThree() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _trophyTile(2, leaderboardData[1]),
          _trophyTile(1, leaderboardData[0], isChampion: true),
          _trophyTile(3, leaderboardData[2]),
        ],
      ),
    );
  }

  Widget _trophyTile(int rank, Map<String, dynamic> user, {bool isChampion = false}) {
    return Expanded(
      child: Column(
        children: [
          CircleAvatar(
            radius: isChampion ? 40 : 35,
            backgroundImage: NetworkImage(user["avatar"]),
            child: isChampion ? Icon(Icons.emoji_events, size: 30, color: Colors.amber) : null,
          ),
          SizedBox(height: 5),
          Text(user["name"], textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
          Text("🔥 ${user["streak"]} days", style: TextStyle(color: Colors.orangeAccent)),
        ],
      ),
    );
  }

  Widget _buildUserTile(int rank, Map<String, dynamic> user) {
    bool isCurrentUser = user["name"] == currentUser;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: isCurrentUser ? Colors.blue.withOpacity(0.2) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Text("$rank", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        title: Row(
          children: [
            CircleAvatar(backgroundImage: NetworkImage(user["avatar"])),
            SizedBox(width: 10),
            Text(user["name"], style: TextStyle(fontWeight: isCurrentUser ? FontWeight.bold : FontWeight.normal)),
          ],
        ),
        trailing: Text("🔥 ${user["streak"]} days", style: TextStyle(color: Colors.orangeAccent)),
      ),
    );
  }
}
