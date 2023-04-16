import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_online_course/feature/auth/presentation/blocs/register_bloc/register_bloc.dart';
import 'package:flutter_online_course/feature/counter/presentation/widgets/custom_form_field.dart';


@RoutePage()
class DummyScreen extends StatefulWidget {
  const DummyScreen({Key? key}) : super(key: key);

  @override
  State<DummyScreen> createState() => _DummyScreenState();
}

class _DummyScreenState extends State<DummyScreen> {
  final _formkey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  late final RegisterBloc _registerBloc;

  @override
  void initState() {
    super.initState();
    _registerBloc = context.read<RegisterBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        print("State here $state");
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('This is Dummy Screen'),
        ),
        body: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              CustomTextFromField(
                controller: _usernameController,
                labelText: 'Username',
                hintText: 'please add your username',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'user name is required';
                  } else if (value.length < 5) {
                    return 'Invalid user number';
                  }
                  return null;
                },
              ),
              CustomTextFromField(
                controller: _passwordController,
                labelText: 'Password',
                hintText: 'please add your password',
                validator: (password) {
                  if (password != null && password.contains('@')) {
                    return null;
                  }
                  return 'password must contain @ symbol';
                },
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );

                        _registerBloc.add(
                          LoginButtonClickEvent(_usernameController.text,
                              _passwordController.text),
                        );
                      }
                    },
                    child: const Text('Login'),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
