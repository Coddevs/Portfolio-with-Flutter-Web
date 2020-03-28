import '../models/project.dart';
import 'assets.dart';
import 'links.dart';

final List<Project> projects = [
  Project(
    name: 'Coddevs',
    image: Assets.logo,
    description: 'Coddevs is a portfolio website. You can hire to Coddevs for mobile and web development.',
    link: 'http://coddevs.com',
  ),
  Project(
    name: 'Check my Github',
    image: Assets.github,
    description: null,
    link: Links.github,
  ),
];