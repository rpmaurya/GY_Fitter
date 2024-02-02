import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final String? hitText;
  final Widget? suffixIcons;
  final TextEditingController? textEditingController;
  final FormFieldValidator<String?>? validator;
  final TextInputType? keyboardType;
  final TextStyle? hitTextStyle;
  final bool? obscuringText;
  final bool? onlyRead;
  final int? maxLength;

  const CommonTextField({
    Key? key,
    this.hitText,
    this.suffixIcons,
    this.textEditingController,
    this.validator,
    this.keyboardType,
    this.obscuringText,
    this.hitTextStyle,
    this.maxLength,
    this.onlyRead,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscuringText ?? false,
      readOnly: onlyRead ?? false,
      maxLength: maxLength,
      decoration: InputDecoration(
        hintText: hitText.toString(),
        hintStyle: hitTextStyle,
        suffixIcon: suffixIcons,
      ),
    );
  }
}
