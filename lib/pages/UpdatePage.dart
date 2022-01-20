import 'package:flutter/material.dart';

class UpdatePage extends StatelessWidget {
  const UpdatePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(50, 75, 205, 1),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/News_Icon.png"),
                    minRadius: 50,
                    maxRadius: 200,
                  ),
                ),
                Text(
                  "News App Version: ^1.0.1",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "You are up-to-date",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontStyle: FontStyle.italic,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
