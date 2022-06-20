import 'package:flash_chat/components/reUsable_button.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  // This is route to be used in main.dart
  static String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // This is manditory to use modalProgressHud
  bool showSpinner = false;

  // These three is authenticate with firebase about email & Password //
  final _auth = FirebaseAuth.instance;
  
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
               const SizedBox(
                  height: 48.0,
                ),
                TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: kTextInputDecoratin.copyWith(
                    hintText: 'Enter Your Email',
                  ),
                ),
               const SizedBox(
                  height: 8.0,
                ),
                TextField(
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kTextInputDecoratin.copyWith(
                    hintText: 'Enter Your Password',
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                ReUsableButton(
                    color: Colors.lightBlueAccent,
                    onPressed: () {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        // if user logins with email & password then get into chatScreen
                        final user = _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        if (user != null) {
                          Navigator.pushNamed(context, ChatScreen.id);
                        }
                        setState(() {
                          showSpinner = false;
                        });
                      } catch (e) {
                        print(e);
                      }
                    },
                    text: 'Log In'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
