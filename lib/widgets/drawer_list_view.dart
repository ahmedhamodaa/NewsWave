// widgets/drawer_list_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/theme/cubit/theme_cubit.dart';
import 'package:news_app/theme/cubit/theme_state.dart';
import 'package:news_app/views/about/about_view.dart';
import 'package:news_app/views/search/search_view.dart';

class DrawerListView extends StatelessWidget {
  const DrawerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const SizedBox(height: 32),
        ListTile(
          leading: const Icon(Icons.search),
          title: const Text('Search News', style: TextStyle(fontSize: 18)),
          onTap: () {
            Navigator.pop(context); // Close the drawer
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SearchView()),
            );
          },
        ),
        BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return ListTile(
              leading: const Icon(Icons.brightness_6),
              trailing: Switch(
                value: state.isDarkMode,
                onChanged: (value) {
                  context.read<ThemeCubit>().toggleTheme(value);
                },
              ),
              title: const Text('Dark Mode', style: TextStyle(fontSize: 18)),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.info),
          title: const Text('About'),
          onTap:
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutView()),
              ),
        ),
      ],
    );
  }
}
