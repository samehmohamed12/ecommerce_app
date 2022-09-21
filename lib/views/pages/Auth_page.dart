import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/views/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/auth.dart';
import '../../utilities/enums.dart';
import '../../utilities/routes.dart';
import '../widgets/main_button.dart';

class AuthPage extends StatefulWidget {
  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  var _authType = AuthFormType.login;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit(AuthController model) async {
    try {
      await model.submit();
      Navigator.of(context).pushNamed(AppRoute.bottomNavBarRoute);
    } catch (e) {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text(
                  'Error!',
                  style: Theme.of(context).textTheme.headline5,
                ),
                content: Text(
                  e.toString(),
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('ok'))
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
     return Consumer<AuthController>(
      builder: (context, model, child) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 60.0, horizontal: 32.0),
                child: Form(
                  key: _formKey,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(
                        //   model.authFormType == AuthFormType.login
                        //       ? 'Login'
                        //       : 'Register',
                        //   style: Theme.of(context).textTheme.headline4,
                        // ),
                        const Image(
                          image: AssetImage( 'assets/logo.png'),
                          width: 390.0,
                          height: 200.0,
                          alignment: Alignment.center,

                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onChanged: model.updateEmail,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_passwordFocusNode),
                          validator: (value) => value!.isEmpty
                              ? 'please enter your email!'
                              : null,
                          textInputAction: TextInputAction.next,
                          focusNode: _emailFocusNode,
                          controller: _emailController,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            hintText: 'Enter Your Email',
                            //border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                          ),
                        ),
                        const SizedBox(
                          height: 24.0,
                        ),
                        TextFormField(
                          obscureText: true,
                          onChanged: model.updatePassword,
                          validator: (value) => value!.isEmpty
                              ? 'please enter your password!'
                              : null,
                          focusNode: _passwordFocusNode,
                          controller: _passwordController,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter Your Password',
                            //border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                          ),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        if (model.authFormType == AuthFormType.login)
                          Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              child: const Text('Forgot your password ?',
                                  style: TextStyle(color: Colors.blue)),
                              onTap: () {},
                            ),
                          ),
                        const SizedBox(
                          height: 24.0,
                        ),
                        MainButton(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                               _submit(model);

                                // Navigator.of(context)
                                //     .pushNamed(AppRoute.bottomNavBarRoute);
                              }
                            },
                            text: model.authFormType == AuthFormType.login
                                ? 'Login'
                                : 'Register'),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: InkWell(
                              child: Text(
                                model.authFormType == AuthFormType.login
                                    ? 'Don\`t have an account ? Register'
                                    : 'Have an account ? login',
                                style: const TextStyle(color: Colors.blue),
                              ),
                              onTap: () {
                                _formKey.currentState!.reset();
                                model.toggleFormType();
                              }),
                        ),
                        // SizedBox(
                        //   height: size.height * 0.14,
                        // ),
                        // Align(
                        //     alignment: Alignment.center,
                        //     child: Text(
                        //       _authType == AuthFormType.login
                        //           ? 'Or login with'
                        //           : 'Or register with',
                        //       style: Theme.of(context).textTheme.subtitle1,
                        //     )),
                        // const SizedBox(
                        //   height: 16.0,
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Container(
                        //       height: 80,
                        //       width: 80,
                        //       decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(16.0),
                        //           color: Colors.white),
                        //       child: const Icon(Icons.add),
                        //     ),
                        //     const SizedBox(
                        //       width: 16.0,
                        //     ),
                        //     Container(
                        //       height: 80,
                        //       width: 80,
                        //       decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(16.0),
                        //           color: Colors.white),
                        //       child: const Icon(Icons.add),
                        //     ),
                        //   ],
                        // )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
