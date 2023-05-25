import 'package:flutter/material.dart';
import 'package:neefs/features/news/data/models/news_model.dart';

class BreakingNews extends StatelessWidget {
  NewsModel newsModel;
  BreakingNews({Key? key, required this.newsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
              newsModel.image!,
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
                newsModel.type!,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const Spacer(),
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
  }
}
