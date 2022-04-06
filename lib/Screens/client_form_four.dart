import 'package:flutter/material.dart';
import 'package:pb/widgets/text_input.dart';
import 'package:pb/widgets/responsive_button.dart';
import 'package:pb/widgets/popup.dart';
import 'package:pb/widgets/app_text.dart';
import 'package:pb/widgets/app_large_text.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'client_form_one.dart';

class ClientFormFour extends StatefulWidget {
  static const routeName = '/client-form-four';
  //const ClientFormFour({Key? key}) : super(key: key);

  final String dropDownValueAccType;
  final String firstNameController;
  final String middleNameController;
  final String lastNameController;
  final String contactNumberController;
  final String dobController;
  final String citizenshipController;
  final String gender;
  final String marritalStatus;
  final String nationalId;
  final String nextOfKeen;
  final String countryOfBirth;
  //final String houseNumber;
  final String addressLocation;
  //final String city;
  final String grossIcome;
  final String email;
  final String occupation;
  final String token;
  final String sourceOfIncome;

  ClientFormFour({
    required this.dropDownValueAccType,
    required this.firstNameController,
    required this.lastNameController,
    required this.contactNumberController,
    required this.dobController,
    required this.citizenshipController,
    required this.gender,
    required this.marritalStatus,
    required this.nationalId,
    required this.nextOfKeen,
    required this.countryOfBirth,
    //required this.houseNumber,
    required this.addressLocation,
    //required this.city,
    required this.grossIcome,
    required this.email,
    required this.occupation,
    required this.token,
    required this.middleNameController,
    required this.sourceOfIncome,
  });

  @override
  State<ClientFormFour> createState() => _ClientFormFourState();
}

class _ClientFormFourState extends State<ClientFormFour> {
  bool isLoading = false;
  PickedFile? _imageFileProfilePic;
  PickedFile? _imageFileAdditionalDoc;
  PickedFile? _imageFileScannedIdOrPassport;
  PickedFile? _imageProofOfResidence;
  PickedFile? _imageSignature;
  final _picker = ImagePicker();
  String? _dropDownValue;
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
        child: Card(
          // margin: EdgeInsets.all(30),
          margin: EdgeInsets.fromLTRB(10, 50, 10, 30),
          color: Colors.white70,
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Padding(
              padding: EdgeInsets.only(left: 8, bottom: 23, right: 8, top: 5),
              child: Column(

                children: [
                  Expanded(
                    child: Text('Demo', style: TextStyle(color: Colors.transparent),),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 200,
                    // color: Colors.amberAccent,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1, // 20%
                            child: Container()),
                        Expanded(
                          flex: 3, // 20%
                          child: Container(
                            width: 50,
                            height: 200,
                            // color: Colors.red,
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (builder) => bottomSheet());
                              },
                              child: Row(
                                children: [
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        iconPic(),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        AppText(
                                            text: "Profile",
                                            size: 16,
                                            color: Colors.black),
                                        AppText(
                                            text: "photo",
                                            size: 16,
                                            color: Colors.black),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3, // 20%
                          child: Container(
                            width: 50,
                            height: 200,
                            // color: Colors.grey,
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (builder) => bottomSheet2());
                              },
                              child: Row(
                                children: [
                                  Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center, //Center Column contents vertically,
                                      //Center Column contents horizontally,
                                      children: [
                                        iconPic2(),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        AppText(
                                            text: "Passport",
                                            size: 16,
                                            color: Colors.black),
                                        AppText(
                                            text: "or ID photo",
                                            size: 16,
                                            color: Colors.black),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3, // 20%
                          child: Container(
                            width: 50,
                            height: 200,
                            // color: Colors.red,
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (builder) => bottomSheet5());
                              },
                              child: Row(
                                children: [
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        iconPic5(),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        AppText(
                                            text: "Upload proof",
                                            size: 16,
                                            color: Colors.black),
                                        AppText(
                                            text: "of residence",
                                            size: 16,
                                            color: Colors.black),
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
                    width: double.maxFinite,
                    height: 200,
                    // color: Colors.amberAccent,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1, // 20%
                            child: Container()),

                        Expanded(
                          flex: 3, // 20%
                          child: Container(
                            width: 50,
                            height: 200,
                            // color: Colors.grey,
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (builder) => bottomSheet6());
                              },
                              child: Row(
                                children: [
                                  Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center, //Center Column contents vertically,
                                      //Center Column contents horizontally,
                                      children: [
                                        iconPic6(),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        AppText(
                                            text: "Upload",
                                            size: 16,
                                            color: Colors.black),
                                        AppText(
                                            text: "signature",
                                            size: 16,
                                            color: Colors.black),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3, // 20%
                          child: Container(
                            width: 50,
                            height: 200,
                            // color: Colors.red,
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (builder) => bottomSheet7());
                              },
                              child: Row(
                                children: [
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        iconPic7(),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        AppText(
                                            text: "Additional",
                                            size: 16,
                                            color: Colors.black),
                                        AppText(
                                            text: "files",
                                            size: 16,
                                            color: Colors.black),
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




                  AppText(
                    text: 'Page 4 of 4',
                    color: Colors.green,
                  ),
                  SizedBox(
                    height: 20,
                  ),

                    Padding(
                      padding: EdgeInsets.only(top: 1.0),
                      child: Wrap(
                        spacing: 130,
                        children: [
                          backButton(
                              Colors.green, 'Sign In', Colors.white, context),
                          sendInfoButton(
                              Colors.green, 'Sign In', Colors.white, context),
                        ],
                      ),
                    ),

                  Expanded(
                    child: Text('Demo', style: TextStyle(color: Colors.transparent),),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //################### For profile picture ##########################
  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _imageFileProfilePic = pickedFile!;
    });
  }

  Widget iconPic() {
    return Stack(
      children: <Widget>[
        CircleAvatar(
          radius: 40.0,
          backgroundImage: _imageFileProfilePic == null
              ? AssetImage("assets/images/pic_1.png") as ImageProvider
              : FileImage(File(_imageFileProfilePic!.path)),
        ),
        Positioned(
            bottom: 10.0,
            right: 8.0,
            child: Icon(Icons.camera_alt, color: Colors.amber, size: 28.0)),
      ],
    );
  }
//############################################################################

  //################### For scanned Id or passport ##########################
  void takePhoto2(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _imageFileScannedIdOrPassport = pickedFile!;
    });
  }

  Widget iconPic2() {
    return Stack(
      children: <Widget>[
        CircleAvatar(
          radius: 40.0,
          backgroundImage: _imageFileScannedIdOrPassport == null
              ? AssetImage("assets/images/pic_1.png") as ImageProvider
              : FileImage(File(_imageFileScannedIdOrPassport!.path)),
        ),
        Positioned(
            bottom: 10.0,
            right: 8.0,
            child: Icon(Icons.camera_alt, color: Colors.amber, size: 28.0)),
      ],
    );
  }
//############################################################################

  //################### For additional documents ##########################
  void takePhoto3(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _imageFileAdditionalDoc = pickedFile!;
    });
  }

  Widget iconPic3() {
    return Stack(
      children: <Widget>[
        CircleAvatar(
          radius: 40.0,
          backgroundImage: _imageFileAdditionalDoc == null
              ? AssetImage("assets/images/pic_1.png") as ImageProvider
              : FileImage(File(_imageFileAdditionalDoc!.path)),
        ),
        Positioned(
            bottom: 10.0,
            right: 8.0,
            child: Icon(Icons.camera_alt, color: Colors.amber, size: 28.0)),
      ],
    );
  }
//############################################################################

  //################### For additional documents ##########################
  void takePhoto5(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _imageProofOfResidence = pickedFile!;
    });
  }

  Widget iconPic5() {
    return Stack(
      children: <Widget>[
        CircleAvatar(
          radius: 40.0,
          backgroundImage: _imageProofOfResidence == null
              ? AssetImage("assets/images/pic_1.png") as ImageProvider
              : FileImage(File(_imageProofOfResidence!.path)),
        ),
        Positioned(
            bottom: 10.0,
            right: 8.0,
            child: Icon(Icons.camera_alt, color: Colors.amber, size: 28.0)),
      ],
    );
  }
//############################################################################


  //################### For additional documents ##########################
  void takePhoto6(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _imageSignature = pickedFile!;
    });
  }

  Widget iconPic6() {
    return Stack(
      children: <Widget>[
        CircleAvatar(
          radius: 40.0,
          backgroundImage: _imageSignature == null
              ? AssetImage("assets/images/pic_1.png") as ImageProvider
              : FileImage(File(_imageSignature!.path)),
        ),
        Positioned(
            bottom: 10.0,
            right: 8.0,
            child: Icon(Icons.camera_alt, color: Colors.amber, size: 28.0)),
      ],
    );
  }
//############################################################################

  //################### For additional documents ##########################
  void takePhoto7(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _imageFileAdditionalDoc = pickedFile!;
    });
  }

  Widget iconPic7() {
    return Stack(
      children: <Widget>[
        CircleAvatar(
          radius: 40.0,
          backgroundImage: _imageFileAdditionalDoc == null
              ? AssetImage("assets/images/pic_1.png") as ImageProvider
              : FileImage(File(_imageFileAdditionalDoc!.path)),
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

  Widget bottomSheet() {
    return Container(
      width: 200,
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(children: <Widget>[
        Text(
          "Choose Profile Photo",
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
                takePhoto(ImageSource.camera);
              },
            ),
            // FlatButton.icon(
            //   icon: Icon(Icons.image),
            //   label: Text("Gallary"),
            //   onPressed: () {
            //     takePhoto(ImageSource.gallery);
            //   },
            // ),
          ],
        )
      ]),
    );
  }
  //###############################################################

//################### bottomSheet for take photo #############

  Widget bottomSheet2() {
    return Container(
      width: 200,
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(children: <Widget>[
        Text(
          "Choose Profile Photo",
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
                takePhoto2(ImageSource.camera);
              },
            ),
            // FlatButton.icon(
            //   icon: Icon(Icons.image),
            //   label: Text("Gallary"),
            //   onPressed: () {
            //     takePhoto2(ImageSource.gallery);
            //   },
            // ),
          ],
        )
      ]),
    );
  }
//###############################################################

//################### bottomSheet for take photo #############

  Widget bottomSheet3() {
    return Container(
      width: 200,
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(children: <Widget>[
        Text(
          "Choose Profile Photo",
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
                takePhoto3(ImageSource.camera);
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


  //################### bottomSheet for take photo #############

  Widget bottomSheet5() {
    return Container(
      width: 200,
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(children: <Widget>[
        Text(
          "Upload proof of residence",
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
                takePhoto5(ImageSource.camera);
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

  //################### bottomSheet for take photo #############

  Widget bottomSheet6() {
    return Container(
      width: 200,
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(children: <Widget>[
        Text(
          "Upload your signature",
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
                takePhoto6(ImageSource.camera);
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


  //################### bottomSheet for take photo #############

  Widget bottomSheet7() {
    return Container(
      width: 200,
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(children: <Widget>[
        Text(
          "Upload your additional files",
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
                takePhoto7(ImageSource.camera);
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



  submitCustomerData(String title, String first_name, String middle_name, String last_name, String gender, String marital_status, String full_address, var date_of_birth,
      String msisdn, String country_of_birth, var citizenship, String ocupation, String gross_income, String sourceOfIncome, String contact_person, String legal,
      String description, var proPicPath, var scannedDocPath, var proofOfResidencePath, var signaturePath, var additionalDocPath, String token) async {
    try {

    //var postUri = Uri.parse("http://192.168.0.41:9999/api/customers");
    var postUri = Uri.parse("https://payments.agribank.co.zw/api/customers");
//var filePath = "images/original.png";

    //String gen = "Null"; // for gender

    // if (gender == 3){
    //   gen = "male";
    // }else if (gender == 4){
    //   gen = "female";
    // }else{
    //   gen = "Null";
    // }


    // if (marital_status == 5){
    //   maritalStatus = "single";
    // }else if (marital_status == 6){
    //   maritalStatus = "married";
    // }else{
    //   maritalStatus = "Null";
    // }

      if (middle_name.isEmpty){
        middle_name = "";
      }

    DateFormat dateFormat = DateFormat("yyyy-MM-dd");

    //String dt = dateFormat.format(date_of_birth);



    http.MultipartRequest request = new http.MultipartRequest("POST", postUri);

    request.headers['Accept'] = 'application/json';
    request.headers['Authorization'] = 'Bearer ' + token;


    request.fields["title"] = title;
    request.fields["first_name"] = first_name + " " + middle_name;
    //request.fields["middle_name"] = middle_name;
      request.fields["source_of_funds"] = sourceOfIncome;
    request.fields["last_name"] = last_name;
    request.fields["gender"] = gender;
    request.fields["marital_status"] = marital_status;
    request.fields["full_address"] = full_address;
    request.fields["date_of_birth"] = date_of_birth;
    request.fields["msisdn"] = msisdn;
    request.fields["country_of_birth"] = country_of_birth;
    request.fields["citizenship"] = citizenship;
    request.fields["ocupation"] = ocupation;
    request.fields["gross_income"] = gross_income;
    request.fields["contact_person"] = contact_person;
    request.fields["legal"] = legal;
    request.fields["description"] = description;
    request.fields["branch_code"] = 'ZW000040';

    request.files.addAll([
      http.MultipartFile.fromBytes(
        'profile_photo',
        File(proPicPath).readAsBytesSync(),
        filename: proPicPath,
      ),
      http.MultipartFile.fromBytes(
        'scanned_id_or_passport',
        File(scannedDocPath).readAsBytesSync(),
        filename: scannedDocPath,
      ),

      http.MultipartFile.fromBytes(
        'proof_of_residence',
        File(proofOfResidencePath).readAsBytesSync(),
        filename: proofOfResidencePath,
      ),
      http.MultipartFile.fromBytes(
        'signature',
        File(signaturePath).readAsBytesSync(),
        filename: signaturePath,
      ),
      // http.MultipartFile.fromBytes(
      //   'additional_document',
      //   File(additionalDocPath).readAsBytesSync(),
      //   filename: additionalDocPath,
      // ),
    ]);



    var streamedResponse = await request.send().timeout(const Duration(seconds: 25));

    var response = await http.Response.fromStream(streamedResponse);

    print(response.statusCode);
    print(response.body);

    var responseData = json.decode(response.body);

    print(responseData);
    //Creating a list to store input data;


    print(responseData['message']);


    var res = responseData['message'];
     // var res = 'ok';



    String country_code= msisdn.substring(0,3);

    // msisdn = '263777777777';
    // gender = "male";
    // maritalStatus = 'Single';
    // print(msisdn.length);

    if (first_name.isEmpty){
      res = "null";
    }else if(last_name.isEmpty) {
      res = "null";
    }else if(gender.isEmpty) {
      res = "null";
    }else if(marital_status.isEmpty){
      res = "null";
    }else if(full_address.isEmpty){
      res = "null";
    }else if(date_of_birth == null){
      res = "null";
    }else if(msisdn.isEmpty){
      res = "null";
    }else if(country_of_birth.isEmpty){
      res = "null";
    }else if(citizenship == null){
      res = "null";
    }else if(ocupation.isEmpty){
      res = "null";
    }else if(gross_income.isEmpty) {
      res = "null";
    }else if(contact_person.isEmpty){
      res = "null";
    }else if(legal.isEmpty){
      res = "null";
    }else if(description.isEmpty){
      res = "null";
    }else if(proPicPath == null){
      res = "null";
    }else if(scannedDocPath == null){
      res = "null";
    }else if(proofOfResidencePath == null){
      res = "null";
    }else if(signaturePath == null){
      res = "null";
    }else if(country_code != "263") {
      submitionError(
          context, "Your contact number must be in the format 263*********");
      res = "null";
    }else if(msisdn.length < 12){
      submitionError(context, "Your contact number is short in numbers check it again!");
      res = "null";
    }else if(msisdn.length > 12){
      submitionError(context, "Your contact number has too many numbers check it again!");
      res = "null";
    };


    int contact_number = int.parse(msisdn);
    int income = int.parse(gross_income);

    // print(title);
    // print(first_name);
    // print(last_name);
    // print(gender);
    // print(marital_status);
    // print(full_address);
    // print(date_of_birth);
    // print(contact_number);
    // print(country_of_birth);
    // print(citizenship);
    // print(ocupation);
    // print(income);
    // print(contact_person);
    // print(legal);
    // print(description);
    // print(proPicPath);
    // print(scannedDocPath.runtimeType);
    // print(additionalDocPath);



    if (res == "Successfully Posted") { // Successfully Posted

      setState(() {
        isLoading = false;
        submitSuccessAlert(context,
            "Information is successfully sumbitted!", token);
        isLoading = false;
        // Timer(Duration(seconds: 3), () {
        //   Navigator.pushAndRemoveUntil(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => ClientFormOne(token: token,)
        //     ),
        //         (route) => false,
        //   );
        // });

      });

      // firstNameController.clear();
      // lastNameController.clear();
      // _value =  1;
      // _value2 = 1;
      // fullAddressController.clear();
      // _dobController = null;
      // contactNumberController.clear();
      // countryOfBirthController.clear();
      // _dropDownValue = null;
      // occupationController.clear();
      // grossIcomeController.clear();
      // contactPersonController.clear();
      // nationalIdController.clear();
      // descriptionController.clear();
      // _imageFileProfilePic = null;
      // _imageFileScannedIdOrPassport = null;
      // _imageFileAdditionalDoc = null;


    }else if (res == "Failed to Upload Customer KYC Details, Possible Duplicate"){
      submitionError(context, 'Possible Duplication of record in system. Verify if this record does not already exist with AFC.');
      setState(() {
        isLoading = false;
      });

    }else{
      submitionError(context, res);
      setState(() {
        isLoading = false;
      });
    }


    } on Exception catch (exception) {
    submitionError(context, "Information could not be submitted. Please check your network connection!");
    setState(() {
      isLoading = false;
    });
    } catch (error) {
    submitionError(context, "Information could not be submitted. Please check your network connection!");
    setState(() {
      isLoading = false;
    });
    }

  }


  Widget sendInfoButton(
      Color buttonColor, String title, Color textColor, BuildContext ctx) {
    return Container(
      height: 60,
      width: 80,
      // color: Colors.red,
      padding: const EdgeInsets.only(top: 2, left: 2, right: 4),
      child: RaisedButton(
        elevation: 0,
        shape: CircleBorder(),
        color: buttonColor,
        onPressed: () {
          setState(() {
            isLoading = true;
          });


          //String addr = widget.houseNumber + " " + widget.addressLocation + " " + widget.city;

          if (_imageFileProfilePic == null){

              submitionError(context, 'You must provide your Profile photo');
              setState(() {
              isLoading = false;
              });

            }else if (_imageFileScannedIdOrPassport == null){
            submitionError(context, 'You must provide your passport or national ID photo');
            setState(() {
              isLoading = false;
            });

          }else if (_imageProofOfResidence == null){
            submitionError(context, 'You must provide your proof of residence.');
            setState(() {
              isLoading = false;
            });

          }else if (_imageSignature == null){
            submitionError(context, 'You must provide your signature');
            setState(() {
              isLoading = false;
            });

          }else{

            if (_imageFileAdditionalDoc == null){
              _imageFileAdditionalDoc = _imageFileScannedIdOrPassport;
            }

          submitCustomerData(widget.dropDownValueAccType ,widget.firstNameController, widget.middleNameController,widget.lastNameController, widget.gender, widget.marritalStatus, widget.addressLocation, widget.dobController,
              widget.contactNumberController, widget.countryOfBirth, widget.citizenshipController, widget.occupation, widget.grossIcome, widget.sourceOfIncome,
              widget.nextOfKeen, widget.nationalId, widget.email, _imageFileProfilePic!.path.toString(),
              _imageFileScannedIdOrPassport!.path.toString(), _imageProofOfResidence!.path.toString(), _imageSignature!.path.toString(),_imageFileAdditionalDoc!.path.toString(),  widget.token);

    }
          // Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
          //   return ClientFormOne();
          // }));

        },
        child: isLoading
          ? CircularProgressIndicator(
          color: Colors.white
        ) : Icon(
          Icons.upload_file,
          size: 40,
          color: Colors.white70,
        ),
      ),
    );
  }
}
