import 'package:flutter/material.dart';
import 'package:pb/widgets/app_text.dart';
import 'package:pb/widgets/text_input.dart';
import 'package:pb/widgets/responsive_button.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:pb/widgets/popup.dart';

class CheckBalanceScreen extends StatefulWidget {
  static const routeName = '/show-balance-screen';

  final String token;

  CheckBalanceScreen({
    required this.token,

  });

  @override
  State<CheckBalanceScreen> createState() => _CheckBalanceScreen();
}

class _CheckBalanceScreen extends State<CheckBalanceScreen> {
  final idController = TextEditingController();

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
                height: 100,
              ),


              Container(
                child: Column(
                  children: [

                    // AppText(text: 'Service is coming soon!', color: Colors.white, size: 30,),
                    userInput(idController, 'Account number', TextInputType.number,
                        Icons.supervised_user_circle),
                    SizedBox(height: 10,),
                    checkBalanceButton(Colors.green, 'Check balance', Colors.white, context),
                    SizedBox(height: 50,),
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


  Widget checkBalanceButton(
      Color buttonColor, String title, Color textColor, BuildContext ctx) {
    return Container(
      height: 60,
      width: 250,
      padding: const EdgeInsets.only(top: 25, left: 24, right: 24),
      child: RaisedButton(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: buttonColor,
        onPressed: () {

          submitionError(context, "Service comming soon");

          // Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
          //   return RegisterScreen(token: '',);
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

  checkLoginDetails(String id) async {
    print(id);

    try{

      var postUri = Uri.parse("https://payments.agribank.co.zw/api/balance");

      http.MultipartRequest request = new http.MultipartRequest("POST", postUri);

      request.headers['Accept'] = 'application/json';

      request.fields["account"] = id;


      var streamedResponse = await request.send().timeout(const Duration(seconds: 25));

      var response = await http.Response.fromStream(streamedResponse);

      print(response.statusCode);
      print(response.body);

      var responseData = json.decode(response.body);

      print(responseData);
      //Creating a list to store input data;


      print(responseData['message']);


      var res = responseData['message'];

      submitionBalance(context, res);


    } on Exception catch (exception) {
      submitionError(context, "Failed to get your balance, this can be due to poor internet connection. Please check your network connection!");

    } catch (error) {
      submitionError(context, "Failed to get your balance, this can be due to poor internet connection. Please check your network connection!");

    }
    // Navigator.of(context).push(MaterialPageRoute(builder: (_) {
    //   return LandingScreen();
    // }));
  }
}
