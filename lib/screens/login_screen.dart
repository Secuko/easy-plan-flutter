import 'package:easy_plan/utils/colors.dart';
import 'package:easy_plan/utils/utils.dart';
import 'package:easy_plan/widgets/bottomButton.dart';
import 'package:easy_plan/widgets/errorTextWidget.dart';
import 'package:easy_plan/widgets/inputElem.dart';
import 'package:easy_plan/widgets/loginFormHeader.dart';
import 'package:easy_plan/widgets/textUnderInputField.dart';
import 'package:flutter/material.dart';

class LoginWindow extends StatefulWidget {
  const LoginWindow({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginWindowState();
  }
}

class LoginWindowState extends State<LoginWindow> {
  double height = 250;
  bool detector = false;
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  String _textError = '';
  bool _error = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Container(
            height: 510,
            width: 570,
            padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 42),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.registrationBackground),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const LoginFormHeader(header: 'Уже есть аккаунт?',),
                if (_error) ErrorTextWidget(_textError),
                InputElem('E-mail', _loginTextController),
                InputElem('Пароль', _passwordTextController),
                GestureDetector(
                  onTap: () => Navigator.of(context)
                      .pushReplacementNamed('/registration_screen'),
                  child: const TextUnderInputField('Еще нет аккаунта?'),
                ),
                GestureDetector(
                  onTap: () => print('au th'),
                  child: const BottomButton('Войти'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
