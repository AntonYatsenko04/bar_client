import 'package:bar_client/core_ui/src/theme/app_images.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  final String title;

  const AppScaffold({
    required this.child,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.background),
                fit: BoxFit.cover,
                opacity: 0.3,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(80.0),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
