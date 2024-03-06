import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/news_layout/presentation/manager/news_cubit.dart';
import 'package:news_app/features/news_layout/presentation/manager/news_states.dart';
import 'package:news_app/features/news_layout/presentation/pages/news_screen.dart';
 import 'core/styles/themes.dart';
import 'core/utiles/cache_helper/cache_helper.dart';
import 'core/utiles/dio_helper/dio_helper.dart';
import 'core/utiles/observer/my_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyObserver();
  DioHelper.init();
   await CacheHelper.init();
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()
          ..getBusiness()
          ..getSports()
          ..getScience()
          ..getSettings(),
      child: BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              theme: lightMode,
              darkTheme: darkMode,
              themeMode: CacheHelper.getMode(key: 'isDark') == null
                  ? NewsCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light
                  : CacheHelper.getMode(key: 'isDark') == true
                  ? ThemeMode.dark
                  : ThemeMode.light,
              debugShowCheckedModeBanner: false,
              home: NewsScreen(),
            );
          }),
    );

  }
}
