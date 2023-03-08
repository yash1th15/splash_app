import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../login_page/auth.dart';
import 'package:dashboard_1/design.dart';
import 'package:dashboard_1/profile/profile.dart';
class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final User? user = Auth().currentUser;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xffDADEEC),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height:35,
                ),
                const Text(
                  "Settings",
                  style: TextStyle(fontSize: 30,fontFamily: 'SF-Pro', fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 45),
                SettingsTile(
                  color: Colors.blue,
                  icon: Icons.perm_device_information_rounded,
                  title: "About ",
                  onTap: () {},
                ),
                const SizedBox(
                  height: 10,
                ),
                SettingsTile(
                  color: Colors.green,
                  icon: Icons.notifications_active_rounded,
                  title: "Notifications",
                  onTap: () {},
                ),
                const SizedBox(
                  height: 40,
                ),
                SettingsTile(
                  color: Colors.black,
                  icon: Icons.verified_user_rounded,
                  title: "Terms of Use",
                  onTap: () {},
                ),
                const SizedBox(
                  height: 10,
                ),
                SettingsTile(
                  color: Colors.purple,
                  icon: Icons.local_police_rounded,
                  title: "Licences",
                  onTap: () {const Profile();},
                ),
                const SizedBox(
                  height: 40,
                ),
                SettingsTile(
                  color: Colors.red,
                  icon: Icons.info_rounded,
                  title: "Help Center",
                  onTap: () async {Navigator.push(context, MaterialPageRoute(builder: (context) => Profile() ));},
                ),
              ],
            ),
          ),
        ),

      );

  }
}
