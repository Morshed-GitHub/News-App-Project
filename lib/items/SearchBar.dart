import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Container(
        // search container
        padding: const EdgeInsets.symmetric(horizontal: 16),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.black12, borderRadius: BorderRadius.circular(24)),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                  margin: const EdgeInsets.fromLTRB(3, 0, 10, 0),
                  child: const Icon(
                    Icons.search,
                  )),
            ),
            Expanded(
              child: TextField(
                controller: searchController,
                textInputAction: TextInputAction.search,
                onSubmitted: (String value) {
                  print(value);
                },
                decoration: const InputDecoration(
                    hintText: "Search News Here", border: InputBorder.none),
              ),
            )
          ],
        ));
  }
}
