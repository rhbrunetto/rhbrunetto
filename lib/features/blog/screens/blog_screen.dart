import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../app/colors.dart';

@RoutePage()
class BlogScreen extends StatelessWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: RPColors.greyShadow,
        child: const Center(child: Text('Blog')),
      );
}