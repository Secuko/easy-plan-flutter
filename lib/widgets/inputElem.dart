import 'package:easy_plan/utils/utils.dart';
import 'package:flutter/material.dart';

class InputElem extends StatelessWidget {
  const InputElem(this.labelText, this.textController, {super.key})
      : isPassword = labelText == 'Пароль';
  final bool isPassword;
  final String labelText;
  final TextEditingController textController;

  TextInputType _getKeyboardType() {
    return labelText == 'E-mail'
        ? TextInputType.emailAddress
        : TextInputType.name;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: TextFormField(
        controller: textController,
        style: AppTypography.gray30R,
        obscureText: isPassword,
        obscuringCharacter: '*',
        textInputAction: TextInputAction.next,
        keyboardType: _getKeyboardType(),
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(start: 14.0, end: 14),
            child: (labelText == 'E-mail')
                ? const Icon(
                    Icons.email,
                    size: 40,
                    color: AppColors.iconTextField,
                  )
                : (labelText == 'Пароль')
                    ? const Icon(
                        Icons.lock,
                        size: 40,
                        color: AppColors.iconTextField,
                      )
                    : const Icon(
                        Icons.person,
                        size: 40,
                        color: AppColors.iconTextField,
                      ),
          ),
          filled: true,
          fillColor: AppColors.white,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
          isCollapsed: true,
          labelText: labelText,
          labelStyle: AppTypography.gray30R,
          floatingLabelStyle: const TextStyle(
            color: AppColors.inputFieldText,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: AppColors.black,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
