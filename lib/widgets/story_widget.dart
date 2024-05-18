import 'package:flutter/material.dart';
import 'package:practice_widgets/widgets/circle_story.dart';

class StoryWidget extends StatelessWidget {
  final String username;
  final Widget? additionalIcon;

  const StoryWidget({
    Key? key,
    required this.username,
    this.additionalIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.pink, width: 3),
                ),
              ),
              const CircleStory(),
              if (additionalIcon != null)
                Positioned(
                  top: 50,
                  right: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: additionalIcon,
                  ),
                ),
            ],
          ),
        ),
        Text(
          username,
          style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
        ),
      ],
    );
  }
}
