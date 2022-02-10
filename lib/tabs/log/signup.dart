import 'package:final_projrct/widgets/consrants.dart';
import 'package:final_projrct/widgets/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class signupscreen extends StatelessWidget {
  const signupscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: Helper.getScreenWidth(context),
          height: Helper.getScreenHeight(context),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/logback.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              child: Column(
                children: [
                  const Text(
                    "Sign up",
                    style: Constants.boldHeading,
                  ),
                  Spacer(),
                  const Text(
                    "Add your deatails to sign up",
                    style: Constants.regularnomal,
                  ),
                  Spacer(),
                  name(),
                  Spacer(),
                  email(),
                  Spacer(),
                  mobilen(),
                  Spacer(),
                  address(),
                  Spacer(),
                  passwordin(),
                  Spacer(),
                  copasswordin(),
                  Spacer(),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Sign Up"),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Already have an Account?",
                          style: Constants.regularnomal,
                        ),
                        Text(
                          "Login",
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

// input

class name extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: const ShapeDecoration(
        color: Colors.white60,
        shape: StadiumBorder(),
      ),
      child: const TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Name",
            hintStyle: TextStyle(
              color: Colors.black45,
            ),
            contentPadding: EdgeInsets.only(left: 30)),
      ),
    );
  }
}

class email extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: const ShapeDecoration(
        color: Colors.white60,
        shape: StadiumBorder(),
      ),
      child: const TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Email",
            hintStyle: TextStyle(
              color: Colors.black45,
            ),
            contentPadding: EdgeInsets.only(left: 30)),
      ),
    );
  }
}

class mobilen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: const ShapeDecoration(
        color: Colors.white60,
        shape: StadiumBorder(),
      ),
      child: const TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Mobile No",
            hintStyle: TextStyle(
              color: Colors.black45,
            ),
            contentPadding: EdgeInsets.only(left: 30)),
      ),
    );
  }
}

class address extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: const ShapeDecoration(
        color: Colors.white60,
        shape: StadiumBorder(),
      ),
      child: const TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Address",
            hintStyle: TextStyle(
              color: Colors.black45,
            ),
            contentPadding: EdgeInsets.only(left: 30)),
      ),
    );
  }
}

class passwordin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: const ShapeDecoration(
        color: Colors.white60,
        shape: StadiumBorder(),
      ),
      child: const TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Password",
            hintStyle: TextStyle(
              color: Colors.black45,
            ),
            contentPadding: EdgeInsets.only(left: 30)),
      ),
    );
  }
}

class copasswordin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: const ShapeDecoration(
        color: Colors.white60,
        shape: StadiumBorder(),
      ),
      child: const TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Confirm Password",
            hintStyle: TextStyle(
              color: Colors.black45,
            ),
            contentPadding: EdgeInsets.only(left: 30)),
      ),
    );
  }
}
