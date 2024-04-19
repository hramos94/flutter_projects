import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isTextObscure = true;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signIn() async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
    if (userCredential.user != null) {
      goToPage('weather');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white70,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.login_rounded,
                size: 100,
              ),
              const Text(
                'Login',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    decoration: TextDecoration.underline),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      fillColor: Colors.white54,
                      filled: true,
                      hintText: 'Email'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: TextField(
                  controller: passwordController,
                  obscureText: isTextObscure,
                  decoration: InputDecoration(
                      suffixIcon: isTextObscure
                          ? InkWell(
                              onTap: () {
                                setState(() {
                                  isTextObscure = !isTextObscure;
                                });
                              },
                              child:
                                  const Icon(Icons.disabled_visible_outlined))
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
                onTap: () {
                  signIn();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black),
                  child: const Center(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  InkWell(
                      onTap: () {
                        goToPage('signup');
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }

  void goToPage(String page) {
    if (page == 'weather') {
      Modular.to.navigate('/weather/');
    } else if (page == 'signup') {
      Navigator.popAndPushNamed(context, '/signup');
    }
  }
}
