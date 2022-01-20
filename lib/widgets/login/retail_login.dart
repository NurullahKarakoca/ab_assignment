import 'package:ab_assignment/utils/dimen.dart';
import 'package:ab_assignment/widgets/login/id_number_text_field.dart';
import 'package:ab_assignment/widgets/login/login_submit_button.dart';
import 'package:ab_assignment/widgets/login/password_text_field.dart';
import 'package:ab_assignment/widgets/login/remember_me_switch.dart';
import 'package:flutter/material.dart';

class RetailLogin extends StatefulWidget {
  const RetailLogin({Key? key}) : super(key: key);

  @override
  _RetailLoginState createState() => _RetailLoginState();
}

class _RetailLoginState extends State<RetailLogin> {
  final _formKey = GlobalKey<FormState>();
  final _idNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordFocusNode = FocusNode();

  var rememberMe = false;

  @override
  void dispose() {
    _idNumberController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(paddingSize),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                IdNumberTextField(
                  controller: _idNumberController,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_passwordFocusNode);
                  },
                ),
                const SizedBox(
                  height: paddingSize,
                ),
                PasswordTextField(
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  onFieldSubmitted: (_) {
                    _submitForm();
                  },
                ),
                const SizedBox(
                  height: paddingSize,
                ),
                RememberMeSwitch(
                    value: rememberMe,
                    onChanged: (value) {
                      setState(() {
                        rememberMe = value;
                      });
                    }),
                const SizedBox(
                  height: paddingSize,
                ),
                LoginSubmitButton(
                  onPressed: _submitForm,
                ),
              ],
            )),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {}
  }
}
