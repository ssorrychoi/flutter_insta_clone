import 'package:com/login_page.dart';
import 'package:com/tab_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        print(snapshot);
        print('snapshot.data');
        print(snapshot.hasData);
        if(snapshot.hasData){
          return TabPage(snapshot.data);
        }else{
          return LoginPage();
        }

      }
    );
  }
}
