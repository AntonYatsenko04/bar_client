import 'package:flutter/services.dart';

sealed class InputFormattersConstants {
  static TextInputFormatter lengthLimitingTextInputFormatter3 = LengthLimitingTextInputFormatter(3);
  static TextInputFormatter lengthLimitingTextInputFormatter64 =
      LengthLimitingTextInputFormatter(64);
  static TextInputFormatter lengthLimitingTextInputFormatter256 =
      LengthLimitingTextInputFormatter(256);

  static TextInputFormatter lengthLimitingTextInputFormatter400 =
      LengthLimitingTextInputFormatter(400);
  static TextInputFormatter lengthLimitingTextInputFormatter1000 =
      LengthLimitingTextInputFormatter(1000);
  static FilteringTextInputFormatter denySpaces =
      FilteringTextInputFormatter.deny(RegExp(r'^\s|\s$'));
  static FilteringTextInputFormatter denyCyrillicSymbols =
      FilteringTextInputFormatter.deny(RegExp('[а-яА-Я]'));
  static FilteringTextInputFormatter denyEmoji = FilteringTextInputFormatter.deny(
    RegExp(
      '/[\uD83C-\uDBFF\uDC00-\uDFFF\uD800-\uDBFF\uDC00-\uDFFF\u2600-\u26FF\u2700-\u27BF\uD83D\uD83C\uD83E\uD83F\u2B50\u2B06\u2934\u2935\u25AA\u25AB\u25FE\u25FD\u25FB\u25FC\u25B6\u25C0\u1F200-\u1F251\u2B50\u2B06\u2934\u2935\u25AA\u25AB\u25FE\u25FD\u25FB\u25FC\u25B6\u25C0\u200D]/g',
    ),
  );
}
