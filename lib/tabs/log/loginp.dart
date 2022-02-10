import 'package:final_projrct/tabs/log/signup.dart';
import 'package:final_projrct/widgets/consrants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class loging extends StatefulWidget {
  static const routeName = "/loging";

  @override
  State<loging> createState() => _logingState();
}

class _logingState extends State<loging> {
  Future<void> _alertDialogBuilder(String error) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("Error"),
            content: Container(
              child: Text(error),
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("close Dialog"),
              )
            ],
          );
        });
  }

  Future<String?> _loging() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _logEmail, password: _logpassword);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  void _submitform() async {
    // set the form to loading state
    setState(() {
      _registerformloading = true;
    });

    // run the create account method
    String? _createAccountFeedback = await _loging();

    //if the string is not null, we got error while create a account
    if (_createAccountFeedback != null) {
      _alertDialogBuilder(_createAccountFeedback);

      //set the from to regular state [not loading]
      setState(() {
        _registerformloading = false;
      });
    }
  }

  //default from loading state
  bool _registerformloading = false;

  //from input field value
  String _logEmail = "";
  String _logpassword = "";

  // facus input
  late FocusNode _passweordfocusNode;

  @override
  void initState() {
    _passweordfocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passweordfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/logback.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Login",
                    style: Constants.boldHeading,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Add Your deatils to login",
                    style: Constants.regularHeading,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Emailin(
                    onChanged: (value) {
                      _logEmail = value;
                    },
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Passwordin(
                    onChanged: (value) {
                      _logpassword = value;
                    },
                    focusNode: _passweordfocusNode,
                    isPasswordField: true,
                    onSubmitted: (value) {
                      _submitform();
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        _submitform();
                      },
                      isLoading: _registerformloading,
                      child: Text("Logging"),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    child: const Text(
                      "Forget Password",
                      style: Constants.regularnomal,
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  const Text(
                    "or Login With",
                    style: Constants.regularnomal,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 35,
                            child: Image.asset("assets/images/google.png"),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Loging with Google",
                            style: Constants.regularDarkText,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const signupscreen()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Don't have an Account?",
                          style: Constants.regularnomal,
                        ),
                        Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Emailin extends StatelessWidget {
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;

  Emailin({
    this.focusNode,
    this.onChanged,
    this.onSubmitted,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: const ShapeDecoration(
        color: Colors.white60,
        shape: StadiumBorder(),
      ),
      child: TextField(
        focusNode: focusNode,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        textInputAction: textInputAction,
        decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Your Email",
            hintStyle: TextStyle(
              color: Colors.black45,
            ),
            contentPadding: EdgeInsets.only(left: 30)),
      ),
    );
  }
}

class Passwordin extends StatelessWidget {
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final bool? isPasswordField;

  Passwordin({
    this.focusNode,
    this.onChanged,
    this.onSubmitted,
    this.textInputAction,
    this.isPasswordField,
  });

  @override
  Widget build(BuildContext context) {

    bool _isPasswordField = isPasswordField ?? false;

    return Container(
      width: double.infinity,
      height: 50,
      decoration: const ShapeDecoration(
        color: Colors.white60,
        shape: StadiumBorder(),
      ),
      child: TextField(
        focusNode: focusNode,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        textInputAction: textInputAction,
        obscureText: _isPasswordField,
        decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Enter Your Password",
            hintStyle: TextStyle(
              color: Colors.black45,
            ),
            contentPadding: EdgeInsets.only(left: 30)),
      ),
    );
  }
}
