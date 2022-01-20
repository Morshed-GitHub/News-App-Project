import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class NewsSlider extends StatefulWidget {
  const NewsSlider({Key? key}) : super(key: key);

  @override
  State<NewsSlider> createState() => _NewsSliderState();
}

class _NewsSliderState extends State<NewsSlider> {
  late Future<List> newsFuture;
  Future<List> getNewsByQuery() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=5c30b90b83eb4e83a8de50d2b3a790a1";
    http.Response response = await http.get(Uri.parse(url));
    List data = jsonDecode(response.body)['articles'];
    print(data.runtimeType);
    return data;
  }

  @override
  void initState() {
    super.initState();
    newsFuture = getNewsByQuery();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
          future: newsFuture,
          builder: (context, AsyncSnapshot<List> sn) {
            if (sn.hasData) {
              List news = sn.data!;
              return Container(
                child: CarouselSlider.builder(
                  itemCount: news.length,
                  options: CarouselOptions(
                      height: 220,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 3500),
                      enableInfiniteScroll: true),
                  itemBuilder: (ctx, index, realIdx) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(CupertinoPageRoute(builder: (context) {
                          return Scaffold(
                            body: SingleChildScrollView(
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Stack(
                                    // Image clicked from the slider using item
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
                                              Navigator.of(context).pop();
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
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    // Descriptive part
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Text(
                                      news[index]['description'] ?? "Null",
                                      textAlign: TextAlign.justify,
                                      style: const TextStyle(fontSize: 22),
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
                                            style: TextStyle(fontSize: 22),
                                          ),
                                          InkWell(
                                            // Provide onTap function for the link
                                            onTap: () async {
                                              final url = news[index]['url'];
                                              if (await canLaunch(url)) {
                                                // We use urlLaucher here
                                                await launch(
                                                  url,
                                                  forceSafariVC: true, // ios
                                                  forceWebView: true, // android
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
                                                textAlign: TextAlign.justify,
                                                style: const TextStyle(
                                                    fontSize: 22,
                                                    color: Colors.blue,
                                                    decoration: TextDecoration
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
                        // Image part in front slider
                        margin: const EdgeInsets.symmetric(vertical: 16),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Stack(
                              children: [
                                Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  child: Image.network(
                                    news[index]['urlToImage'] ??
                                        "https://blog.codemagic.io/uploads/What_is_Flutter_logo.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                        height: 67,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          gradient: LinearGradient(
                                              colors: [
                                                Colors.black12.withOpacity(0),
                                                Colors.black
                                              ],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter),
                                        ),
                                        child: SingleChildScrollView(
                                          // News Headline and News Description text part
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                news[index]['title'] ??
                                                    const Text("Null"),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                height: 2.5,
                                              ),
                                              Text(
                                                news[index]['publishedAt'] ??
                                                    const Text("Null"),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontStyle:
                                                        FontStyle.italic),
                                              )
                                            ],
                                          ),
                                        )))
                              ],
                            )),
                      ),
                    );
                  },
                ),
              );
            }
            return Center(
              child: Column(
                children: const [
                  SizedBox(
                    height: 15,
                  ),
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            );
          },
        ));
  }
}
