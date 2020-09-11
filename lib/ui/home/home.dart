import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gabut/cubit/news_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 16,
          ),
          alignment: Alignment.center,
          child: BlocBuilder<NewsCubit, NewsState>(builder: (context, state) {
            if (state is NewsInitial || state is NewsLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is NewsLoaded) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'TRENDING',
                        style: TextStyle(
                            letterSpacing: 2,
                            fontWeight: FontWeight.w600,
                            color: Colors.deepOrangeAccent),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        state.newsList.articles[0].title,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: CachedNetworkImage(
                            imageUrl: state.newsList.articles[0].urlToImage),
                      ),
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        "Headlines",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      height: 250,
                      child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                                width: 24,
                              ),
                          scrollDirection: Axis.horizontal,
                          itemCount: state.newsList.articles.length,
                          padding: const EdgeInsets.symmetric(horizontal: 28),
                          itemBuilder: (context, index) {
                            return Container(
                              width: 150,
                              child: Column(
                                children: [
                                  CachedNetworkImage(
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                            width: 200.0,
                                            height: 160.0,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30)),
                                              image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                      imageUrl: state
                                          .newsList.articles[index].urlToImage),
                                  SizedBox(height: 14,),
                                  Text(
                                    state.newsList.articles[index].title,
                                    maxLines: 3,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500
                                    ),)
                                ],
                              ),
                            );
                          }),
                    )
                  ],
                ),
              );
            } else if (state is NewsError) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return Container();
            }
          }),
        ),
      ),
    );
  }

  @override
  void initState() {
    final newsCubit = context.bloc<NewsCubit>();
    newsCubit.getTopHeadline();
    super.initState();
  }
}
