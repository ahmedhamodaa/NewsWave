// main.dart
import 'package:flutter/material.dart';
import 'package:news_app/views/home_view.dart';
import 'package:news_app/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const NewsApp(),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

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
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xff1e1e1e)),
        drawerTheme: const DrawerThemeData(backgroundColor: Color(0xff1e1e1e)),
      ),
      themeMode: themeProvider.themeMode,
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}
