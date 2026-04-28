import 'package:caohoanganhvu_2324802010159_lab4/controllers/auth_services.dart';
import 'package:caohoanganhvu_2324802010159_lab4/home.dart';
import 'package:caohoanganhvu_2324802010159_lab4/login.dart';
import 'package:caohoanganhvu_2324802010159_lab4/signup.dart';
import 'package:caohoanganhvu_2324802010159_lab4/addcontact.dart';
import 'package:caohoanganhvu_2324802010159_lab4/updatecontact.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contacts App',
      theme: ThemeData(
        textTheme: GoogleFonts.soraTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange.shade800),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const CheckUser(),
        "/home": (context) => const HomePage(),
        "/signup": (context) => const SignUpPage(),
        "/addcontact": (context) => const AddContactPage(),
        "/updatecontact": (context) => const UpdateContactPage(),
        "/login": (context) => const LoginPage(),
      },
    );
  }
}

class CheckUser extends StatefulWidget {
  const CheckUser({super.key});

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  @override
  void initState() {
    AuthServices().isLoggedIn().then((value) {
      if (value) {
        Navigator.pushReplacementNamed(context, "/home");
      } else {
        Navigator.pushReplacementNamed(context, "/login");
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
