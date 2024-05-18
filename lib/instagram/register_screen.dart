import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main_screen.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  void _register() {
    if (_formKey.currentState!.validate()) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Successfully registered')),
      );

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const MainScreen(),
        ),
      );
    }
  }

  String? _validateEmail(String? value) {
    final emailRegEx = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!emailRegEx.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? _validateMobile(String? value) {
    final mobileRegEx = RegExp(r'^[0-9]{10}$');
    if (value == null || value.isEmpty) {
      return 'Mobile number is required';
    } else if (!mobileRegEx.hasMatch(value)) {
      return 'Enter a valid 10-digit mobile number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 30),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 60,
                      width: 180,
                      child: Image(
                        image: AssetImage('assets/img/logo.png'),
                      ),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign up to see photos and pictures from your friends",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  width: 327,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.facebook),
                      SizedBox(width: 7),
                      Center(
                        child: Text(
                          'Log in with Facebook',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 1,
                      width: 150,
                      color: Colors.grey.shade700,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'OR',
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    ),
                    Container(
                      height: 1,
                      width: 150,
                      color: Colors.grey.shade700,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                    fillColor: Colors.grey.shade700,
                    filled: true,
                    constraints:
                        BoxConstraints.tightFor(width: 327, height: 50),
                    hintStyle: const TextStyle(color: Colors.grey),
                    hintText: 'Username',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Username is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                    fillColor: Colors.grey.shade700,
                    filled: true,
                    constraints:
                        BoxConstraints.tightFor(width: 327, height: 50),
                    hintStyle: const TextStyle(color: Colors.grey),
                    hintText: 'Password',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                    fillColor: Colors.grey.shade700,
                    filled: true,
                    constraints:
                        BoxConstraints.tightFor(width: 327, height: 50),
                    hintStyle: const TextStyle(color: Colors.grey),
                    hintText: 'E-mail',
                  ),
                  validator: _validateEmail,
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: _mobileController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                    fillColor: Colors.grey.shade700,
                    filled: true,
                    constraints:
                        BoxConstraints.tightFor(width: 327, height: 50),
                    hintStyle: const TextStyle(color: Colors.grey),
                    hintText: 'Mobile Number',
                  ),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: _validateMobile,
                ),
                const SizedBox(height: 15),
                InkWell(
                  onTap: _register,
                  child: Container(
                    width: 327,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "By signing up, you agree to our Terms and Policy",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 120),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Have an account ? ",
                      style: TextStyle(color: Colors.white),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        " Log in",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
