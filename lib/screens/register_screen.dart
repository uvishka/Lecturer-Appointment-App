import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import '../../screens/login_screen.dart';
import '../../utils/colors.dart';
import '../../utils/util_functions.dart';
import '../../widgets/button.dart';

import '../responsive/mobile_screen_layout.dart';
import '../responsive/responsive_layout_screen.dart';
import '../responsive/web_screen_layout.dart';
import '../services/auth_logic.dart';
import '../widgets/text_feild.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //controllers for the text feilds
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  Uint8List? _profileImage;
  bool isLoading = false;

  //auth logic instance
  final AuthMethodes _authMethodes = AuthMethodes();

  //register the user
  void registerUser() async {
    setState(() {
      isLoading = true;
    });
    //get the user data from the text feilds
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String bio = _bioController.text.trim();
    String userName = _userNameController.text.trim();

    //register the user
    String result = await _authMethodes.registerWithEmailAndPassword(
      email: email,
      password: password,
      userName: userName,
      bio: bio,
      profilePic: _profileImage!,
    );

    //show the snak bar if the user is created or not
    if (result == "email-already-in-use" ||
        result == "weak-password" ||
        result == "invalid-email") {
      showSnakBar(context, result);
    } else if (result == 'success') {
      //here the pushReplacement is used for remove the back button from the screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
            webSecreenLayout: WebScreenlayout(),
            mobileScreenLayout: MobileScreenLayout(),
          ),
        ),
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  @override

  //this  dispose methode is for remove the controller data from the memory
  void dispose() {
    super.dispose();
    //dispose the controllers
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _userNameController.dispose();
  }

  //this methode is for select the image from the gallery
  void selectImage() async {
    Uint8List _profileImage = await pickImage(ImageSource.gallery);
    setState(() {
      this._profileImage = _profileImage;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 49, 0, 163),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 32),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //for the top space
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                //image for logo
                Image.network(
                  'http://innotal.unwe.bg/ufiles/partners/University%20of%20Ruhuna-%20Sri%20Lanka.jpg',
                  height: 150,
                ),
                const SizedBox(
                  height: 30,
                ),

                //add a profile image\
                Stack(
                  children: [
                    //if the profile image is null show the default image
                    _profileImage != null
                        ? CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.grey[300],
                            backgroundImage: MemoryImage(_profileImage!),
                          )
                        : CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.grey[300],
                            backgroundImage: const NetworkImage(
                                "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.flaticon.com%2Ffree-icon%2Fuser_149071&psig=AOvVaw3owq6hsZz1mGZPfENEKViS&ust=1705616950037000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCLiKjri85YMDFQAAAAAdAAAAABAD"),
                          ),

                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: IconButton(
                          onPressed: selectImage,
                          icon: Icon(
                            Icons.add_a_photo,
                            color: Colors.yellow.shade600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 30,
                ),
                //text feild for email
                TextFeildInput(
                  hintText: 'Enter Email',
                  controller: _emailController,
                  isPassword: false,
                  inputkeyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 30,
                ),
                //text feild for password
                TextFeildInput(
                  hintText: 'Enter Password',
                  controller: _passwordController,
                  isPassword: true,
                  inputkeyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(
                  height: 30,
                ),

                //text feild for username
                TextFeildInput(
                  hintText: 'Enter Username',
                  controller: _userNameController,
                  isPassword: false,
                  inputkeyboardType: TextInputType.name,
                ),
                //text feild for bio
                const SizedBox(
                  height: 30,
                ),
                TextFeildInput(
                  hintText: 'Enter Bio',
                  controller: _bioController,
                  isPassword: false,
                  inputkeyboardType: TextInputType.text,
                ),
                //button for login
                const SizedBox(
                  height: 30,
                ),
                isLoading
                    ? const CircularProgressIndicator(
                        color: primaryColor,
                      )
                    : CustomButon(
                        text: 'Register',
                        onPressed: registerUser,
                      ),
                //button for signup to navigate to signup screen

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Log in.',
                        style: TextStyle(color: Colors.white),
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
