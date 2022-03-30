import 'package:flutter/material.dart';
import 'package:pb/widgets/text_input.dart';
import 'package:pb/widgets/responsive_button.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = '/welcome-screen';
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/pic_2.png"),
                fit: BoxFit.cover)),

        child: Padding(
          padding: EdgeInsets.all(28.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                width: 260,
                height: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/pic_2.png"),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: 20,
              ),
              userInput(emailController, 'first_name', TextInputType.text,
                  Icons.verified_user),
              userInput(emailController, 'first_name', TextInputType.text,
                  Icons.verified_user),
              authentificationButton(
                  Colors.green, 'Sign In', Colors.white, context),
            ],
          ),
        ),
        // child: Card(
        //     child: Center(
        //       child: Icon(
        //         Icons.refresh,
        //         size: 15.0,
        //       ),
        //     ),
        //     elevation: 5,
        //     margin: EdgeInsets.fromLTRB(20.0, 120.0, 20.0, 120.0),
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(12.0),
        //     )),
      ),
    );
  }
}
