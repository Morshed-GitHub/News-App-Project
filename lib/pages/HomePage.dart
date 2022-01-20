import 'package:flutter/material.dart';
import '../items/AppDrawer.dart';
import '../items/ChipSet.dart';
import '../items/LatestNewsText.dart';
import '../items/NewsCardList.dart';
import '../items/NewsSlider.dart';
import '../items/SearchBar.dart';
import '../items/ShowMoreButton.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white, size: 28),
          title: const Text(
            "Today's News",
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontStyle: FontStyle.italic),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: const Color.fromARGB(255, 47, 80, 241),
        ),
        drawer: const AppDrawer(),
        body: RefreshIndicator(
          backgroundColor: const Color.fromARGB(255, 47, 80, 241),
          color: Colors.white,
          displacement: 50,
          onRefresh: () async {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const HomePage()));
          },
          child: SingleChildScrollView(
            child: Column(
              children: const [
                SearchBar(),
                ChipSet(),
                NewsSlider(),
                LatestNewsText(),
                NewsCardList(),
                ShowMoreButton()
              ],
            ),
          ),
        ));
  }
}
