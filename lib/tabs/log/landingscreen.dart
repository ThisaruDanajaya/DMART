import 'package:final_projrct/tabs/log/loginp.dart';
import 'package:final_projrct/widgets/helper.dart';
import 'package:final_projrct/widgets/consrants.dart';
import 'package:flutter/material.dart';

class landindscreen extends StatelessWidget {
  static const routeName = "/welcomescreen/";

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
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset("assets/images/logo.png"),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: Helper.getScreenHeight(context) * 0.3,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const Text("I am a rider",style: Constants.regularnomal,),
                    const Spacer(
                      flex: 2,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => loging()),
                          );
                        },
                        child: Text("LOG IN"),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          foregroundColor: MaterialStateProperty.all(
                              Colors.deepPurpleAccent),
                          shape: MaterialStateProperty.all(
                            const StadiumBorder(
                              side: BorderSide(
                                  color: Colors.deepPurpleAccent, width: 1.5),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Text("SIGN UP"),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
