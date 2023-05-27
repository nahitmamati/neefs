import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:neefs/features/news/data/datasources/news_remote_datasources.dart';
import 'package:neefs/features/news/data/models/news_model.dart';
import 'package:neefs/features/news/domain/entities/news.dart';
import 'package:neefs/features/news/presentation/cubit/slider_cubit.dart';
import 'package:neefs/features/news/presentation/cubit/slider_cubit.dart';
import 'package:neefs/features/news/presentation/widgets/app_bar.dart';
import 'package:neefs/features/news/presentation/widgets/recommendation_news.dart';
import 'package:neefs/injection_container.dart';

import '../../../../core/util/localization.dart';
import '../../../user/data/models/user_model.dart';
import '../cubit/news_cubit.dart';
import '../widgets/breaking_news.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  List<Widget> getNewsSlider({required List<NewsModel> models}) {
    return models.map((model) {
      return BreakingNews(newsModel: model);
    }).toList();
  }

  Widget getNews({required List<NewsModel> models}) {
    var news = models.map((model) {
      return RecomNews(newsModel: model);
    }).toList();
    return Column(
      children: news,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        if (state is NewsInitial) {
          EasyLoading.show();
        } else if (state is NewsLoading) {
        } else if (state is NewsLoaded) {
          EasyLoading.dismiss();
        } else if (state is NewsFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Haber kalmadı")));
        }
      },
      builder: (context, state) {
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
                    Text(
                      AppLocalizations.of(context).getTranslate("breaking_news"),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        AppLocalizations.of(context).getTranslate("view_all"),
                      ),
                    ),
                  ],
                ),
              ),
              CarouselSlider.builder(
                itemCount: 10,
                carouselController: getIt<CarouselController>(
                    instanceName: 'carouselController'),
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    context.read<SliderIndexCubit>().index = index;
                    print(context.read<SliderIndexCubit>().index);
                  },
                ),
                itemBuilder: (context, index, realIndex) => getNewsSlider(
                    models: context.read<NewsCubit>().news)[index],
              ),
              BlocBuilder<SliderIndexCubit, int>(
                builder: (context, state) {
                  return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        context.read<NewsCubit>().news.length >= 10
                            ? 10
                            : context.read<NewsCubit>().news.length,
                        (index) => GestureDetector(
                          onTap: () => getIt<CarouselController>(
                                  instanceName: 'carouselController')
                              .animateToPage(index),
                          child: Container(
                            width: 10,
                            height: 10,
                            margin: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 4.0,
                            ),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : Colors.black)
                                    .withOpacity(state ==
                                            index
                                        ? 0.9
                                        : 0.4)),
                          ),
                        ),
                      ));
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context).getTranslate("recommendation_news"),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                          AppLocalizations.of(context).getTranslate("view_all"),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: NotificationListener(
                  onNotification: (notification) {
                    if (notification is ScrollEndNotification &&
                        notification.metrics.atEdge &&
                        notification.metrics.pixels != 0) {
                      context.read<NewsCubit>().page++;
                      context.read<NewsCubit>().loadNews();
                    }
                    return false;
                  },
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    controller: getIt<ScrollController>(
                        instanceName: 'scrollController'),
                    child: Column(
                      children: [
                        getNews(models: context.read<NewsCubit>().news),
                        state is NewsLoading
                            ? const CircularProgressIndicator()
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
