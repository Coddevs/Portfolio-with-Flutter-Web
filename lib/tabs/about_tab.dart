import 'package:url_launcher/url_launcher.dart' as launcher;
import 'package:flutter/material.dart';
import '../widgets/responsive_widget.dart';
import '../config/assets.dart';
import '../config/links.dart';

class AboutTab extends StatelessWidget {
  void tryOpen(String url) async {
    if (await launcher.canLaunch(url)) {
      await launcher.launch(url);
    } else {
      //throw 'Could not launch $url';
    }
  }

  Widget build(BuildContext context) {
    final captionColor = Theme.of(context).textTheme.caption.color;

    return SingleChildScrollView(
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 395.0),
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            children: <Widget>[
              CircleAvatar(
                radius: 100,
                backgroundImage: Image.asset(Assets.logo).image,
              ),
              SizedBox(height: 15.0),
              ResponsiveWidget.toTitle('Alexander V.'),
              SizedBox(height: 15.0),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                    fontSize: 22.0,
                    color: captionColor,
                  ),
                  children: <TextSpan>[
                    TextSpan(text: 'Alexander is an app developer '),
                    TextSpan(text: 'with a knack for adapt to problems. '),
                  ],
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                    fontSize: 22.0,
                    color: captionColor,
                  ),
                  children: <TextSpan>[
                    TextSpan(text: 'Working as a Flutter freelancer and studying '),
                    TextSpan(text: 'as a computer engineer.'),
                  ],
                ),
              ),
              SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FlatButton.icon(
                    icon: SizedBox(
                      width: 20,
                      height: 20,
                      child: Image.asset(Assets.github)
                    ),
                    label: Text('Github', textScaleFactor: 1.3),
                    onPressed: () => tryOpen(Links.github),
                  ),
                  FlatButton.icon(
                    icon: SizedBox(
                      width: 20,
                      height: 20,
                      child: Image.asset(Assets.twitter)
                    ),
                    label: Text('Twitter', textScaleFactor: 1.3),
                    onPressed: () => tryOpen(Links.twitter),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.email),
                  SizedBox(width: 5.0),
                  Text('admin', textScaleFactor: 1.3),
                  Icon(Icons.alternate_email, size: 17.5),
                  Text('coddevs.com', textScaleFactor: 1.3),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
