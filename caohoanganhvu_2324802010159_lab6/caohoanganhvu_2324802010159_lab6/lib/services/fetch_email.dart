import 'package:caohoanganhvu_2324802010159_lab6/accounts/login.dart';
import 'package:caohoanganhvu_2324802010159_lab6/constants/token_handler.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

String fetchEmailFromToken({required BuildContext context}) {
  if (TokenHandler().getToken().isEmpty) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (Route<dynamic> route) => false,
    );
  }

  final decodedToken = JwtDecoder.decode(TokenHandler().getToken());
  String email = decodedToken['email'];

  return email;
}