import 'package:flutter/material.dart';

class NewsDetail extends StatelessWidget {
  NewsDetail({Key? key}) : super(key: key);

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
                  icon: Icon(Icons.bookmark_border_outlined),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_horiz),
                ),
              ],
              flexibleSpace: Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.60,
                    child: Stack(
                      children: [
                        Container(
                          foregroundDecoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                Colors.transparent,
                                Colors.black38
                              ])),
                          child: Image.network(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.60,
                            "https://contents.mediadecathlon.com/p1765929/k\$e780ffd594e9c6049ab5b2baa32cc9b3/VAN%20RYSEL%20ROADR%20900%20Rouge.jpg",
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
                                    "Haber türü",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              Text(
                                "6 hours ago",
                                style: TextStyle(color: Colors.white),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Haer hakkında açıklama Haer hakkında açıklama Haer çıklama",
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
                            Text("Haber Ajansı")
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
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    "Donec commodo ultrices purus, a cursus magna facilisis eget. In hac habitasse platea dictuDonec commodo ultrices purus, a cursus magna facilisis eget. In hac habitasse platea dictumst. In ac nisi emst. In ac nisi et ligula pulvinar convallis. Ut in elit rutrum, dignissim felis in, ullamcorper orci. Mauris tincidunt enim purus, nec pretium lectus sodales ac. Proin posuere, nunc id porttitor imperdiet, tortor mi egestas lectus, quis lobortis odio lorem eget mauris. Nulla eu dolor aliquet, blandit ante vitae, facilisis est. Suspendisse ac nulla ante. Ut ut lectus quis eros ornare convallis a a elit. Proin vitae arcu commodo, efficitur odio vel, tincidunt tortor. Suspendisse potenti.Donec commodo ultrices purus, a cursus magna facilisis eget. In hac habitasse platea dictumst. In ac nisi et ligula pulvinar convallis. Ut in elit rutrum, dignissim felis in",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
