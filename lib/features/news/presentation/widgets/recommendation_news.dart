import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neefs/features/news/data/models/news_model.dart';

class RecomNews extends StatelessWidget {
  NewsModel newsModel;
  RecomNews({Key? key, required this.newsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push("/news_detail", extra: newsModel);
      },
      child: Container(
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
                            newsModel.image!),
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
                        newsModel.type!,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        newsModel.title!,
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
                      Text(newsModel.date!,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.w500))
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
