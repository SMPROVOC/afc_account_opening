import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pb/widgets/text_input.dart';
import 'package:pb/widgets/responsive_button.dart';
import 'package:pb/widgets/app_text.dart';
import 'package:pb/widgets/popup.dart';
import 'package:pb/widgets/app_large_text.dart';
import 'package:pb/Screens/client_form_one.dart';
import 'package:pb/Screens/client_form_two.dart';
import 'package:pb/Screens/client_form_three.dart';
import 'package:pb/Screens/client_form_four.dart';
import 'package:intl/intl.dart';

class OverDraftScreenOne extends StatefulWidget {
  static const routeName = '/client-form-one';
  //const OverDraftScreenOne({Key? key}) : super(key: key);

  final String token;

  OverDraftScreenOne({
    required this.token,

  });

  @override
  State<OverDraftScreenOne> createState() => _OverDraftScreenOneState();
}

class _OverDraftScreenOneState extends State<OverDraftScreenOne> {
  bool isLoading = false;
  final loan_amount = TextEditingController();
  final loan_tenure = TextEditingController();
  final account_number = TextEditingController();
  PickedFile? _imageSignaturePic;
  final _picker = ImagePicker();

  DateTime date = DateTime(2005, 01, 01);
  String? _dropDownValueTenure;
  String? _dropDownValueTitle;
  late DateTime? _dobController;
  String? dk;
  final DateFormat formatter = DateFormat('yyyy-MM-dd');


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

          //margin: EdgeInsets.all(30),
          margin: EdgeInsets.fromLTRB(10, 50, 10, 30),
          color: Colors.white70,
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Padding(
              padding: EdgeInsets.only(left: 8, bottom: 23, right: 8, top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Text('Demo', style: TextStyle(color: Colors.transparent),),
                  ),



                  // SizedBox(height: 20,),
                  //
                  // Container(
                  //   width: 300,
                  //   padding: EdgeInsets.only(left: 16, right: 16),
                  //   // color: Colors.grey,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.all(Radius.circular(8)),
                  //       color: Colors.white70),
                  //   child: DropdownButton(
                  //     hint: _dropDownValueTitle == null
                  //         ? Text('Title', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                  //         : Text(
                  //       _dropDownValueTitle!,
                  //       style: TextStyle(color: Colors.black, fontSize: 18,),
                  //     ),
                  //
                  //     isExpanded: true,
                  //     iconSize: 30.0,
                  //     style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold),
                  //     items: ['Mr', 'Mrs', 'Ms', 'Dr', 'Prof'].map(
                  //           (val) {
                  //         return DropdownMenuItem<String>(
                  //           value: val,
                  //           child: Text(val),
                  //         );
                  //       },
                  //     ).toList(),
                  //     onChanged: (val) {
                  //       setState(
                  //             () {
                  //           _dropDownValueTitle = val as String?;
                  //         },
                  //       );
                  //     },
                  //   ),
                  // ),
                  // SizedBox(height: 20),
                  userInput(account_number, 'Account number',
                      TextInputType.number, Icons.account_box),
                  userInput(loan_amount, 'Amount',
                      TextInputType.number, Icons.money),
                  // userInput(loan_tenure, 'Tenure (period)', TextInputType.number,
                  //     Icons.watch),

                  Container(
                    width: 300,
                    padding: EdgeInsets.only(left: 16, right: 16),
                    // color: Colors.grey,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Colors.white54),
                    child: DropdownButton(
                      hint: _dropDownValueTenure == null
                          ? Text('Tenure (period)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                          : Text(
                        _dropDownValueTenure!,
                        style: TextStyle(color: Colors.black, fontSize: 18,),
                      ),

                      isExpanded: true,
                      iconSize: 30.0,
                      style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold),
                      items: ['2 months', '4 months', '6 months', '8 months',].map(
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
                            _dropDownValueTenure = val as String?;
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20,),


                  Container(
                      // width: 50,
                      // height: 200,
                    width: double.maxFinite,
                    // color: Colors.amber,color: Colors.amber,
                    // height: double.maxFinite,
                      // color: Colors.grey,
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (builder) => bottomSheet4());
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment
                              .center,
                          children: [
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .center,

                                //Center Column contents vertically,
                                //Center Column contents horizontally,
                                children: [
                                  iconPic4(),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  AppText(
                                      text: "Upload",
                                      size: 16,
                                      color: Colors.black),
                                  AppText(
                                      text: "Signature",
                                      size: 16,
                                      color: Colors.black),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),



                  //
                  // ElevatedButton(
                  //   onPressed: () async {
                  //     DateTime? newDate = await showDatePicker(
                  //         context: context,
                  //         initialDate: date,
                  //         firstDate: DateTime(1910),
                  //         lastDate: DateTime(2300));
                  //
                  //     //if (newDate == null) return;
                  //
                  //     if (newDate == null) return;
                  //
                  //     setState(() => date = newDate);
                  //
                  //     setState(() => _dobController =  newDate);
                  //     // setState(() => dk = formatter.format(newDate).toString());
                  //     setState(() => dk = "${newDate.year}-${newDate.month}-${newDate.day}");
                  //   },
                  //   child: Text(dk == null ? 'Select date of birth' : dk.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  //   style: ElevatedButton.styleFrom(
                  //     padding:
                  //     EdgeInsets.symmetric(horizontal: 45, vertical: 16),
                  //
                  //     primary: Colors.white70,
                  //     onPrimary: Colors.black,
                  //   ),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  // userInput(citizenshipController, 'Citizenship',
                  //     TextInputType.text, Icons.verified_user),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: AppText(
                      text: 'Page 1 of 1',
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Center(
                          child: Wrap(
                            spacing: 160,
                            children: [
                              backToWelcomeButton(
                                  Colors.green, 'Sign In', Colors.white, context, widget.token),
                             sendODButton(
                                  Colors.green, 'Sign In', Colors.white, context)
                            ],
                          ),
                        ),
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

  Widget sendODButton(
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

          if (account_number.text.isEmpty){
            submitionError(context, "Please provide your account number.");
          }else if (account_number.text.length < 12){
            submitionError(context, "Your account number is missing some digits");
          }else if (account_number.text.length > 12){
            submitionError(context, "Your account number is too long.");
          }else if (loan_amount.text.isEmpty){
            submitionError(context, "Please provide the amount you wish to overdraw");
          }else if (_dropDownValueTenure == null){
            submitionError(context, "Please pick your overdraft tenure.");
          }else if (_imageSignaturePic == null){
            submitionError(context, "Please upload your signature picture.");
          }else{
            setState(() {
              isLoading = true;
            });
            submitODdata(account_number.text, loan_amount.text, _dropDownValueTenure.toString(), _imageSignaturePic!.path.toString());
          }




          //String addr = widget.houseNumber + " " + widget.addressLocation + " " + widget.city;
          //
          // if (_imageFileProfilePic == null){
          //
          //   submitionError(context, 'You must provide your Profile photo');
          //   setState(() {
          //     isLoading = false;
          //   });
          //
          // }else if (_imageFileScannedIdOrPassport == null){
          //   submitionError(context, 'You must provide your passport or national ID photo');
          //   setState(() {
          //     isLoading = false;
          //   });
          //
          //
          // }else{
          //
          //   if (_imageFileAdditionalDoc == null){
          //     _imageFileAdditionalDoc = _imageFileScannedIdOrPassport;
          //   }
          //
          //   submitCustomerData(widget.dropDownValueAccType ,widget.firstNameController, widget.lastNameController, widget.gender, widget.marritalStatus, addr, widget.dobController,
          //       widget.contactNumberController, widget.countryOfBirth, widget.citizenshipController, widget.occupation, widget.grossIcome,
          //       widget.nextOfKeen, widget.nationalId, widget.email, _imageFileProfilePic!.path.toString(),
          //       _imageFileScannedIdOrPassport!.path.toString(), _imageFileAdditionalDoc!.path).toString();
          //
          // }
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

  submitODdata(String account, String amount, String tenure, var signatureImg)async {
    print(account);
    print(amount);
    print(tenure.substring(0, 1));
    print(signatureImg);
    

    Timer(Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }


  //################### bottomSheet for take photo #############

  Widget bottomSheet4() {
    return Container(
      width: 200,
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(children: <Widget>[
        Text(
          "Upload Signature",
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
                takePhoto4(ImageSource.camera);
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

  //################### For signature upload ##########################
  void takePhoto4(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _imageSignaturePic = pickedFile!;
    });
  }

  Widget iconPic4() {
    return Stack(
      children: <Widget>[
        CircleAvatar(
          radius: 40.0,
          backgroundImage: _imageSignaturePic == null
              ? AssetImage("assets/images/pic_1.png") as ImageProvider
              : FileImage(File(_imageSignaturePic!.path)),
        ),
        Positioned(
            bottom: 10.0,
            right: 8.0,
            child: Icon(Icons.camera_alt, color: Colors.amber, size: 28.0)),
      ],
    );
  }
//############################################################################


}

