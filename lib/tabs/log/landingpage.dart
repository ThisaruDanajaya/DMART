import 'package:final_projrct/tabs/InSide/home.dart';
import 'package:final_projrct/tabs/log/loginp.dart';
import 'package:final_projrct/widgets/consrants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// data base connection / user auth part(user login or not)


class LandingPage extends StatelessWidget {
  static const routeName = "/LandingPage/";
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      //firebase error handling
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("Error: ${snapshot.error}",
              style: Constants.regularDarkText,
              ),
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          //StremBuildar can check the login state live
          return StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, steamsnapshot){
                if (steamsnapshot.hasError) {
                  return Scaffold(
                    body: Center(
                      child: Text("Error: ${snapshot.error}",
                        style: Constants.regularDarkText,
                      ),
                    ),
                  );
                }

                // connection state active - do the user login check
                if(steamsnapshot.connectionState == ConnectionState.active){

                  
                  // get the user
                  Object? _user = steamsnapshot.data;

                  //if the user is null, we are not logging in
                  if (_user == null){
                    //user not logging in, head to login
                    return loging();
                  }else{
                    //the user is logged in, head to homepage
                    return home();
                  }
                }

                // checking the auth status
                return Scaffold(
                  body: Container(
                    child: const Center(
                      child: Text("Checking Authentication.....",
                        style: Constants.regularDarkText,
                      ),
                    ),
                  ),
                );
              }

          );

        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Scaffold(
          body: Container(
            child: const Center(
              child: Text("Initialization App.....",
                style: Constants.regularDarkText,
              ),
            ),
          ),
        );
      },
    );
  }
}
