import 'package:flutter/material.dart';
import 'package:lab06/loginpage.dart';
import 'package:lab06/services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text("Email"),
              TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return "Enter Email please!";
                    }
                    return null;
                  })),
              Text("Password"),
              TextFormField(
                controller: _passwordController,
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Enter Password please!";
                  }
                  return null;
                }),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print("OK");
                      print(_emailController.text);
                      AuthService.registerUser(
                              _emailController.text, _passwordController.text)
                          .then((value) {
                        if (value == 1) {
                          Navigator.pop(context);
                        }
                      });
                    }
                  },
                  child: const Text("Register")),
            ],
          ),
        ),
      ),
    );
  }
}
