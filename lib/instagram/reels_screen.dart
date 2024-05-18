import 'package:flutter/material.dart';
import 'package:practice_widgets/widgets/circle_story.dart';

class ReelEx1 extends StatelessWidget {
  const ReelEx1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: const Text(
          'Reels',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.camera_alt_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                'First Reel',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.favorite_outline,
                              color: Colors.white,
                              size: 30,
                            ),
                            Text(
                              '122k',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.chat_bubble_outline_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                            Text(
                              '563',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 3),
                            child: SizedBox(
                              height: 55,
                              width: 55,
                              child: CircleStory(),
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            'User 1',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.near_me_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReelEx2 extends StatelessWidget {
  const ReelEx2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: const Text(
          'Reels',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.camera_alt_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                'Second Reel',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.favorite_outline,
                              color: Colors.white,
                              size: 30,
                            ),
                            Text(
                              '122k',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.chat_bubble_outline_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                            Text(
                              '563',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 3),
                            child: SizedBox(
                              height: 55,
                              width: 55,
                              child: CircleStory(),
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            'User 2',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.near_me_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReelsScreen extends StatelessWidget {
  ReelsScreen({Key? key}) : super(key: key);

  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        scrollDirection: Axis.vertical,
        children: const [ReelEx1(), ReelEx2()],
      ),
    );
  }
}
