import 'package:flutter/material.dart';

// TODO(rhbrunetto): use sealed class to allow better switch on layouts
enum LayoutMode { web, mobile }

typedef LayoutModeBuilder = Widget Function(BuildContext, LayoutMode);

class LayoutWrapper extends StatefulWidget {
  const LayoutWrapper({super.key, required this.builder});

  final LayoutModeBuilder builder;

  @override
  State<LayoutWrapper> createState() => _LayoutWrapperState();
}

class _LayoutWrapperState extends State<LayoutWrapper> {
  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return widget.builder(context, LayoutMode.web);
          } else {
            return widget.builder(context, LayoutMode.mobile);
          }
        },
      );
}
