import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../login_page/auth.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final User? user = Auth().currentUser;

  @override
  Widget build(BuildContext context) {
    var scrWidth = MediaQuery.of(context).size.width;
    var scrHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffDADEEC),
      body: Column(children: [
        const SizedBox(
          height: 70,
        ),
        const Center(
          child: Text(
            "Profile",
            style: TextStyle(
              fontFamily: 'SF-Pro',
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        const Center(
          child: Image(
            image: AssetImage("images/profile1.png"),
            height: 100,
            width: 100,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 25.0, bottom: 5),
            child: Text(
              "Name",
              style: TextStyle(
                fontSize: 15,
                color: Color(0xff938D8D),
                fontFamily: 'SF-Pro',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Container(
          height: scrHeight / 15,
          width: scrWidth / 1.12,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.white,
          ),
          child: const Padding(
            padding: EdgeInsets.fromLTRB(20.0, 16.0, 0, 0),
            child: Text(
              "Yashwanth",
              style: TextStyle(
                fontFamily: 'SF-Pro',
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 25.0, bottom: 5),
            child: Text(
              "Email",
              style: TextStyle(
                fontSize: 15,
                color: Color(0xff938D8D),
                fontFamily: 'SF-Pro',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Container(
          height: scrHeight / 15,
          width: scrWidth / 1.12,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 16.0, 0, 0),
            child: Text(
              user?.email ?? 'User email',
              style: const TextStyle(
                fontFamily: 'SF-Pro',
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 25.0, bottom: 5),
            child: Text(
              "Phone Number",
              style: TextStyle(
                fontSize: 15,
                color: Color(0xff938D8D),
                fontFamily: 'SF-Pro',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Container(
          height: scrHeight / 15,
          width: scrWidth / 1.12,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.white,
          ),
          child: const Padding(
            padding: EdgeInsets.fromLTRB(20.0, 16.0, 0, 0),
            child: Text(
              "9876543210",
              style: TextStyle(
                fontFamily: 'SF-Pro',
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ),
        SizedBox(
          height: scrHeight / 12,
        ),
        Container(
          height: 41,
          width: scrWidth / 2.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: const Color(0xff3C3C43),
          ),
          child: MaterialButton(
            onPressed: signOut,
            child: const Text(
              "Logout",
              style: TextStyle(
                fontFamily: 'SF-Pro',
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
