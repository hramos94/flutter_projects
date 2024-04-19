import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isTextObscure = true;
  final TextEditingController emailSignUpController = TextEditingController();

  final TextEditingController passwordSignUpController =
      TextEditingController();

  Future<User?> signUp(String email, String password) async {
    try {
      UserCredential userSignUp = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return userSignUp.user;
    } catch (e) {
      print("error $e");
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: InkWell(
              onTap: () {
                Modular.to.navigate('/');
              },
              child: const Icon(Icons.arrow_back)),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sign Up!',
              style: TextStyle(color: Colors.black, fontSize: 32),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: TextField(
                controller: emailSignUpController,
                decoration: const InputDecoration(
                    fillColor: Colors.white54, filled: true, hintText: 'Email'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: TextField(
                controller: passwordSignUpController,
                obscureText: isTextObscure,
                decoration: InputDecoration(
                    suffixIcon: isTextObscure
                        ? InkWell(
                            onTap: () {
                              setState(() {
                                isTextObscure = !isTextObscure;
                              });
                            },
                            child: const Icon(Icons.disabled_visible_outlined))
                        : InkWell(
                            onTap: () {
                              setState(() {
                                isTextObscure = !isTextObscure;
                              });
                            },
                            child: const Icon(Icons.remove_red_eye_outlined)),
                    fillColor: Colors.white54,
                    filled: true,
                    hintText: 'Password'),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () async {
                var userSignUp = await signUp(
                    emailSignUpController.text, passwordSignUpController.text);
                if (userSignUp != null) {
                  Modular.to.navigate('/weather/');
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black),
                child: const Center(
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
