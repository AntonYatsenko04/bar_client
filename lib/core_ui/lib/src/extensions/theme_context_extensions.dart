import 'package:bar_client/core_ui/lib/src/theme/theme.dart';
import 'package:flutter/material.dart';

extension ColorsContextExtension on ThemeData {
  AppColorsTheme get colors {
    return extension<AppColorsTheme>()!;
  }
}

extension TextContextExtension on ThemeData {
  TextTheme get text {
    return textTheme;
  }
}

extension ThemeDataExtension on BuildContext {
  ThemeData get theme {
    return Theme.of(this);
  }
}
