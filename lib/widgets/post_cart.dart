import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practice_widgets/widgets/circle_story.dart';

class PostCart extends StatefulWidget {
  const PostCart({Key? key}) : super(key: key);

  @override
  _PostCartState createState() => _PostCartState();
}

class _PostCartState extends State<PostCart> {
  bool isFavorite = false;
  bool isBookmarked = false;
  int likeCount = 0;
  List<String> comments = [];
  TextEditingController commentController = TextEditingController();
  late String imageNetworkUrl =
      'https://via.placeholder.com/150'; // Placeholder image

  Future<void> fetchImages() async {
    final response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      final List<dynamic> users = jsonBody['data'];
      final String imageUrl = users.isNotEmpty ? users[1]['avatar'] : '';
      setState(() {
        imageNetworkUrl =
            imageUrl.isNotEmpty ? imageUrl : 'https://via.placeholder.com/150';
      });
    } else {
      throw Exception('Failed to load images');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchImages();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8.0, top: 3),
                  child: SizedBox(height: 55, width: 55, child: CircleStory()),
                ),
                const SizedBox(
                  width: 3,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const ProfilePage(username: 'ig_username')),
                    );
                  },
                  child: const Text(
                    'ig_username',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            )
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Image.network(
            imageNetworkUrl,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 2.0),
                    child: IconButton(
                      icon: Icon(
                        isFavorite
                            ? Icons.favorite_rounded
                            : Icons.favorite_outline_rounded,
                        color: isFavorite ? Colors.red : Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                          if (isFavorite) {
                            likeCount++;
                          }
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 13.0),
                    child: Icon(
                      Icons.chat_bubble_outline_rounded,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 13.0),
                    child: Icon(
                      Icons.near_me_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  )
                ],
              ),
              IconButton(
                icon: Icon(
                  isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  color: isBookmarked ? Colors.white : Colors.grey,
                  size: 30,
                ),
                onPressed: () {
                  setState(() {
                    isBookmarked = !isBookmarked;
                  });
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Row(
            children: [
              Text(
                '$likeCount likes',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: Text(
                  'ig_username',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                'Bannari Amman Institute of Technology',
                style: TextStyle(color: Colors.white),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Row(
            children: [
              Text(
                'view 10 comments',
                style: TextStyle(color: Colors.grey.shade500),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 5),
          child: Row(
            children: [
              Text(
                '2 days ago',
                style: TextStyle(color: Colors.grey.shade500),
              ),
            ],
          ),
        ),
        // Comment section
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: commentController,
            decoration: InputDecoration(
              hintText: 'Add a comment...',
              suffixIcon: IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  setState(() {
                    final newComment = commentController.text;
                    if (newComment.isNotEmpty) {
                      comments.add(newComment);
                      commentController.clear();
                    }
                  });
                },
              ),
            ),
          ),
        ),
        // Display comments
        if (comments.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: comments
                .map((comment) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 4.0),
                      child: Text(
                        comment,
                        style: TextStyle(color: Colors.white),
                      ),
                    ))
                .toList(),
          ),
      ],
    );
  }
}

class ProfilePage extends StatelessWidget {
  final String username;

  const ProfilePage({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Text('Profile Page for $username'),
      ),
    );
  }
}
