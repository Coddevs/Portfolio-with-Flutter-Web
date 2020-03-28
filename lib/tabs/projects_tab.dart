import 'package:flutter/material.dart';
import '../config/projects.dart';
import '../widgets/project_widget.dart';
import '../widgets/responsive_widget.dart';

class ProjectsTab extends StatelessWidget {
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = ResponsiveWidget.isLargeScreen(context);
    final isMediumScreen = ResponsiveWidget.isMediumScreen(context);

    return Container(
      constraints: BoxConstraints.expand(),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 16.0),
        child: ResponsiveWidget(
          largeScreen: Wrap(
            children: List.generate(projects.length, (index) => SizedBox(
              width: isLargeScreen? screenWidth/3 : (isMediumScreen? screenWidth/2 : screenWidth),
              height: 135.0,
              child: ProjectWidget(
                project: projects[index],
                bottomPadding: 0,
              ),
            )),
          ),
        ),
      ),
    );
  }
}
