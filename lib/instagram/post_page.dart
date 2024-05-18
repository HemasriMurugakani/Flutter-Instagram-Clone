import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _pickVideo(ImageSource source) async {
    final pickedFile = await _picker.pickVideo(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No video selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Post'),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _image != null
              ? Image.file(_image!)
              : Text(
                  'No image or video selected.',
                  style: TextStyle(color: Colors.white),
                ),
          SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _pickImage(ImageSource.gallery),
                  icon: Icon(Icons.photo_library, color: Colors.white),
                  label:
                      Text('Add Photo', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () => _pickImage(ImageSource.camera),
                  icon: Icon(Icons.camera_alt, color: Colors.white),
                  label:
                      Text('Take Photo', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () => _pickVideo(ImageSource.gallery),
                  icon: Icon(Icons.video_library, color: Colors.white),
                  label:
                      Text('Add Video', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () => _pickVideo(ImageSource.camera),
                  icon: Icon(Icons.videocam, color: Colors.white),
                  label:
                      Text('Take Video', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_image != null) {
            print('Display the selected image or video');
          }
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.check, color: Colors.white),
      ),
      backgroundColor: Colors.grey[900],
    );
  }
}

void main() => runApp(MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.dark().copyWith(
          primary: Colors.black,
          onPrimary: Colors.white,
          secondary: Colors.white,
        ),
      ),
      home: PostPage(),
    ));
