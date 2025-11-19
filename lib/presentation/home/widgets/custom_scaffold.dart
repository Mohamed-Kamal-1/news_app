import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/providers/theme_provider.dart';



class CustomScaffold extends StatefulWidget {
  const CustomScaffold(this.onHomeClick,{super.key, this.title, this.actions, required this.body,});
  final String? title ;
  final List<Widget>? actions;
  final Widget body;
  final VoidCallback onHomeClick;

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  String selectedTheme = 'light';

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        scrolledUnderElevation: 0,
        title:Text(widget.title??'') ,
        actions: widget.actions,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(child: Center(child: Text('News App'))),
            ListTile(
              onTap: () {
                widget.onHomeClick();
                // close drawer
                Navigator.pop(context);
              },
              title: Text('Go to Home '),

              leading: Icon(CupertinoIcons.home),
            ),
            ListTile(
              onTap: () {
                themeProvider.setTheme =
                themeProvider.isDark
                    ? ThemeMode.light
                    : ThemeMode.dark;
              },
              title: Text(themeProvider.isDark ? "Dark" : "Light"),
              leading: Icon(themeProvider.isDark? Icons.dark_mode:Icons.light_mode),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 18.0),
            //   child: DropdownButton<String>(
            //     isExpanded: true,
            //     value: selectedTheme,
            //     items: [
            //       DropdownMenuItem(value: 'light', child: Text('Light')),
            //       DropdownMenuItem(value: 'dark', child: Text('Dark')),
            //     ],
            //     onChanged: (value) {
            //       if (value != null) {
            //         setState(() {
            //           selectedTheme = value;
            //         });
            //       }
            //       if (value == 'light') {
            //         // set new theme (Light Mode )
            //       } else {
            //         // set new theme Dark Mode
            //       }
            //     },
            //   ),
            // ),
          ],
        ),
      ),
      body: widget.body,
    );
  }
}
