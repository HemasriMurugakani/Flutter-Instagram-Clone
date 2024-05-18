import 'package:flutter/material.dart';
import 'package:practice_widgets/instagram/profile_screen.dart';
import 'package:practice_widgets/instagram/reels_screen.dart';
import 'package:practice_widgets/instagram/search_screen.dart';
import 'package:practice_widgets/widgets/post_cart.dart';
import 'package:practice_widgets/widgets/story_widget.dart';
import 'package:practice_widgets/instagram/notification.dart';
import 'package:practice_widgets/instagram/settingspage.dart';
import 'package:practice_widgets/instagram/post_page.dart';
import 'package:practice_widgets/instagram/reels_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController _pageController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PostPage()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ReelsScreen()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          HomeScreen(),
          const SearchScreen(),
          Container(),
          Container(),
          ProfileScreen(),
          SettingsPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: '',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: '',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.smart_display_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
            backgroundColor: Colors.black,
          ),
        ],
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        showUnselectedLabels: true,
        iconSize: 30,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<String> _stories = [
    'Story 1',
    'Story 2',
    'Story 3',
    'Story 4',
    'Story 5'
  ];
  final List<String> _posts = [
    'Post 1',
    'Post 2',
    'Post 3',
    'Post 4',
    'Post 5'
  ];

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.black,
        title: const SizedBox(
          height: 50,
          width: 120,
          child: Image(image: AssetImage('assets/img/logo.png')),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        NotificationPage(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1.0, 0.0);
                      const end = Offset.zero;
                      const curve = Curves.easeInOut;
                      var tween = Tween(begin: begin, end: end).chain(
                        CurveTween(curve: curve),
                      );
                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: Icon(
                Icons.favorite_outline_rounded,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        ChatPage(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1.0, 0.0);
                      const end = Offset.zero;
                      const curve = Curves.easeInOut;
                      var tween = Tween(begin: begin, end: end).chain(
                        CurveTween(curve: curve),
                      );
                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: Icon(
                Icons.energy_savings_leaf_outlined,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: const Color.fromARGB(255, 245, 242, 242),
            height: 1,
            width: MediaQuery.of(context).size.width,
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              itemCount: _stories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return StoryWidget(
                  username: _stories[index],
                  additionalIcon: index == 0
                      ? const Icon(Icons.add, color: Colors.white, size: 20)
                      : null,
                );
              },
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 238, 234, 234),
            height: 1,
            width: MediaQuery.of(context).size.width,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _posts.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return const PostCart();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ChatPage extends StatelessWidget {
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
          children: [
            SizedBox(width: 10),
            Text(
              'insta_username',
              style: TextStyle(color: Colors.white),
            ),
            Spacer(),
            Icon(Icons.circle, color: Colors.red, size: 12),
            SizedBox(width: 10),
            Icon(Icons.camera_alt, color: Colors.white),
            SizedBox(width: 10),
            Icon(Icons.edit, color: Colors.white),
          ],
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Ask Meta AI anything',
                  hintStyle: TextStyle(
                    color: const Color.fromARGB(255, 158, 158, 158),
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  filled: true,
                  fillColor: Colors.grey[800],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 4),
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  storyItem(
                    'Your note',
                    'https://cdn.pixabay.com/photo/2018/04/05/09/32/portrait-3292287_960_720.jpg',
                  ),
                  storyItem(
                    'User 1',
                    'https://cdn.pixabay.com/photo/2014/09/20/05/17/buddhists-453393_960_720.jpg',
                  ),
                  storyItem(
                    'User 2',
                    'https://cdn.pixabay.com/photo/2014/09/20/05/17/buddhists-453393_960_720.jpg',
                  ),
                  storyItem(
                    'User 3',
                    'https://cdn.pixabay.com/photo/2018/04/05/09/32/portrait-3292287_960_720.jpg',
                  ),
                  storyItem(
                    'User 4',
                    'https://cdn.pixabay.com/photo/2018/04/05/09/32/portrait-3292287_960_720.jpg',
                  ),
                  storyItem(
                    'User 5',
                    'https://cdn.pixabay.com/photo/2016/10/15/05/23/girl-1741941_960_720.jpg',
                  ),
                  storyItem(
                    'User 6',
                    'https://cdn.pixabay.com/photo/2018/04/05/09/32/portrait-3292287_960_720.jpg',
                  ),
                ],
              ),
            ),
            SizedBox(height: 4),
            Expanded(
              child: ListView(
                children: [
                  messageItem(
                    'User 1',
                    'Sent 18h ago',
                    'https://cdn.pixabay.com/photo/2018/04/05/09/32/portrait-3292287_960_720.jpg',
                  ),
                  messageItem(
                    'User 2',
                    'Sent a reel by twist_iruku_... 2d',
                    'https://cdn.pixabay.com/photo/2018/04/05/09/32/portrait-3292287_960_720.jpg',
                  ),
                  messageItem(
                    'User 3',
                    'Tq da 2d',
                    'https://cdn.pixabay.com/photo/2018/04/27/03/51/woman-3353702_960_720.jpg',
                  ),
                  messageItem(
                    'User 4',
                    'Liked a message 3d',
                    'https://cdn.pixabay.com/photo/2016/10/15/05/23/girl-1741941_960_720.jpg',
                  ),
                  messageItem(
                    'User 5',
                    'Liked a message 4d',
                    'https://cdn.pixabay.com/photo/2014/09/20/05/17/buddhists-453393_960_720.jpg',
                  ),
                  messageItem(
                    'User 6',
                    'Liked a message 4d',
                    'https://cdn.pixabay.com/photo/2018/04/05/09/32/portrait-3292287_960_720.jpg',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget storyItem(String name, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(imageUrl),
          ),
          SizedBox(height: 4),
          Text(
            name,
            style: TextStyle(color: Colors.white),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget messageItem(String name, String message, String imageUrl) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Text(
        name,
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        message,
        style: TextStyle(color: Colors.grey),
      ),
      trailing: Icon(Icons.camera_alt, color: Colors.white),
    );
  }
}
