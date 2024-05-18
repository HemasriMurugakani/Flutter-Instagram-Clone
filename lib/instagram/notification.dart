import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Notification Page',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: NotificationPage(),
    );
  }
}

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool _isFollowing1 = false;
  bool _isFollowing2 = false;

  void _toggleFollow1() {
    setState(() {
      _isFollowing1 = !_isFollowing1;
    });
  }

  void _toggleFollow2() {
    setState(() {
      _isFollowing2 = !_isFollowing2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Following',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(width: 16),
            Text(
              'You',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          SizedBox(width: 48),
        ],
      ),
      body: Container(
        color: Colors.black,
        child: ListView(
          children: [
            _buildSectionHeader('This Week'),
            _buildNotificationTile(
              'https://cdn.pixabay.com/photo/2024/04/17/15/06/ai-generated-8702284_640.jpg',
              'zarsaballa',
              'started following you.',
              '3d',
              actionWidget: _buildFollowButton(
                isFollowing: _isFollowing1,
                onPressed: _toggleFollow1,
              ),
            ),
            _buildSectionHeader('This Month'),
            _buildNotificationTile(
              'https://cdn.pixabay.com/photo/2024/04/17/15/06/ai-generated-8702284_640.jpg',
              'erwelonquit',
              'started following you.',
              '2w',
              actionWidget: _buildFollowButton(
                isFollowing: _isFollowing2,
                onPressed: _toggleFollow2,
              ),
            ),
            _buildLikeNotificationTile(
              'https://cdn.pixabay.com/photo/2022/04/05/20/21/jack-russell-terrier-7114378_960_720.jpg',
              'samcalisura, riiighteye and 32 others',
              'liked your post.',
              '2w',
              'https://cdn.pixabay.com/photo/2016/10/15/05/23/girl-1741941_960_720.jpg',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  Widget _buildNotificationTile(
      String profileImageUrl, String username, String action, String time,
      {Widget? actionWidget, String? postImageUrl}) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(profileImageUrl),
      ),
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: username,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            TextSpan(
              text: ' $action',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      subtitle: Text(time, style: TextStyle(color: Colors.white70)),
      trailing: actionWidget ??
          (postImageUrl != null
              ? Image.network(postImageUrl, width: 50, height: 50)
              : null),
    );
  }

  Widget _buildLikeNotificationTile(String profileImageUrl, String username,
      String action, String time, String postImageUrl) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(profileImageUrl),
      ),
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: username,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            TextSpan(
              text: ' $action',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      subtitle: Text(time, style: TextStyle(color: Colors.white70)),
      trailing: Image.network(postImageUrl, width: 50, height: 50),
    );
  }

  Widget _buildFollowButton(
      {required bool isFollowing, required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isFollowing ? Colors.grey : Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Text(isFollowing ? 'Following' : 'Follow'),
    );
  }
}
