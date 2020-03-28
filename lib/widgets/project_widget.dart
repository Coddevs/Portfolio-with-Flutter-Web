import 'package:url_launcher/url_launcher.dart' as launcher;
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/project.dart';

class ProjectWidget extends StatelessWidget {
  final Project project;
  final double bottomPadding;
  ProjectWidget({
    @required this.project,
    @required this.bottomPadding,
  }) :
    assert(project!=null),
    assert(bottomPadding!=null)
  ;

  void tryOpen(String url) async {
    if (await launcher.canLaunch(url)) {
      await launcher.launch(url);
    } else {
      //throw 'Could not launch $url';
    }
  }

  Widget build(BuildContext context) {
    final titleText = Text(
      project.name,
      style: Theme.of(context).textTheme.headline6,
    );
    final hasDescription = project.description!=null;
    final titleAndDescription = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 5.0),
        titleText,
        SizedBox(height: 5.0),
        Flexible(
          child: Text(
            project.description ?? '',
            textScaleFactor: 1.2,
            style: Theme.of(context).textTheme.caption,
          ),
        ),
      ],
    );

    return Card(
      elevation: 5.0,
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, bottomPadding),
      child: InkWell(
        onTap: () => tryOpen(project.link),
        child:  Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: 100.0,
                height: 100.0,
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: Image.asset(
                    project.image,
                  ).image,
                ),
              ),
              Expanded(
                flex: 3,
                child: SizedBox.shrink(),
              ),
              Expanded(
                flex: 60,
                child: hasDescription? titleAndDescription : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    titleText,
                    SizedBox(height: 7.5)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
