// ignore_for_file: unnecessary_null_in_if_null_operators

import 'package:app/constants.dart';
import 'package:app/ui/base/base_textfield/base_textfield.dart';
import 'package:app/ui/shared/buttons/pot_button.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final Future<Map?> Function(BuildContext, String, String) onSubmit;
  const LoginForm({Key? key, required this.onSubmit}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  dynamic _emailError;
  dynamic _passwordError;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          BaseTextField(
            controller: _emailController,
            placeholder: 'Email',
            width: 350,
            height: 60,
            onChangedCallback: (value) {},
            validator: (String? value) {
              if (value?.isEmpty ?? true) {
                _emailError = 'Please enter an email';
                return _emailError;
              }
              if (_emailError is String) {
                return _emailError;
              } else if (_emailError is List) {
                return (_emailError as List)[0];
              }
            },
          ),
          BaseTextField(
            controller: _passwordController,
            placeholder: 'Password',
            width: 350,
            height: 60,
            obscureText: true,
            onChangedCallback: (value) {},
            validator: (String? value) {
              if (value?.isEmpty ?? true) {
                _passwordError = 'Please enter a password';
                return _passwordError;
              }
              if (_passwordError is String) {
                return _passwordError;
              } else if (_passwordError is List) {
                return (_passwordError as List)[0];
              }
              return _passwordError;
            },
          ),
          POTButton(
              width: 100,
              height: 30,
              text: 'Login',
              red: true,
              textStyle: POTTextStyles.navbarText__active,
              callback: () async {
                setState(() {
                  _emailError = null;
                  _passwordError = null;
                });
                if (_formKey.currentState!.validate()) {
                  Map? errors = await widget.onSubmit(
                      context, _emailController.text, _passwordController.text);
                  if (errors != null) {
                    setState(() {
                      _emailError = errors['email'] ?? null;
                      _passwordError = errors['password'] ?? null;
                      _formKey.currentState!.validate();
                    });
                  }
                } else {
                }
              }),
        ],
      ),
    );
  }
}
