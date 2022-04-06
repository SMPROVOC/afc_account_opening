import 'package:flutter/material.dart';
import 'package:pb/Screens/landing_screen.dart';
import 'package:pb/widgets/popup.dart';
import 'package:pb/widgets/text_input.dart';
import 'package:pb/widgets/responsive_button.dart';
import 'package:pb/Screens/client_form_one.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'client_screen_one.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register-screen';

  final String token;

  RegisterScreen({
    required this.token,

  });

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repasswordController = TextEditingController();
  final branchCodeController = TextEditingController();
  final organisationController = TextEditingController();
  String? _dropDownValueBranchCode;
  String? _dropDownValueOrganisation;


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

              // Container(
              //   width: 200,
              //   height: 100,
              //   decoration: BoxDecoration(
              //       image: DecorationImage(
              //           image: AssetImage("assets/images/logo.png"),
              //           fit: BoxFit.cover)),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              userInput(nameController, 'Name', TextInputType.text,
                  Icons.verified_user),
              userInput(emailController, 'Email', TextInputType.text,
                  Icons.email),
              userInputObsecured(passwordController, 'Password', TextInputType.text,
                  Icons.key),
              userInputObsecured(repasswordController, 'Re-enter Password', TextInputType.text,
                  Icons.key),
              Container(
                width: 300,
                padding: EdgeInsets.only(left: 16, right: 16),
                // color: Colors.grey,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Colors.white54),
                child: DropdownButton(
                  hint: _dropDownValueBranchCode == null
                      ? Text('Branch Code', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                      : Text(
                    _dropDownValueBranchCode!,
                    style: TextStyle(color: Colors.black, fontSize: 18,),
                  ),

                  isExpanded: true,
                  iconSize: 30.0,
                  style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold),
                  items: ['NMA'].map(
                        (val) {
                      return DropdownMenuItem<String>(
                        value: val,
                        child: Text(val),
                      );
                    },
                  ).toList(),
                  onChanged: (val) {
                    setState(
                          () {
                        _dropDownValueBranchCode = val as String?;
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: 300,
                padding: EdgeInsets.only(left: 16, right: 16),
                // color: Colors.grey,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Colors.white54),
                child: DropdownButton(
                  hint: _dropDownValueOrganisation == null
                      ? Text('Organisation', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                      : Text(
                    _dropDownValueOrganisation!,
                    style: TextStyle(color: Colors.black, fontSize: 18,),
                  ),

                  isExpanded: true,
                  iconSize: 30.0,
                  style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold),
                  items: ['AFC'].map(
                        (val) {
                      return DropdownMenuItem<String>(
                        value: val,
                        child: Text(val),
                      );
                    },
                  ).toList(),
                  onChanged: (val) {
                    setState(
                          () {
                        _dropDownValueOrganisation = val as String?;
                      },
                    );
                  },
                ),
              ),

              checkRegistrationButton(
                  Colors.green, 'Register', Colors.white, context),

              SizedBox(height: 15,),

              backToLoginButton(
                  Colors.green, 'Back to login', Colors.white, context),
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

  Widget checkRegistrationButton(
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
          }else if(nameController.text.isEmpty){
            submitionError(context, 'Please provide your password');
          }else if(repasswordController.text.isEmpty){
            submitionError(context, 'Please re-enter your password');
          }else if(_dropDownValueBranchCode == null){
            submitionError(context, 'Please provide your branch code');
          }else if(passwordController.text != repasswordController.text){
            submitionError(context, 'Your passwords do not match!');
          }else if(_dropDownValueOrganisation == null){
            submitionError(context, 'Please provide your organisatin');
          }else{
            checkLoginDetails(nameController.text, emailController.text, passwordController.text, repasswordController.text, _dropDownValueBranchCode.toString(), _dropDownValueOrganisation.toString());
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

  checkLoginDetails(String name, String email, String password, String repassword,String BranchCode, String organisation) async {
    // print(name);
    // print(email);
    // print(password);
    // print(BranchCode);
    // print(organisation);

    if (BranchCode == "NMA"){
      BranchCode = "ZW0010040";
    }

    var postUri = Uri.parse("https://payments.agribank.co.zw/api/register");

    http.MultipartRequest request = new http.MultipartRequest("POST", postUri);

    request.headers['Accept'] = 'application/json';

    request.fields["name"] = name;
    request.fields["email"] = email;
    request.fields["password"] = password;
    request.fields["password_confirmation"] = repassword;
    request.fields["branch_code"] = BranchCode;
    request.fields["organisation"] = organisation;




    var streamedResponse = await request.send().timeout(const Duration(seconds: 15));

    var response = await http.Response.fromStream(streamedResponse);

    print(response.statusCode);
    print(response.body);

    var responseData = json.decode(response.body);

    print(responseData);
    //Creating a list to store input data;


    print(responseData['message']);


    var res = responseData['message'];

    if (res == "Bad creds"){
      submitionError(context, "Failed to login. Invalid email/password");
    }else{
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return LandingScreen(token: widget.token,);
      }));
    }

    submitionError(context, "Registered");

    // Navigator.of(context).push(MaterialPageRoute(builder: (_) {
    //   return LandingScreen();
    // }));
  }
}
