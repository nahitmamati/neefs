import 'package:flutter/material.dart';
import 'package:html/parser.dart';

import '../../data/models/news_model.dart';

class NewsDetail extends StatelessWidget {
  NewsModel newsModel;

  NewsDetail({Key? key, required this.newsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              toolbarHeight: 80,
              pinned: true,
              expandedHeight: MediaQuery.of(context).size.height * 0.55,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.bookmark_border_outlined),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_horiz),
                ),
              ],
              flexibleSpace: Stack(
                children: [
                  SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.55,
                      child: Stack(
                        children: [
                          Container(
                            foregroundDecoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.transparent, Colors.black38],
                              ),
                            ),
                            child: Image.network(
                              newsModel.image!,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 60),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Card(
                                  margin: const EdgeInsets.all(0),
                                  color: Colors.blueAccent,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6.0, vertical: 4),
                                    child: Text(
                                      newsModel.type!,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                Text(
                                  newsModel.date!,
                                  style: TextStyle(color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  newsModel.description!,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                        color: Theme.of(context).colorScheme.background,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 4),
                        child: Row(
                          children: [
                            CircleAvatar(),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(newsModel.author!)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 1,
                (context, index) => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    parse(parse(newsModel.content!).body!.text)
                        .documentElement!
                        .text,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
