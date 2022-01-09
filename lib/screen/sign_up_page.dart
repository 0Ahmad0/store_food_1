import 'package:fatema_1/helper/helper_app_function.dart';
import 'package:fatema_1/screen/home_page.dart';
import 'package:fatema_1/services/auth.dart';
import 'package:fatema_1/widgets/all_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? userNameController ;
  String? emailController ;
  String? passwordController ;

  String? rePasswordController ;

  bool showPass = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    userNameController = '';
    emailController = '';
    passwordController = '';
    rePasswordController = '';
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
              Image.asset('images/Signup.gif'),
              CustomeTextFiled(
                hint: 'UserName',
                icon: Icons.person,
                onChange: (String? value) {
                  userNameController = value!;
                },
                validate: (String? value) {
                  return ((value!.isEmpty))
                      ? 'UserName Can\'t be Empty'
                      : null;
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              CustomeTextFiled(
                hint: 'Email',
                icon: Icons.email,
                onChange: (String? value) {
                  emailController = value!;
                },
                validate: (String? value) {
                  return ((value!.isEmpty) || (!value.contains('@')))
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
                  return (value!.isEmpty) ? 'Wrong password' : null;
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
                    hintText: 'Confirm Password'),
                onChanged: (String? value) {
                  rePasswordController = value!;
                },
                validator: (String? value) {
                  return ((value!.isEmpty)||(
                  rePasswordController != passwordController
                  )) ? 'not same password' : null;
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
                  Map creds = {
                    'userName': userNameController,
                    'email': emailController,
                    'password': passwordController,
                    'confirm': rePasswordController,
                    'devicename': 'mobile'
                  };
                  if (!formKey.currentState!.validate()) {
                  } else {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>HomeScreen()));
                    // Provider.of<Auth>(context, listen: false).login(creds);
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (ctx) => HomeScreen()));
                  }
                },
                child: Text('Sign Up'),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already Have Account?'),
                  TextButton(onPressed: () {
                    Navigator.pop(context);
                  }, child: Text('Sign In'))
                ],
              ),
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.pink,)),
                  const SizedBox(
                    width: 20.0,
                  ),
                  CircleAvatar(child: Text("OR"),),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(child: Divider(color: Colors.pink)),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              buildRowSoshial()
            ],
          ),
        ),
      ),
    );
  }
}
