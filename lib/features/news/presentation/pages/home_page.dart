import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neefs/features/news/presentation/widgets/app_bar.dart';
import 'package:neefs/injection_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  CarouselController carouselController =
      getIt<CarouselController>(instanceName: 'carouselController');
  List<dynamic> newss = [];

  loadNews() async {
    Dio dio = Dio();
    var response = await dio.get("https://www.nginx.com/wp-json/wp/v2/posts");
    if (response.statusCode == 200) {
      newss = response.data;
      setState(() {});
    } else {
      print("Data gelmedi kardeşim yeniden dene");
    }
  }

  List<Widget> getNewsSlider() {
    if (newss != null) {
      var haberler = newss.map((e) {
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  e["yoast_head_json"]["og_image"][0]["url"],
                ),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: Colors.blueAccent,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4),
                  child: Text(
                    e["yoast_head_json"]["og_type"],
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const Spacer(),
              Text(
                e["date"],
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                e["yoast_head_json"]["og_description"],
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                maxLines: 2,
              )
            ],
          ),
        );
      }).toList();
      return haberler;
    } else {
      return [Text("gelmedi")];
    }
  }

  Widget getNews() {
    if (newss != null) {
      var haberler = newss.map((e) {
        return Container(
            margin: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 110,
                  width: 120,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              e["yoast_head_json"]["og_image"][0]["url"]),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(16)),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          e["yoast_head_json"]["og_type"],
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          e["yoast_head_json"]["title"],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 2,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(e["date"],
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontWeight: FontWeight.w500))
                      ],
                    ),
                  ),
                )
              ],
            ));
      }).toList();
      return Column(
        children: haberler,
      );
    } else {
      return Text("gelmedi");
    }
  }

  @override
  void initState() {
    loadNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> news = [
      Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(24)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.blueAccent,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4),
                child: Text(
                  "Haber türü",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const Spacer(),
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
            )
          ],
        ),
      ),
      Container(
        color: Colors.yellow,
      ),
      Container(
        color: Colors.blue,
      ),
      Container(
        color: Colors.orangeAccent,
      ),
      Container(
        color: Colors.orangeAccent,
      ),
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, AppBar().preferredSize.height),
        child: const MyAppBar(),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Breaking News",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    GoRouter.of(context).push('/newsDetail');
                  },
                  child: const Text(
                    "View all",
                  ),
                ),
              ],
            ),
          ),
          CarouselSlider(
            carouselController: carouselController,
            options: CarouselOptions(
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
            items: getNewsSlider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: newss.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => carouselController.animateToPage(entry.key),
                child: Container(
                  width: 10,
                  height: 10,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 4.0,
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Recommendation",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "View all",
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: getNews(),
            ),
          ),
        ],
      ),
    );
  }
}
