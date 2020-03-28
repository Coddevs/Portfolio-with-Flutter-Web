import 'package:flutter/material.dart';
import '../widgets/responsive_widget.dart';

class WhatWeDoTab extends StatelessWidget {
  Widget build(BuildContext context) {
    final captionColor = Theme.of(context).textTheme.caption.color;
    final isDark = Theme.of(context).brightness==Brightness.dark;
    final isLargeScreen = ResponsiveWidget.isLargeScreen(context);
    final mobileDevelopment = Column(
      children: <Widget>[
        Icon(
          Icons.phone_android,
          size: isLargeScreen? 50.0 : 70.0,
          color: isDark? Colors.blue[300] : Colors.blue[800],
        ),
        SizedBox(height: 5.0),
        ResponsiveWidget.toSubtitle('MOBILE', style: TextStyle(color: captionColor)),
        ResponsiveWidget.toSubtitle('DEVELOPMENT', style: TextStyle(color: captionColor)),
      ],
    );
    final webDevelopment = Column(
      children: <Widget>[
        Icon(
          Icons.web,
          size: isLargeScreen? 50.0 : 70.0,
          color: isDark? Colors.blue[300] : Colors.blue[800],
        ),
        ResponsiveWidget.toSubtitle('WEB', style: TextStyle(color: captionColor)),
        ResponsiveWidget.toSubtitle('DEVELOPMENT', style: TextStyle(color: captionColor)),
      ],
    );
    final noSQLDatabase = Column(
      children: <Widget>[
        Icon(
          Icons.device_hub,
          size: isLargeScreen? 50.0 : 70.0,
          color: isDark? Colors.blue[300] : Colors.blue[800],
        ),
        ResponsiveWidget.toSubtitle('NoSQL', style: TextStyle(color: captionColor)),
        ResponsiveWidget.toSubtitle('DATABASE', style: TextStyle(color: captionColor)),
      ],
    );
    final howWeDoIt = Column(children: <Widget>[
      RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: Theme.of(context).textTheme.subtitle1.copyWith(
            fontSize: 17.0,
            color: captionColor,
          ),
          children: <TextSpan>[
            TextSpan(text: 'Flutter ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: 'is an open-source UI software development kit created by '),
            TextSpan(text: 'Google. ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: 'It is used to develop applications for '),
            TextSpan(text: 'Android', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: ', '),
            TextSpan(text: 'iOS', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: ', '),
            TextSpan(text: 'Desktop', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: ', '),
            TextSpan(text: 'and the '),
            TextSpan(text: 'Web', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: '.'),
          ],
        ),
      ),
      SizedBox(height: 7.5),
      RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: Theme.of(context).textTheme.subtitle1.copyWith(
            fontSize: 17.0,
            color: captionColor,
          ),
          children: <TextSpan>[
            TextSpan(text: 'And '),
            TextSpan(text: 'Firebase is ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: 'Google\'s mobile platform that helps you quickly develop '),
            TextSpan(text: 'high-quality apps and grow your business. '),
            TextSpan(text: 'Firebase ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: 'gives you functionality like analytics, databases, '),
            TextSpan(text: 'messaging and crash reporting so you can move quickly '),
            TextSpan(text: 'and focus on your users.'),
          ],
        ),
      ),
    ]);

    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: ResponsiveWidget(
            largeScreen: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 800.0),
              child: Column(
                children: <Widget>[
                  ResponsiveWidget.toTitle('WHAT I DO'),
                  SizedBox(height: 30.0),
                  Row(children: <Widget>[
                    Expanded(
                      child: mobileDevelopment,
                    ),
                    Expanded(
                      child: webDevelopment,
                    ),
                    Expanded(
                      child: noSQLDatabase,
                    ),
                  ]),
                  SizedBox(height: 50.0),
                  ResponsiveWidget.toTitle('HOW I DO IT'),
                  SizedBox(height: 30.0),
                  howWeDoIt,
                ],
              ),
            ),
            mediumScreen: Column(
              children: <Widget>[
                ResponsiveWidget.toTitle('WHAT I DO'),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: mobileDevelopment,
                    ),
                    SizedBox(width: 25.0),
                    Flexible(
                      child: webDevelopment,
                    ),
                  ],
                ),
                SizedBox(width: 25.0),
                noSQLDatabase,
                SizedBox(height: 50.0),
                ResponsiveWidget.toTitle('HOW I DO IT'),
                SizedBox(height: 30.0),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 500),
                  child: howWeDoIt,
                ),
              ],
            ),
            smallScreen: Column(
              children: <Widget>[
                ResponsiveWidget.toTitle('WHAT I DO'),
                SizedBox(height: 30.0),
                mobileDevelopment,
                SizedBox(height: 20.0),
                webDevelopment,
                SizedBox(height: 20.0),
                noSQLDatabase,
                SizedBox(height: 20.0),
                ResponsiveWidget.toTitle('HOW I DO IT'),
                SizedBox(height: 30.0),
                howWeDoIt,
              ],
            ),
          ),
        ),
      ),
    );
  }
}