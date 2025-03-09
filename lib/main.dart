// main.dart
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/news/news_cubit.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/theme/cubit/theme_cubit.dart';
import 'package:news_app/theme/cubit/theme_state.dart';
import 'package:news_app/views/home/home_view.dart';
import 'package:news_app/views/search/cubit/search_cubit.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Create shared instances
    final newsService = NewsService(Dio());

    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
        BlocProvider<NewsCubit>(
          create: (context) => NewsCubit(newsService: newsService),
        ),
        BlocProvider<SearchCubit>(
          create: (context) => SearchCubit(newsService: newsService),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
              fontFamily: 'Rubik',
              colorScheme: const ColorScheme(
                brightness: Brightness.light,
                primary: Color(0xff2cb3fc),
                onPrimary: Colors.white,
                secondary: Color(0xffe3e3e3),
                onSecondary: Colors.black,
                error: Colors.white,
                onError: Colors.black,
                surface: Colors.white,
                onSurface: Colors.black,
                background: Colors.white,
                onBackground: Colors.black,
              ),
            ),
            darkTheme: ThemeData(
              fontFamily: 'Rubik',
              colorScheme: const ColorScheme(
                brightness: Brightness.dark,
                primary: Color(0xff2cb3fc),
                onPrimary: Colors.black,
                secondary: Color(0xff303030),
                onSecondary: Colors.white,
                error: Colors.red,
                onError: Colors.white,
                surface: Color(0xff121212),
                onSurface: Colors.white,
                background: Color(0xff121212),
                onBackground: Colors.white,
              ),
              scaffoldBackgroundColor: const Color(0xff121212),
              appBarTheme: const AppBarTheme(
                backgroundColor: Color(0xff1e1e1e),
              ),
              drawerTheme: const DrawerThemeData(
                backgroundColor: Color(0xff1e1e1e),
              ),
            ),
            themeMode: state.themeMode,
            debugShowCheckedModeBanner: false,
            home: const HomeView(),
          );
        },
      ),
    );
  }
}
