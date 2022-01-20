import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String description =
        "This is a basic news app that allows users to browse up-to-date news. It is a submitted app project for the BD Government's Mobile Application Development program. Thanks to BD Government for this great opportunity and also thanks to Infosys and BrainStation23 for providing such a wonderful learning environment.";
    Info(String text) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
        width: double.infinity,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontStyle: FontStyle.italic,
          ),
          textAlign: TextAlign.left,
        ),
      );
    }

    return Scaffold(
        // backgroundColor: Colors.grey.shade500,
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
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/Margub Morshed.jpg"),
                    minRadius: 50,
                    maxRadius: 120,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Info("Trainee: Margub Morshed"),
                Info("Batch: 04"),
                Info("Trainer: Niamul Hasan"),
                Info("Program: Mobile Application Development"),
                Info("Venue: BCI Engineering Institute, Asad Gate, Dhaka"),
                Container(
                  // Big About Keyword
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  width: double.infinity,
                  child: const Text(
                    "About",
                    style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  // Descriptive part
                  margin: const EdgeInsets.fromLTRB(15, 0, 15, 20),
                  child: const Text(
                    description,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
