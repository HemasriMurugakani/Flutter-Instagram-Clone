import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practice_widgets/widgets/story_page.dart';

class CircleStory extends StatelessWidget {
  const CircleStory({Key? key}) : super(key: key);

  Future<String?> fetchUserImage() async {
    try {
      final response =
          await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['data'][0]['avatar'];
      } else {
        throw Exception('Failed to load user image');
      }
    } catch (e) {
      print('Error fetching user image: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: fetchUserImage(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError || snapshot.data == null) {
          return Text('Error loading image');
        } else {
          final imageUrl = snapshot.data!;
          return GestureDetector(
            onTap: () {
              if (imageUrl != null) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => StoryPage(
                      imageUrl: imageUrl,
                    ),
                  ),
                );
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: ClipOval(
                child: imageUrl != null
                    ? Image.network(
                        imageUrl,
                        height: 68,
                        width: 68,
                        fit: BoxFit.cover,
                      )
                    : Placeholder(),
              ),
            ),
          );
        }
      },
    );
  }
}
