import 'package:flutter/material.dart';
import 'package:news_app_project/pages/HomePage.dart';

import '../pages/AboutPage.dart';
import '../pages/UpdatePage.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.symmetric(horizontal: 20);
    return Drawer(
      child: Material(
        color: const Color.fromRGBO(50, 75, 205, 1),
        child: ListView(
          padding: padding,
          children: [
            const SizedBox(
              height: 40,
            ),
            const Divider(
              color: Colors.white,
            ),
            const SizedBox(
              height: 16,
            ),
            buildMenuItem(
              text: "Home",
              icon: Icons.home,
              onClicked: () => onSelected(context, 0),
            ),
            const SizedBox(
              height: 16,
            ),
            buildMenuItem(
              text: "Update",
              icon: Icons.update,
              onClicked: () => onSelected(context, 1),
            ),
            const SizedBox(
              height: 16,
            ),
            buildMenuItem(
              text: "About",
              icon: Icons.info_outline_rounded,
              onClicked: () => onSelected(context, 2),
            ),
            const SizedBox(
              height: 24,
            ),
            const Divider(
              color: Colors.white,
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildMenuItem(
    {required String text, required IconData icon, VoidCallback? onClicked}) {
  const color = Colors.white;
  const hoverColor = Colors.white70;
  return ListTile(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    hoverColor: hoverColor,
    leading: Icon(icon, color: color),
    onTap: onClicked,
    title: Text(
      text,
      style: const TextStyle(color: color, fontSize: 16),
    ),
  );
}

void onSelected(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const HomePage();
      }));
      break;
    case 1:
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const UpdatePage();
      }));
      break;
    case 2:
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const AboutPage();
      }));
      break;
  }
}
