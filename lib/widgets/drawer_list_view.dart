import 'package:flutter/material.dart';
import 'package:news_app/views/about_view.dart';
import 'package:news_app/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class DrawerListView extends StatelessWidget {
  const DrawerListView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        const SizedBox(height: 32),
        ListTile(
          leading: Icon(Icons.brightness_6),
          trailing: Switch(
            value: themeProvider.isDarkMode,
            onChanged: (value) {
              themeProvider.toggleTheme(value);
            },
          ),

          title: const Text('Dark Mode', style: TextStyle(fontSize: 18)),
        ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text('About'),
          onTap:
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutView()),
              ),
        ),
      ],
    );
  }
}
