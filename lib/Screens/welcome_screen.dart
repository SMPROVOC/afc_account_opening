import 'package:flutter/material.dart';
import 'package:pb/Screens/landing_screen.dart';
import 'package:pb/Screens/register_screen.dart';
import 'package:pb/widgets/popup.dart';
import 'package:pb/widgets/text_input.dart';
import 'package:pb/Screens/landing_screen.dart';
import 'package:pb/widgets/responsive_button.dart';
import 'package:pb/Screens/client_form_one.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'client_screen_one.dart';

class WelcomeScreen extends StatefulWidget {
  static const routeName = '/welcome-screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/girlPic1.jpeg"),
                fit: BoxFit.cover)),

        child: Center(
          child: Padding(
            padding: EdgeInsets.all(28.0),
            child: SingleChildScrollView(
                reverse: true,
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
                    height: 100,
                  ),
                  userInput(emailController, 'Email', TextInputType.text,
                      Icons.verified_user),
                  userInputObsecured(passwordController, 'Password', TextInputType.visiblePassword,
                      Icons.key),
                  SizedBox(
                    height: 10,
                  ),
                  loginButton(
                      Colors.green, 'Sign In', Colors.white, context),

                  registerButton(
                      Colors.green, 'Register', Colors.white, context),

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

  Widget loginButton(
      Color buttonColor, String title, Color textColor, BuildContext ctx) {
    return Container(
      height: 60,
      width: 200,
      padding: const EdgeInsets.only(top: 25, left: 24, right: 24),
      child: RaisedButton(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: buttonColor,
        onPressed: () {

          if (emailController.text.isEmpty){
          submitionError(context, 'Please provide your email');
          }else if(passwordController.text.isEmpty){
          submitionError(context, 'Please provide your password');
          }else{
            checkLoginDetails(emailController.text, passwordController.text);
          }
          // Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
          //   return ClientScreenOne();
          // }));
        },
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: textColor,
          ),
        ),
      ),
    );
  }


  Widget registerButton(
      Color buttonColor, String title, Color textColor, BuildContext ctx) {
    return Container(
      height: 60,
      width: 200,
      padding: const EdgeInsets.only(top: 25, left: 24, right: 24),
      child: RaisedButton(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: buttonColor,
        onPressed: () {

          Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
            return RegisterScreen(token: '',);
          }));
        },
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: textColor,
          ),
        ),
      ),
    );
  }

  checkLoginDetails(String email, String password) async {
    print(email);
    print(password);


    try{

    var postUri = Uri.parse("https://payments.agribank.co.zw/api/login");

    http.MultipartRequest request = new http.MultipartRequest("POST", postUri);

    request.headers['Accept'] = 'application/json';

    request.fields["email"] = email;
    request.fields["password"] = password;




    var streamedResponse = await request.send().timeout(const Duration(seconds: 25));

    var response = await http.Response.fromStream(streamedResponse);

    print(response.statusCode);
    print(response.body);

    var responseData = json.decode(response.body);

    print(responseData);
    //Creating a list to store input data;


    print(responseData['token']);


    var res = responseData['message'];

    if (res == "Bad creds"){
      submitionError(context, "Failed to login. Invalid email/password");
    }else{
      // Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      //   return LandingScreen();
      // }));
      var token = responseData['token'];

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LandingScreen(
              token: token

            ),
          ));
    }



  } on Exception catch (exception) {
  submitionError(context, "Login failed, this can be due to poor internet connection. Please check your network connection!");

  } catch (error) {
  submitionError(context, "Login failed, this can be due to poor internet connection. Please check your network connection!");

  }
    // Navigator.of(context).push(MaterialPageRoute(builder: (_) {
    //   return LandingScreen();
    // }));
}
}
