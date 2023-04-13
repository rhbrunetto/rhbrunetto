import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../widgets/left_section.dart';
import '../widgets/right_section.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // TODO(rhbrunetto): add a maximum width to center on page
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Flexible(child: LeftSection()),
          Flexible(child: RightSection()),
        ],
      );
}
