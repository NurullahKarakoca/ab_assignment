import 'package:ab_assignment/models/login_user.dart';
import 'package:ab_assignment/utils/dimen.dart';
import 'package:ab_assignment/view_models/authentication_view_model.dart';
import 'package:ab_assignment/widgets/error_text.dart';
import 'package:ab_assignment/widgets/login/id_number_text_field.dart';
import 'package:ab_assignment/widgets/login/login_submit_button.dart';
import 'package:ab_assignment/widgets/login/password_text_field.dart';
import 'package:ab_assignment/widgets/login/remember_me_switch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  late LoginUser _loginUser;
  late AuthenticationViewModel _viewModel;

  @override
  void initState() {
    _initLoginUser();
    super.initState();
  }

  void _initLoginUser() {
    _loginUser = context.read<AuthenticationViewModel>().loginUser;
    if (_loginUser.rememberMe) {
      _idNumberController.text = _loginUser.identityNumber.toString();
      // _passwordController.text = _loginUser.password;
    }
  }

  @override
  void dispose() {
    _idNumberController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticationViewModel>(
        builder: (context, viewModel, child) {
      _viewModel = viewModel;
      if (viewModel.loginState.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }

      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(paddingSize),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  if (viewModel.loginState.isFailed)
                    ErrorText(text: viewModel.loginState.errorMessage!),
                  const SizedBox(
                    height: paddingSize,
                  ),
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
                      value: _loginUser.rememberMe,
                      onChanged: (value) {
                        setState(() {
                          _loginUser.rememberMe = value;
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
    });
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _loginUser.identityNumber = int.parse(_idNumberController.text);
      _loginUser.password = _passwordController.text;
      _viewModel.login(_loginUser);
    }
  }
}
