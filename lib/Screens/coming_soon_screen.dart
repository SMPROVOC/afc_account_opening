import 'package:flutter/material.dart';
import 'package:pb/widgets/app_text.dart';
import 'package:pb/widgets/text_input.dart';
import 'package:pb/widgets/responsive_button.dart';

class ComingSoonScreen extends StatefulWidget {
  static const routeName = '/coming-soon-screen';

  final String token;

  ComingSoonScreen({
    required this.token,

  });

  @override
  State<ComingSoonScreen> createState() => _ComingSoonScreen();
}

class _ComingSoonScreen extends State<ComingSoonScreen> {
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Container(
                width: 400,
                height: 140,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/logo.png"),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: 120,
              ),


              SizedBox(
                height: 50,
              ),

              Container(
                child: Column(
                  children: [

                    AppText(text: 'Service is coming soon!', color: Colors.white, size: 30,),
                    SizedBox(height: 100,),
                    backToWelcomeButton(
                        Colors.green, 'Sign In', Colors.white, context, widget.token),
                  ],
                ),
              ),


              // userInput(emailController, 'first_name', TextInputType.text,
              //     Icons.verified_user),
              // userInput(emailController, 'Password', TextInputType.text,
              //     Icons.verified_user),
              // authentificationButton(
              //     Colors.green, 'Sign In', Colors.white, context),
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
