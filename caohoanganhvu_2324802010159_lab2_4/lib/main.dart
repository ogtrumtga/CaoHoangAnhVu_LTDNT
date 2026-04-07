import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: RegisterPage());
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Application')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset('images/avatar.jpg', width: 100, height: 100),
            CustomTextField(
              label: 'First Name',
              controller: firstNameController,
            ),
            CustomTextField(label: 'Last Name', controller: lastNameController),
            CustomTextField(label: 'Email', suffixText: '@mlritm.ac.in'),
            CustomTextField(
              label: 'Phone Number',
              prefixText: '+91',
              keyboardType: TextInputType.phone,
              maxLength: 10,
            ),
            Divider(indent: 8, endIndent: 8),
            const CustomTextField(label: 'Username'),
            const CustomTextField(label: 'Password', obscureText: true),
            const CustomTextField(label: 'Confirm Password', obscureText: true),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Registration Successful"),
                    content: Text(
                      "Welcome, ${firstNameController.text} ${lastNameController.text}!",
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("OK"),
                      ),
                    ],
                  ),
                );
              },
              child: const Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? prefixText, suffixText;
  final int? maxLength;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.label,
    this.keyboardType,
    this.obscureText = false,
    this.prefixText,
    this.suffixText,
    this.maxLength,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        inputFormatters: maxLength != null
            ? [LengthLimitingTextInputFormatter(maxLength!)]
            : null,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
          suffixText: suffixText,
          prefixText: prefixText,
        ),
      ),
    );
  }
}
