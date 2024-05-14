import 'package:flutter/material.dart';

class CircleStory extends StatelessWidget {
  const CircleStory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(6.0),
      child: ClipOval(
        child: Image(
          height: 68,
          width: 68,
          image: NetworkImage(
              'https://i.pinimg.com/originals/1f/51/03/1f51038bd5af319dd132a3fab9ee3b57.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
