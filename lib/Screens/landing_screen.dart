import 'package:flutter/material.dart';
import 'package:pb/widgets/app_text.dart';
import 'package:pb/widgets/text_input.dart';
import 'package:pb/widgets/responsive_button.dart';

class LandingScreen extends StatefulWidget {
  static const routeName = '/landing-screen';

  final String token;

  LandingScreen({
    required this.token,

  });

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
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
                image: AssetImage("assets/images/blublack.jpg"),
                fit: BoxFit.cover)),

        child: Center(
          child: Padding(
            padding: EdgeInsets.all(28.0),
            child: SingleChildScrollView(
                reverse: true,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Container(
                    width: 400,
                    height: 140,

                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/logo2.png"),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    height: 50,
                  ),

                  Row(


                    children: [
                      Container(
                        child: Column(

                          children: [
                            landingButtonOpenAccount(Colors.green, 'Sign In', Colors.white, context, widget.token),
                            AppText(text: 'Open an account', color: Colors.white, size: 16, ),
                          ],
                        ),
                      ),
                       Spacer(),


                      Container(
                        child: Column(
                          children: [
                            landingButtonOverdraft(Colors.green, 'Sign In', Colors.white, context, widget.token),
                            AppText(text: 'Apply for overdraft', color: Colors.white, size: 16, ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 50,
                  ),

                  // Container(
                  //   child: Column(
                  //     children: [
                  //
                  //       landingButtonLoan( Colors.green, 'Sign In', Colors.white, context, widget.token),
                  //       AppText(text: 'Apply for a loan', color: Colors.white, size: 18,),
                  //     ],
                  //
                  //   ),
                  //
                  // ),

                  Row(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            landingButtonLoan(Colors.green, 'Sign In', Colors.white, context, widget.token),
                            AppText(text: 'Apply for loan', color: Colors.white, size: 16, ),
                          ],
                        ),
                      ),
                      Spacer(),

                      Container(
                        child: Column(
                          children: [
                            landingButtonCheckBalance(Colors.green, 'Sign In', Colors.white, context, widget.token),
                            AppText(text: 'Check balance', color: Colors.white, size: 16, ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),


                  Row(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            landingButtonUploadAdditionals(Colors.green, 'Sign In', Colors.white, context, widget.token),
                            AppText(text: 'Additional uploads', color: Colors.white, size: 16, ),
                          ],
                        ),
                      ),
                      Spacer(),

                      Container(
                        child: Column(
                          children: [
                            landingButtonOfflineUpload(Colors.green, 'Sign In', Colors.white, context, widget.token),
                            AppText(text: 'Offline uploads', color: Colors.white, size: 18, ),
                          ],
                        ),
                      ),
                    ],
                  ),


                  // userInput(emailController, 'first_name', TextInputType.text,
                  //     Icons.verified_user),
                  // userInput(emailController, 'Password', TextInputType.text,
                  //     Icons.verified_user),
                  // authentificationButton(
                  //     Colors.green, 'Sign In', Colors.white, context),
                  Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),),
                ],
              ),
            ),
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
