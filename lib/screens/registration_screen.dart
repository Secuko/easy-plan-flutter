import 'package:flutter/material.dart';
import 'package:easy_plan/utils/utils.dart';
import 'package:easy_plan/widgets/bottomButton.dart';
import 'package:easy_plan/widgets/errorTextWidget.dart';
import 'package:easy_plan/widgets/inputElem.dart';
import 'package:easy_plan/widgets/loginFormHeader.dart';
import 'package:easy_plan/widgets/textUnderInputField.dart';

class RegistrationWindow extends StatefulWidget {
  const RegistrationWindow({super.key});

  @override
  State<StatefulWidget> createState() {
    return RegistrationWindowState();
  }
}

class RegistrationWindowState extends State<RegistrationWindow> {
  bool detector = false;
  final _nameTextController = TextEditingController();
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  String _textError = '';
  bool _error = false;

  String? dataValidation(String name, String email, String password) {
    final regExpPassword = RegExp(Constants.passwordRegex);
    final regExpEmail = RegExp(Constants.emailRegex);
    final regExpName = RegExp(Constants.nameRegex);

    String? isEmptyFieldsValidator() {
      return (name.isEmpty | email.isEmpty | password.isEmpty)
          ? 'Все поля должны быть заполнены'
          : null;
    }

    String? passwordValidator() {
      return (regExpPassword.hasMatch(password.trim()))
          ? null
          : 'В пароле должна быть хотя бы одну заглавная буква и цифра';
    }

    String? emailValidator() {
      return (regExpEmail.hasMatch(email.trim()))
          ? null
          : 'Неверный формат E-mail';
    }

    String? nameValidator() {
      return (regExpName.hasMatch(name.trim()))
          ? null
          : 'Имя должно состоять только из букв';
    }

    if (isEmptyFieldsValidator() != null) {
      return isEmptyFieldsValidator();
    } else if (nameValidator() != null) {
      return nameValidator();
    } else if (emailValidator() != null) {
      return emailValidator();
    } else if (passwordValidator() != null) {
      return passwordValidator();
    } else {
      return null;
    }
  }

  Future _createAccount() async {
    final name = _nameTextController.text;
    final login = _loginTextController.text;
    final password = _passwordTextController.text;

    if (dataValidation(name, login, password) != null) {
      setState(() {
        _error = true;
        _textError = dataValidation(name, login, password)!;
      });
    } else {
      setState(() {
        _error = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Container(
            height: 610,
            width: 570,
            padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 42),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.registrationBackground),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const LoginFormHeader(
                  header: 'Давай создадим аккаунт!',
                ),
                InputElem('Никнейм', _nameTextController),
                InputElem('E-mail', _loginTextController),
                InputElem('Пароль', _passwordTextController),
                if (_error) ErrorTextWidget(_textError),
                GestureDetector(
                  onTap: () => Navigator.of(context)
                      .pushReplacementNamed('/login_screen'),
                  child: const TextUnderInputField('Уже есть аккаунт?'),
                ),
                GestureDetector(
                  onTap: () => _createAccount(),
                  child: const BottomButton('Создать аккаунт'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
