import 'package:flutter/material.dart';
import 'package:news_app/core/utiles/functions/functions.dart';
import 'package:news_app/features/manager/news_cubit.dart';
  import 'widgets/search_screen.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var cubit = NewsCubit.get(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'News App',
        ),
        actions: [
          IconButton(
            onPressed: () {
              navigateTo(context, SearchScreen());
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () {
              NewsCubit.get(context).changeMode();
            },
            icon: const Icon(Icons.brightness_6),
          ),
        ],
      ),
      body: cubit.screen[cubit.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: cubit.currentIndex,
        onTap: (index) {
          cubit.changeBottomNavBar(newIndex: index);
        },
        items: cubit.bottomItems,
      ),
    );
  }
}
