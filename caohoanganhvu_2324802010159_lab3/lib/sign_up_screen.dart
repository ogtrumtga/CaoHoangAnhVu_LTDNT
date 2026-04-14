import 'package:caohoanganhvu_2324802010159_lab3/api_service.dart';
import 'package:flutter/material.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final api = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign up')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(height: 40,),
              Image.asset('assets/images/signup.png', width: 100, height: 100,),
              const SizedBox(height: 20,),
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
                validator: (value){
                  if (value == null || value.isEmpty)
                  {
                    return 'The field cannot be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10,),
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
                  await api.send('user', {
                    'email' : emailController.text,
                    'password' : passwordController.text,
                    'username' : usernameController.text
                  });
                  showDialog(context: context, builder: (_) => const AlertDialog(
                      title: Text('Successfully'),
                      content: Text('Da luu thanh cong'),
                    )
                  );
                }
              }, child: const Text('Sign up')),
              const SizedBox(height: 10,),
              OutlinedButton(onPressed: ()
              {
                Navigator.pop(context);
              }, child: Text('Back')),
            ],
          ),
        ),
      ),
    );
  }
}