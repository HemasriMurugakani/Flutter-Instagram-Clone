import 'package:flutter/material.dart';
import 'package:practice_widgets/instagram/login_screen.dart';
import 'package:practice_widgets/instagram/register_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings Page',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 14, 13, 13),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: const Color.fromARGB(255, 243, 237, 237),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.people, color: Colors.white),
            title: Text('Follow and invite friends',
                style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.notifications, color: Colors.white),
            title: Text('Notifications', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.lock, color: Colors.white),
            title: Text('Privacy', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.security, color: Colors.white),
            title: Text('Security', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.ads_click, color: Colors.white),
            title: Text('Ads', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.account_circle, color: Colors.white),
            title: Text('Account', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.help, color: Colors.white),
            title: Text('Help', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.info, color: Colors.white),
            title: Text('About', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.palette, color: Colors.white),
            title: Text('Theme', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          Divider(color: Colors.grey), 
          ListTile(
            title: Text('Add account', style: TextStyle(color: Colors.blue)),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => RegisterScreen()),
              );
            }, 
          ),
          ListTile(
            title: Text('Log Out', style: TextStyle(color: Colors.blue)),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
