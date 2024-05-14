import 'package:flutter/material.dart';
import 'package:practice_widgets/widgets/circle_story.dart';

class PostCart extends StatelessWidget {
  const PostCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /////////////////////////////////////////////////////////////////////
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.0, top: 3),
                  child: SizedBox(height: 55, width: 55, child: CircleStory()),
                ),
                SizedBox(
                  width: 3,
                ),
                Text(
                  'ig_username',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            )
          ],
        ),
        ///////////////////////////////////////////////////////////////////////////
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const Image(
              image: NetworkImage(
                  'https://www.bitsathy.ac.in/wp-content/uploads/2022/09/staffbg-scaled.jpg')),
        ),
        //////////////////////////////////////////////////////////////////////////
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 2.0),
                    child: Icon(
                      Icons.favorite_outline_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 13.0),
                    child: Icon(
                      Icons.chat_bubble_outline_rounded,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 13.0),
                    child: Icon(
                      Icons.near_me_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  )
                ],
              ),
              Icon(
                Icons.bookmark_border,
                color: Colors.white,
                size: 30,
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 12.0),
          child: Row(
            children: [
              Text(
                '133 likes',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 14.0),
                  child: Text(
                    'ig_username',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 3,
                ),
                Text(
                  'Bannari Amman Institute of Technology',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Row(
            children: [
              Text(
                'view 14 comments',
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
      ],
    );
  }
}
