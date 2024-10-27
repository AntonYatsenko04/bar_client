import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

sealed class MaskFormatters {
  static MaskTextInputFormatter get priceFormatter => MaskTextInputFormatter(
        mask: '#####,##',
        filter: <String, RegExp>{'#': RegExp('[0-9]')},
        type: MaskAutoCompletionType.eager,
      );
}
