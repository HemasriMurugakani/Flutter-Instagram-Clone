import 'package:flutter/material.dart';
import 'package:practice_widgets/instagram/register_screen.dart';
import 'package:practice_widgets/instagram/login_screen.dart';
import 'package:practice_widgets/widgets/circle_story.dart';
import 'package:practice_widgets/widgets/story_widget.dart';
import 'package:practice_widgets/instagram/settingspage.dart';
import 'package:practice_widgets/instagram/post_page.dart'; 

class ProfileScreen extends StatelessWidget {
  final List<String> _stories = [
    'Story 1',
    'Story 2',
    'Story 3',
    'Story 4',
    'Story 5'
  ];

  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          title: const Text(
            'insta_username',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          actions: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            PostPage(), 
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.add_box_outlined,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SettingsPage(),
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.table_rows_rounded,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.black,
        body: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5.0, left: 10),
                  child: CircleStory(),
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          '0',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                        Text(
                          'Posts',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '300',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                    Text(
                      'Followers',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: 26.0),
                  child: Column(
                    children: [
                      Text(
                        '280',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                      Text(
                        'Following',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'ig_username',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'User Bio !',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 30,
                    width: 330,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 253, 252, 252),
                        borderRadius: BorderRadius.circular(8)),
                    child: const Center(
                        child: Text(
                      'Edit Profile',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 247, 245, 245),
                        borderRadius: BorderRadius.circular(8)),
                    child: const Center(
                      child: Icon(
                        Icons.person_add,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 16.0, left: 18),
                  child: Text(
                    'Story Highlights',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                  itemCount: _stories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return StoryWidget(
                      username: _stories[index],
                    );
                  }),
            ),
            const TabBar(tabs: <Widget>[
              Tab(
                icon:
                    Icon(Icons.video_collection_outlined, color: Colors.white),
              ),
              Tab(
                icon: Icon(Icons.person_add_alt_outlined, color: Colors.white),
              ),
            ]),
            const Expanded(
              child: TabBarView(
                children: <Widget>[
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                          size: 60,
                        ),
                        Text(
                          "No Posts Yet",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Icon(
                          Icons.person_add,
                          color: Colors.white,
                          size: 60,
                        ),
                        Text(
                          "Photos and videos of you",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
