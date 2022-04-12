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

class AdditionalUploadTwoScreen extends StatefulWidget {
  static const routeName = '/additional-upload-two-screen';

  final String token;
  final String id;

  AdditionalUploadTwoScreen({
    required this.token,
    required this.id,

  });

  @override
  State<AdditionalUploadTwoScreen> createState() => _AdditionalUploadTwoScreen();
}

class _AdditionalUploadTwoScreen extends State<AdditionalUploadTwoScreen> {
  final idController = TextEditingController();
  PickedFile? _additionalFileProfilePic;
  final _picker = ImagePicker();
  String? _dropDownValueChoice;

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
                    height: 50,
                  ),

                  Container(
                    child: Column(
                      children: [

                        // AppText(text: 'Service is coming soon!', color: Colors.white, size: 30,),
                        // userInput(idController, 'Enter ID', TextInputType.text,
                        //     Icons.supervised_user_circle),

                        Container(
                          width: 300,
                          padding: EdgeInsets.only(left: 16, right: 16),
                          // color: Colors.grey,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              color: Colors.white70),
                          child: DropdownButton(
                            hint: _dropDownValueChoice == null
                                ? Text('What are you uploading?')
                                : Text(
                              _dropDownValueChoice!,
                              style:  TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            isExpanded: true,
                            iconSize: 30.0,
                            style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold),
                            items: ['profile photo', 'ID / passport', 'proof of residence', 'signature'].map(

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
                                      _dropDownValueChoice = val as String?;
                                },
                              );
                            },
                          ),
                        ),

                        // SizedBox(height: 10,),
                        // uploadAdditionalButton(Colors.green, 'Upload file', Colors.white, context),
                        // SizedBox(height: 50,),
                        // backToWelcomeButton(
                        //     Colors.green, 'Sign In', Colors.white, context, widget.token),
                        //
                        Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),),
                      ],
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 150,
                    // color: Colors.amberAccent,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1, // 20%
                            child: Container()),
                        Expanded(
                          flex: 2, // 20%
                          child: Container(
                            width: 50,
                            height: 200,
                            // color: Colors.red,
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (builder) => bottomSheet8());
                              },
                              child: Row(
                                children: [
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        iconPic8(),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        AppText(
                                            text: "Picture",
                                            size: 16,
                                            color: Colors.white),
                                        // AppText(
                                        //     text: "one",
                                        //     size: 16,
                                        //     color: Colors.white),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),



                      ],

                    ),

                  ),

                  Container(
                    child: Column(
                      children: [

                        // // AppText(text: 'Service is coming soon!', color: Colors.white, size: 30,),
                        // userInput(nameController, 'Enter name', TextInputType.number,
                        //     Icons.supervised_user_circle),

                        SizedBox(height: 10,),
                        uploadAdditionalButton(Colors.green, 'Upload file', Colors.white, context),
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

          if (_dropDownValueChoice == null) {
            submitionError(context, 'Please select what your uploading');
          }else if(_additionalFileProfilePic == null){
            submitionError(context, 'Please take a picture of your file.');
          }else {
            sendInfo(_dropDownValueChoice.toString(), _additionalFileProfilePic!.path.toString(), widget.id ,widget.token);
          }
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
  //################### For additional documents ##########################
  void takePhoto8(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _additionalFileProfilePic = pickedFile!;
    });
  }

  Widget iconPic8() {
    return Stack(
      children: <Widget>[
        CircleAvatar(
          radius: 40.0,
          backgroundImage: _additionalFileProfilePic == null
              ? AssetImage("assets/images/pic_1.png") as ImageProvider
              : FileImage(File(_additionalFileProfilePic!.path)),
        ),
        Positioned(
            bottom: 10.0,
            right: 8.0,
            child: Icon(Icons.camera_alt, color: Colors.amber, size: 28.0)),
      ],
    );
  }
//############################################################################

  //################### bottomSheet for take photo #############

  Widget bottomSheet8() {
    return Container(
      width: 200,
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(children: <Widget>[
        Text(
          "Upload your file",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              label: Text("Camera"),
              onPressed: () {
                takePhoto8(ImageSource.camera);
              },
            ),
            // FlatButton.icon(
            //   icon: Icon(Icons.image),
            //   label: Text("Gallary"),
            //   onPressed: () {
            //     takePhoto3(ImageSource.gallery);
            //   },
            // ),
          ],
        )
      ]),
    );
  }
//###############################################################






  sendInfo(String choice, String pic, String id, String token ) async {


    if (choice == 'ID / passport' ){
      choice = 'scanned_id_or_passport';
    }else if(choice == 'profile photo'){
      choice = 'profile_photo';
    }else if(choice == 'proof of residence'){
      choice = 'proof_of_residence';
    }
    print(choice);
    print(pic);
    print(id);



    try{

      String url = "https://payments.agribank.co.zw/api/customers_update";
      print(url);
      var postUri = Uri.parse(url);

      http.MultipartRequest request = new http.MultipartRequest("POST", postUri);

      request.headers['Accept'] = 'application/json';
      request.headers['Authorization'] = 'Bearer ' + token;

        request.fields["document"] = choice;
        request.fields["legal"] = id;

      request.files.addAll([
        http.MultipartFile.fromBytes(
          'document_upload',
          File(pic).readAsBytesSync(),
          filename: pic,
        ),

      ]);

      var streamedResponse = await request.send().timeout(const Duration(seconds: 25));

      var response = await http.Response.fromStream(streamedResponse);

      print(response.statusCode);
      //print(token);
      //print(response.body);

      var responseData = json.decode(response.body);

      print(responseData);

      if (responseData['result'] == "success"){
        uploadSuccessAlert(context, "Your " + choice + "  has been successfully uploaded to " + responseData['updated_record'] + " records.", token);
      }else{
        submitionError(context, "We cant upload your " + choice + " at the moment. Please try later.");
      }


    } on Exception catch (exception) {
      submitionError(context, "Failed to check your record, The ID you provided might not exist in our records, or there is poor internet connection.");

    } catch (error) {
      submitionError(context, "Failed to get your balance, this can be due to poor internet connection. Please check your network connection!");

    }
  //   // Navigator.of(context).push(MaterialPageRoute(builder: (_) {
  //   //   return LandingScreen();
  //   // }));
   }


}
