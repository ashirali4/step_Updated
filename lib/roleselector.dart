//re direct from wrapper to choose roles

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:step/services/database.dart';
import 'package:step/student/studenthome.dart';
import 'package:step/teacher/teacherhome.dart';


class RoleSelector extends StatefulWidget {
  @override
  _RoleSelectorState createState() => _RoleSelectorState();

}

class _RoleSelectorState extends State<RoleSelector> {
  String role='';

  Future<void> setRole() async {
    role=await UserHelper.getuserRole();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setRole();
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(role+"this is role from firebase");
    // return either studenthome/teacherhome/teacheradminhome widgets.
    switch(role){
      case 'student':
        return SizedBox();
        break;
      case 'admin':
        return StudentsHomeScreen();
      break;
      default:
        return SizedBox();

    }
  }
}



