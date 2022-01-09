import 'package:fatema_1/helper/helper_app_function.dart';
import 'package:fatema_1/screen/home_page.dart';
import 'package:fatema_1/screen/sign_up_page.dart';
import 'package:fatema_1/services/auth.dart';
import 'package:fatema_1/widgets/all_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? emailController;

  String? passwordController;

  bool showPass = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // emailController.dispose();
    // passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(10.0),
            children: [
              Image.asset('images/Login.gif'),
              CustomeTextFiled(
                hint: 'Email',
                icon: Icons.email,
                onChange: (String? value) {
                  emailController = value!;
                },
                validate: (String? value) {
                  return (value!.isEmpty||!value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                obscureText: showPass,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    prefixIcon:
                        Icon(!showPass ? Icons.lock_open : Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                          !showPass ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          showPass = !showPass;
                        });
                      },
                    ),
                    hintText: 'Password'),
                onChanged: (String? value) {
                  passwordController = value!;
                },
                validator: (String? value) {
                  return (value!.isEmpty||value.length<8)
                      ? 'Wrong password will be > 8'
                      : null;
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20.0),
                ),
                onPressed: () {

                  if (!formKey.currentState!.validate()) {
                    print('OK');
                  } else {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>HomeScreen()));
                  }
                  Map creds = {
                    'email': emailController,
                    'password': passwordController,
                    'devicename': 'mobile'
                  };
                },
                child: Text('Login'),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t Have Account?'),
                  TextButton(onPressed: () {
                    goTo(context: context, widget: SignUpScreen());
                  }, child: Text('Sign Up'))
                ],
              ),
              const SizedBox(
                height: 40.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
