import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myflix/src/constants/constants.dart';
import 'package:myflix/src/shared/extensions/extensions.dart';

class InputFormWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function(String value)? onChanged;
  final String hintText;
  final bool isPassword;
  final bool isObsecure;
  final Function()? onTap;
  final Function()? onObsecureTap;
  final bool readOnly;

  const InputFormWidget(
      {Key? key,
      required this.controller,
      this.onChanged,
      required this.hintText,
      this.onTap})
      : isObsecure = false,
        onObsecureTap = null,
        isPassword = false,
        readOnly = false,
        super(key: key);

  const InputFormWidget.password(
      {Key? key,
      required this.controller,
      this.onChanged,
      required this.hintText,
      this.isObsecure = true,
      this.onObsecureTap,
      this.onTap})
      : isPassword = true,
        readOnly = false,
        super(key: key);

  const InputFormWidget.dateTime(
      {Key? key, required this.controller, required this.hintText, this.onTap})
      : isObsecure = false,
        onChanged = null,
        onObsecureTap = null,
        isPassword = false,
        readOnly = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      readOnly: readOnly,
      onTap: onTap,
      obscureText: isObsecure,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorApp.darkGrey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: ColorApp.red, width: 0.4),
        ),
        hintText: hintText,
        hintStyle: TypographyApp.text1.grey,
        suffix: isPassword
            ? GestureDetector(
                onTap: onObsecureTap,
                child: Text(
                  isObsecure ? 'SHOW' : 'HIDE',
                  style: TypographyApp.text1.grey,
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
