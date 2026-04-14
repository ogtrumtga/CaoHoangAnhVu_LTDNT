import 'package:caohoanganhvu_2324802010159_lab3/api_service.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final api = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reset Password')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(height: 40,),
              Image.asset('assets/images/resetpassword.png', width: 100, height: 100,),
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
              const SizedBox(height: 10,),
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
              ElevatedButton(onPressed: () async {
                if (_formKey.currentState!.validate())
                {
                  await api.put('user', {
                    'email' : emailController.text,
                    'password' : passwordController.text
                  });
                  showDialog(context: context, builder: (_) => const AlertDialog(
                      title: Text('Successfully'),
                      content: Text('Da reset password'),
                    )
                  );
                }
              }, child: const Text('Reset password')),
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