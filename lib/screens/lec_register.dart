import 'package:anithapp/screens/lec_message_screen.dart';
import 'package:anithapp/widgets/text_feild.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class LecRegisterScreen extends StatefulWidget {
  const LecRegisterScreen({super.key});

  @override
  State<LecRegisterScreen> createState() => _LecRegisterScreenState();
}

class _LecRegisterScreenState extends State<LecRegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoaging = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 49, 0, 163),
        title: const Text(
          'Lecturer Register',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              //image for logo
              Image.network(
                'http://innotal.unwe.bg/ufiles/partners/University%20of%20Ruhuna-%20Sri%20Lanka.jpg',
                height: 150,
              ),
              const SizedBox(
                height: 64,
              ),
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
              //button for login
              const SizedBox(
                height: 30,
              ),
              isLoaging
                  ? const CircularProgressIndicator(
                      color: primaryColor,
                    )
                  : Container(),
              //button for signup to navigate to signup screen
              const SizedBox(
                height: 10,
              ),

              TextButton(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Lecturer Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Color.fromARGB(255, 49, 0, 163),
                  ),
                ),
                onPressed: () {
                  //go to lec message screen
                  if (_emailController.text.isNotEmpty ||
                      _passwordController.text.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LecMessageScreen(
                          lecEmail: _emailController.text,
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please enter email and password'),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
