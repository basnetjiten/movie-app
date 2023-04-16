import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_online_course/feature/auth/presentation/widgets/custom_form_field.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Form'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            CustomTextFormField(
              controller: _usernameController,
              labelText: 'Username',
              hintText: 'Please add your username',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'user name is required';
                } else if (value.length < 5) {
                  return 'Invalid user name';
                }
                return null;
              },
            ),
            CustomTextFormField(
              controller: _passwordController,
              labelText: 'Password',
              hintText: 'Please add your password',
              validator: (password) {
                if (password != null && password.contains('@')) {
                  return null;
                }
                return 'Password must contain @ symbol';
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Processing Data'),
                      ),
                    );
                    print(_usernameController.text);
                    print(_passwordController.text);
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//AuthCubit
//AuthRepo
//Database Instance (store username and password)