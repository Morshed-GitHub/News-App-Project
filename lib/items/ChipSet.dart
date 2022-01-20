import 'package:flutter/material.dart';
import 'package:news_app_project/Chip%20List%20Pages/Chip0.dart';
import 'package:news_app_project/Chip%20List%20Pages/Chip1.dart';
import 'package:news_app_project/Chip%20List%20Pages/Chip2.dart';
import 'package:news_app_project/Chip%20List%20Pages/Chip3.dart';

class ChipSet extends StatelessWidget {
  const ChipSet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List chipList = ["Top News", "Covid", "World-Wide", "Health", "Hospital"];

    void onSelected(BuildContext context, int index) {
      switch (index) {
        case 0:
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const ChipList3();
          }));
          break;
        case 1:
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const ChipList0();
          }));
          break;
        case 2:
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const ChipList1();
          }));
          break;
        case 3:
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const ChipList2();
          }));
          break;
        case 4:
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const ChipList0();
          }));
          break;
      }
    }

    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: chipList.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: InkWell(
                onTap: () {
                  onSelected(context, index);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                    child: Text(
                      chipList[index],
                      style: const TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
