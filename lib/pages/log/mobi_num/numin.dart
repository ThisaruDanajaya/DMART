import 'package:final_projrct/pages/InSide/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum MbileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class mobilenum extends StatefulWidget {
  const mobilenum({Key? key}) : super(key: key);

  @override
  _mobilenumState createState() => _mobilenumState();
}

class _mobilenumState extends State<mobilenum> {
  MbileVerificationState currentState =
      MbileVerificationState.SHOW_OTP_FORM_STATE;
  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  late String verificationId;

  bool showLoading = false;

  void signInWithPhoneAuthCredential(phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });
    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);
      setState(() {
        showLoading = false;
      });

      if (authCredential.user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => home()));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });
      _scaffildkey.currentState!.showSnackBar(SnackBar(
        content: Text(e.message.toString()),
        duration: const Duration(seconds: 5),
      ));
    }
  }

  getMobileFormWidget(context) {
    return Column(
      children: [
        Spacer(),
        TextField(
          controller: phoneController,
          decoration: InputDecoration(
            hintText: "Mobile Number",
          ),
        ),
        SizedBox(
          height: 16,
        ),
        FlatButton(
          onPressed: () async {
            setState(() {
              showLoading = true;
            });

            await _auth.verifyPhoneNumber(
              phoneNumber: phoneController.text,
              verificationCompleted: (phoneAuthCredential) async {
                setState(() {
                  showLoading = false;
                });
                //signInWithPhoneAuthCredential(phoneAuthCredential);
              },
              verificationFailed: (verificationFailed) async {
                setState(() {
                  showLoading = false;
                });
                _scaffildkey.currentState!.showSnackBar(SnackBar(
                    content: Text(verificationFailed.message.toString())));
              },
              codeSent: (verificationId, resendinfTokent) async {
                setState(() {
                  showLoading = false;

                  currentState = MbileVerificationState.SHOW_OTP_FORM_STATE;
                  this.verificationId = verificationId;
                });
              },
              codeAutoRetrievalTimeout: (verificationId) async {

                _scaffildkey.currentState!.showSnackBar(SnackBar(
                    content: Text("Time Out")));
              },
            );
          },
          child: Text("Verify"),
          color: Colors.deepPurpleAccent,
          textColor: Colors.white,
        ),
        Spacer(),
      ],
    );
  }

  getOtpFormWidget(context) {
    return Column(
      children: [
        Spacer(),
        TextField(
          controller: otpController,
          decoration: InputDecoration(
            hintText: "Enter Otp",
          ),
        ),
        SizedBox(
          height: 16,
        ),
        FlatButton(
          onPressed: () async {
            PhoneAuthCredential phoneAuthCredential =
                PhoneAuthProvider.credential(
                    verificationId: verificationId,
                    smsCode: otpController.text);

            signInWithPhoneAuthCredential(phoneAuthCredential);
          },
          child: Text("Veryfy"),
          color: Colors.deepPurpleAccent,
          textColor: Colors.white,
        ),
        Spacer(),
      ],
    );
  }

  final GlobalKey<ScaffoldState> _scaffildkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffildkey,
      body: Container(
        child: showLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : currentState == MbileVerificationState.SHOW_OTP_FORM_STATE
                ? getMobileFormWidget(context)
                : getOtpFormWidget(context),
        padding: const EdgeInsets.all(16),
      ),
    );
  }
}
