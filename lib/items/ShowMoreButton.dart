import 'package:flutter/material.dart';
import 'package:news_app_project/pages/HomePage.dart';

class ShowMoreButton extends StatelessWidget {
  const ShowMoreButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        margin: const EdgeInsets.fromLTRB(14, 0, 14, 15),
        child: InkWell(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 47, 80, 241),
                borderRadius: BorderRadius.circular(25)),
            child: const Center(
                child: Text(
              "SHOW MORE",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )),
          ),
        ));
  }
}
