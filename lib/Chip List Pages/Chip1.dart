import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class ChipList1 extends StatefulWidget {
  const ChipList1({Key? key}) : super(key: key);

  @override
  _ChipList1State createState() => _ChipList1State();
}

class _ChipList1State extends State<ChipList1> {
  late Future<List> newsFuture;
  Future<List> getNewsByQuery() async {
    String url =
        "https://newsapi.org/v2/top-headlines?category=business&apiKey=5c30b90b83eb4e83a8de50d2b3a790a1";
    http.Response response = await http.get(Uri.parse(url));
    List data = jsonDecode(response.body)['articles'];
    return data;
  }

  @override
  void initState() {
    super.initState();
    newsFuture = getNewsByQuery();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 47, 80, 241),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        iconTheme: const IconThemeData(color: Colors.white, size: 28),
        title: const Text(
          "Today's News",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: FutureBuilder(
                  future: newsFuture,
                  builder: (context, AsyncSnapshot<List> sn) {
                    if (sn.hasData) {
                      List news = sn.data!;
                      return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          // sometime the API value is null so we fix the itemCount **news.length**
                          itemCount: news.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                    CupertinoPageRoute(builder: (context) {
                                  return Scaffold(
                                    body: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Stack(
                                            children: [
                                              Image.network(
                                                // image part
                                                news[index]['urlToImage'] ??
                                                    "https://blog.codemagic.io/uploads/What_is_Flutter_logo.png",
                                                fit: BoxFit.cover,
                                              ),
                                              Positioned(
                                                child: IconButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    icon: const Icon(
                                                      Icons.arrow_back,
                                                      color: Colors.white,
                                                    )),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            // Description header
                                            width: double.infinity,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            child: Text(
                                              news[index]['title'] ?? "Null",
                                              textAlign: TextAlign.justify,
                                              style: const TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Container(
                                            // Descriptive part
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            child: Text(
                                              news[index]['description'] ??
                                                  "Null",
                                              textAlign: TextAlign.justify,
                                              style:
                                                  const TextStyle(fontSize: 22),
                                            ),
                                          ),
                                          Container(
                                            // Read More part with link scrollable
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                children: [
                                                  const Text(
                                                    "Read More: ",
                                                    textAlign: TextAlign.start,
                                                    style:
                                                        TextStyle(fontSize: 22),
                                                  ),
                                                  InkWell(
                                                    // Provide onTap function for the link
                                                    onTap: () async {
                                                      final url =
                                                          news[index]['url'];
                                                      if (await canLaunch(
                                                          url)) {
                                                        // We use urlLaucher here
                                                        await launch(
                                                          url,
                                                          forceSafariVC:
                                                              true, // ios
                                                          forceWebView:
                                                              true, // android
                                                          enableJavaScript:
                                                              true, // android
                                                        );
                                                      } else {
                                                        throw Exception(
                                                            "Cannot Lauch Url");
                                                      }
                                                    },
                                                    child: Center(
                                                      child: Text(
                                                        "${news[index]['url']}",
                                                        maxLines: 5,
                                                        textAlign:
                                                            TextAlign.justify,
                                                        style: const TextStyle(
                                                            fontSize: 22,
                                                            color: Colors.blue,
                                                            decoration:
                                                                TextDecoration
                                                                    .underline),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }));
                              },
                              child: Container(
                                  // Image List Part
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.network(news[index]
                                                  ['urlToImage'] ??
                                              "https://blog.codemagic.io/uploads/What_is_Flutter_logo.png"),
                                        ),
                                        Positioned(
                                            left: 0,
                                            right: 0,
                                            bottom: 0,
                                            child: Container(
                                                height: 67,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15,
                                                        vertical: 10),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  gradient: LinearGradient(
                                                      colors: [
                                                        Colors.black12
                                                            .withOpacity(0),
                                                        Colors.black
                                                      ],
                                                      begin:
                                                          Alignment.topCenter,
                                                      end: Alignment
                                                          .bottomCenter),
                                                ),
                                                child: SingleChildScrollView(
                                                  // News Headline and News Description text part
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        news[index]['title'] ??
                                                            "Null",
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      const SizedBox(
                                                        height: 2.5,
                                                      ),
                                                      Text(
                                                        news[index][
                                                                'publishedAt'] ??
                                                            "Null",
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12,
                                                            fontStyle: FontStyle
                                                                .italic),
                                                      )
                                                    ],
                                                  ),
                                                )))
                                      ],
                                    ),
                                  )),
                            );
                          });
                    }
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(
                            height: 300,
                          ),
                          CircularProgressIndicator(),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
