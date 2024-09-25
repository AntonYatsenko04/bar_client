import 'package:bar_client/core_ui/lib/src/widgets/app_scaffold.dart';
import 'package:bar_client/core_ui/lib/src/widgets/height_spacer.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Вход',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TextField(),
          const HeightSpacer(),
          const TextField(),
          const HeightSpacer(),
          FilledButton(onPressed: () {}, child: const Text('Вход')),
          FilledButton(onPressed: () {}, child: const Text('')),
        ],
      ),
    );
  }
}
