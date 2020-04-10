import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Instagram Clone',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
            Padding(padding: EdgeInsets.all(50),),
            SignInButton(
              Buttons.Google,
              onPressed: (){
                _handleSignIn()
                    .then((FirebaseUser user) => print(user))
                    .catchError((e) => print(e));
            },),
          ],
        ),
      ),
    );
  }

//  Future<FirebaseUser> _handleSignIn() async{
//    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
//    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//    FirebaseUser user = await _auth.signInWithCredential(
//      GoogleAuthProvider.getCredential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken)
//    );
//    return user;
//  }
  Future<FirebaseUser> _handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    return user;
  }
}
