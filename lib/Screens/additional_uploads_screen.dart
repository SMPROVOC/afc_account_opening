import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pb/widgets/app_text.dart';
import 'package:pb/widgets/text_input.dart';
import 'package:pb/widgets/responsive_button.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:pb/widgets/popup.dart';

class AdditionalUploadScreen extends StatefulWidget {
  static const routeName = '/additional-upload-screen';

  final String token;

  AdditionalUploadScreen({
    required this.token,

  });

  @override
  State<AdditionalUploadScreen> createState() => _AdditionalUploadScreen();
}

class _AdditionalUploadScreen extends State<AdditionalUploadScreen> {
  final idController = TextEditingController();
  PickedFile? _additionalFileProfilePic;
  final _picker = ImagePicker();

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

                  Container(
                    child: Column(
                      children: [

                        // AppText(text: 'Service is coming soon!', color: Colors.white, size: 30,),
                        userInput(idController, 'Enter ID', TextInputType.text,
                            Icons.supervised_user_circle),

                        SizedBox(height: 10,),
                        uploadAdditionalButton(Colors.green, 'Check ID', Colors.white, context),
                        SizedBox(height: 80,),
                        backToWelcomeButton(
                            Colors.green, 'Sign In', Colors.white, context, widget.token),

                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),),
                ],


              ),
            ),
          ),
        ),

      ),
    );
  }


  Widget uploadAdditionalButton(
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

          //submitionError(context, "Service comming soon");

          if (idController.text.isEmpty){
            submitionError(context, 'Please provide your ID number');
          }

          
          checkLoginDetails(idController.text, widget.token);

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



  checkLoginDetails(String id, String token) async {
    //print(id);

    try{

      String url = "https://payments.agribank.co.zw/api/customers/" + id;
      print(url);
      var postUri = Uri.parse(url);

      http.MultipartRequest request = new http.MultipartRequest("GET", postUri);

      request.headers['Accept'] = 'application/json';
      request.headers['Authorization'] = 'Bearer ' + token;

      var streamedResponse = await request.send().timeout(const Duration(seconds: 25));

      var response = await http.Response.fromStream(streamedResponse);

      print(response.statusCode);
      //print(token);
      //print(response.body);

      var responseData = json.decode(response.body);

      //print(responseData);
      //Creating a list to store input data;

      if (responseData['first_name'] != null){
        addtionalPopup(context, 'Please conirm if these are your details.\n\n'
            'TITLE: '+ responseData['title'] + '\n'
            'NAME: '+ responseData['first_name'] + '\n'
            'SURNAME: '+ responseData['last_name'] + '\n'
        'ADDRESS: '+ responseData['full_address'] , idController.text ,token);
      }








      //var res = responseData['message'];

      //submitionBalance(context, res);


    } on Exception catch (exception) {
      submitionError(context, "Failed to check your record, The ID you provided might not exist in our records, or there is poor internet connection.");

    } catch (error) {
      submitionError(context, "Failed to get your balance, this can be due to poor internet connection. Please check your network connection!");

    }
    // Navigator.of(context).push(MaterialPageRoute(builder: (_) {
    //   return LandingScreen();
    // }));
  }
  
  
}
