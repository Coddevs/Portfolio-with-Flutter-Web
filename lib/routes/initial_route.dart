import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../provider/theme_switcher.dart';
import '../widgets/scroll_no_glow.dart';
import '../tabs/projects_tab.dart';
import '../tabs/what_i_do_tab.dart';
import '../tabs/about_tab.dart';

class InitialRoute extends StatefulWidget {
  State createState() => _InitialRouteState();
}
class _InitialRouteState extends State<InitialRoute> {
  int _selectedTabIndex = 0;
  final _tabs = <Widget>[
    AboutTab(),
    WhatWeDoTab(),
    ProjectsTab(),
  ];

  Widget build(BuildContext context) {
    final themeSwitcher = Provider.of<ThemeSwitcher>(context, listen: false);
    final themeIcon = themeSwitcher.isDark? Icon(Icons.wb_sunny) : Transform.translate(
      offset: Offset(-1.0, 0.0),
      child: Transform.rotate(
        angle: 0.90 * math.pi,
        child: Icon(Icons.brightness_3),
      ),
    );
    final navBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.account_circle),
        title: Text('About'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.important_devices),
        title: Text('What I Do'),
        backgroundColor: themeSwitcher.isDark? Color.fromRGBO(30, 30, 30, 1.0) : Color.fromRGBO(238, 238, 238, 1.0),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.work),
        title: Text('Projects'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
    ];

    return Scaffold(
      body: Scrollbar(
        child: kIsWeb? ( ///Flutter web
          ScrollConfiguration(
            behavior:  ScrollNoGlow(),
            child: Center(
              child: _tabs.elementAt(_selectedTabIndex),
            ),
          )
        ) : (
          Center(
            child: _tabs.elementAt(_selectedTabIndex),
          )
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          highlightColor: Colors.transparent,
          canvasColor: Theme.of(context).primaryColor,
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border(top: BorderSide(
              color: Theme.of(context).textTheme.subtitle1.color,
              width: 0.5,
            ))
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedTabIndex,
            items: navBarItems,
            onTap: (int index) => setState(() => _selectedTabIndex=index),
            type: BottomNavigationBarType.shifting,
            selectedItemColor: Theme.of(context).textTheme.subtitle1.color,
            unselectedItemColor: Theme.of(context).disabledColor,
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: 75.0),
        child: FloatingActionButton(
          backgroundColor: Colors.black.withOpacity(0.25),
          heroTag: null,
          child: themeIcon,
          onPressed: () => themeSwitcher.switchTheme(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
