import 'package:caohoanganhvu_2324802010159_lab3/reset_password_screen.dart';
import 'package:caohoanganhvu_2324802010159_lab3/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'api_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final api = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(height: 40,),
              Image.asset('assets/images/usericon.png', width: 100, height: 100,),
              const SizedBox(height: 20,),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value){
                  if (value == null || value.isEmpty)
                  {
                    return 'The field cannot be empty';
                  }
                  final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                  if (!regex.hasMatch(value))
                  {
                    return 'Invalid email address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value){
                  if (value == null || value.isEmpty)
                  {
                    return 'The field cannot be empty';
                  }
                  if (value.length < 7)
                  {
                    return 'The password length must be at least 7 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10,),
              ElevatedButton(onPressed: () async {
                if (_formKey.currentState!.validate())
                {
                  await api.get('user', {
                    'email' : emailController.text,
                    'password' : passwordController.text
                  });
                  showDialog(context: context, builder: (_) => const AlertDialog(
                      title: Text('Successfully'),
                      content: Text('Dang nhap thanh cong'),
                    )
                  );
                }
              }, child: const Text('Sign in')),
              const SizedBox(height: 10,),
              OutlinedButton(onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const SignUpScreen()));
              }, child: Text('Sign up')),
              const SizedBox(height: 10,),
              TextButton(onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ResetPasswordScreen()));
              }, child: Text('Reset password'))
            ],
          ),
        ),
      ),
    );
  }
}