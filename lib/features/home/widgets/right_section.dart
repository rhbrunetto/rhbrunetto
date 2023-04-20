import 'package:flutter/material.dart';

import '../../../app/colors.dart';
import 'icons_panel.dart';

class RightSection extends StatelessWidget {
  const RightSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Container(color: RPColors.beigeBackground),
          const IconsPanel(),
        ],
      );
}
