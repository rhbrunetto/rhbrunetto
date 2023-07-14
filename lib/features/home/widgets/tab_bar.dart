import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../../gen/fonts.gen.dart';
import '../../../ui/colors.dart';

class HomeTabs extends StatelessWidget {
  const HomeTabs({
    super.key,
    required this.tabs,
    required this.headers,
    required this.active,
    required this.onSelect,
  });

  final List<String> tabs;
  final List<String> headers;
  final int active;
  final ValueSetter<int> onSelect;

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: tabs.length,
        child: Padding(
          padding:const EdgeInsets.symmetric(vertical: 24.0),
          child: Column(
            children: [
              _Tabs(
                tabs: tabs,
                onSelect: onSelect,
                selectedIndex: active,
              ),
              const SizedBox(height: 24.0),
              Text(
                headers.elementAt(active),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 32,
                  color: JobSiteColors.greyishBlueDark,
                ),
              ),
            ],
          ),
        ),
      );
}

class _Tabs extends StatelessWidget {
  const _Tabs({
    required this.tabs,
    required this.selectedIndex,
    required this.onSelect,
  });

  final List<String> tabs;
  final int selectedIndex;
  final ValueSetter<int> onSelect;

  @override
  build(BuildContext context) => SegmentedButton<int>(
        segments: tabs
            .mapIndexed(
              (it, title) => ButtonSegment<int>(
                value: it,
                label: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Text(title),
                ),
              ),
            )
            .toList(),
        selected: {selectedIndex},
        onSelectionChanged: (it) => onSelect(it.first),
        multiSelectionEnabled: false,
        showSelectedIcon: false,
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            const TextStyle(
              fontSize: 14,
              fontFamily: FontFamily.lato,
            ),
          ),
          side: MaterialStateProperty.all(
            const BorderSide(width: 1, color: JobSiteColors.greyishBlueLight),
          ),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              side: BorderSide(width: 1, color: JobSiteColors.greyishBlueLight),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
          foregroundColor: MaterialStateColor.resolveWith(
            (states) => states.contains(MaterialState.selected)
                ? JobSiteColors.white
                : JobSiteColors.turquoiseDark,
          ),
          backgroundColor: MaterialStateColor.resolveWith(
            (states) => states.contains(MaterialState.selected)
                ? JobSiteColors.turquoise
                : JobSiteColors.white,
          ),
        ),
      );
}
