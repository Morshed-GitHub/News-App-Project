import 'package:flutter/material.dart';

class LatestNewsText extends StatelessWidget {
  const LatestNewsText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 18),
            width: double.infinity,
            child: const Text(
              "Latest News",
              style: TextStyle(
                  fontSize: 26,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            )),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
