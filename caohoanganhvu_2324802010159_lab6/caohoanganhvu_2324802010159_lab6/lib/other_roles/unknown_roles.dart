import 'package:caohoanganhvu_2324802010159_lab6/constants/app_colors.dart';
import 'package:caohoanganhvu_2324802010159_lab6/shared/custom_appbar.dart';
import 'package:flutter/material.dart';


class UnknownRoles extends StatefulWidget {
  const UnknownRoles({super.key});

  @override
  State<UnknownRoles> createState() => _UnknownRolesState();
}

class _UnknownRolesState extends State<UnknownRoles> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(
          title: "Unknown Role", color: AppColors.unknownRolesPage),
      body: Center(
        child: Text("Unknown user Role\nContact admin to solve this issue."),
      ),
    );
  }
}