import 'package:easy_plan/utils/fonts.dart';
import 'package:flutter/material.dart';

class LoginFormHeader extends StatelessWidget {
  const LoginFormHeader({super.key,required this.header});

  final String header;

  @override
  Widget build(BuildContext context) {
    return Text(header,style: AppTypography.white37R,);
  }
}