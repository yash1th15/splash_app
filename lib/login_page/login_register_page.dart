import './wave_wig.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './auth.dart';

String name = '';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  bool isLogin = true;

  final formKey = GlobalKey<FormState>();

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerName = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    name = _controllerName.text;
    try {
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    name = _controllerName.text;
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _errorMessage() {
    return Center(
      child: Text(
        errorMessage!,
        style: const TextStyle(
            color: Colors.red, fontSize: 14, fontFamily: 'SF-Pro'),
      ),
    );
  }

  Widget _loginOrRegisterButton() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        isLogin ? 'Not a member?' : 'Already having account?',
        style: TextStyle(
          fontFamily: 'SF-Pro',
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.black.withOpacity(0.8),
        ),
      ),
      TextButton(
        onPressed: () {
          setState(() {
            isLogin = !isLogin;
          });
        },
        child: Text(
          isLogin ? 'Register' : 'Login',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.blue[900],
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    var scrWidth = MediaQuery.of(context).size.width;
    var scrHeight = MediaQuery.of(context).size.height;

    final size = MediaQuery.of(context).size;
    // final model = Provider.of<HomeModel>(context);

    return Scaffold(
      backgroundColor: const Color(0xffDADEEC),
      body: SingleChildScrollView(
        child: Stack(children: [
          WaveWidget(
              size: size, yOffset: size.height / 1.25, color: Colors.blue),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 75,
              ),
              isLogin
                  ? Image.asset(
                      'images/user.png',
                      height: 100,
                      width: 100,
                    )
                  : Container(),
              Align(
                alignment: Alignment.center,
                child: Text(
                  isLogin ? 'Welcome Back' : 'Create Account',
                  style: const TextStyle(
                    fontSize: 35,
                    color: Color(0xff0C2551),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SF-Pro',
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  isLogin ? 'Sign to continue' : 'Create an account',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SF-Pro',
                  ),
                ),
              ),
              SizedBox(
                height: isLogin ? 15 : 25,
              ),
              //
              Visibility(
                visible: !isLogin,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, bottom: 8),
                        child: Text(
                          "Name",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black.withOpacity(.8),
                            fontFamily: 'SF-Pro',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
                      child: TextFormField(
                        controller: _controllerName,
                        style: TextStyle(
                            fontSize: 19,
                            color: Colors.blue[900],
                            fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          hintText: "John",
                          hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[400],
                              fontWeight: FontWeight.w600),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 17, horizontal: 25),
                          focusColor: const Color(0xff0962ff),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                            return "Username is invalid";
                          } else {
                            null;
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: isLogin ? 10 : 6,
                    ),
                  ],
                ),
              ),

              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0, bottom: 8),
                  child: Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'SF-Pro',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
                child: TextField(
                  controller: _controllerEmail,
                  style: TextStyle(
                      fontSize: 19,
                      color: Colors.blue[900],
                      fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    hintText: "example@email.com",
                    hintStyle: TextStyle(
                        fontFamily: 'SF-Pro',
                        fontSize: 18,
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w600),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 17, horizontal: 25),
                    focusColor: const Color(0xff0962ff),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: isLogin ? 10 : 6,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0, bottom: 8),
                  child: Text(
                    "Password",
                    style: TextStyle(
                      fontFamily: 'SF-Pro',
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: TextField(
                  controller: _controllerPassword,
                  style: TextStyle(
                      fontSize: 19,
                      color: Colors.blue[900],
                      fontWeight: FontWeight.bold),
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "8+ Characters,1 Capital letter",
                    hintStyle: TextStyle(
                        fontFamily: 'SF-Pro',
                        fontSize: 18,
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w600),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 17, horizontal: 25),
                    focusColor: const Color(0xff0962ff),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              _errorMessage(),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: scrWidth / 2,
                height: 68,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Colors.lightBlueAccent,
                      Colors.blue,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: MaterialButton(
                  onPressed: isLogin
                      ? signInWithEmailAndPassword
                      : createUserWithEmailAndPassword,
                  child: Text(
                    isLogin ? 'Login' : 'Register',
                    style: const TextStyle(
                      fontFamily: 'SF-Pro',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              _loginOrRegisterButton(),
            ],
          ),
        ]),
      ),
    );
  }
}
