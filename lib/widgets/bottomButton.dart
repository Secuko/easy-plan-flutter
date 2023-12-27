import 'package:easy_plan/utils/utils.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton(this.str);
  final String str;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 63,
      width: 320,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.loginButton,
      ),

      child: Center(
        child: FittedBox(
          child: Text(str, style: AppTypography.black35R),
        ),
      ),
    );
  }
}
