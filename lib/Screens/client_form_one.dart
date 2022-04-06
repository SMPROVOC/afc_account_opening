import 'package:flutter/material.dart';
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

class ClientFormOne extends StatefulWidget {
  static const routeName = '/client-form-one';
  //const ClientFormOne({Key? key}) : super(key: key);

  final String token;

  ClientFormOne({
    required this.token,

  });

  @override
  State<ClientFormOne> createState() => _ClientFormOneState();
}

class _ClientFormOneState extends State<ClientFormOne> {
  final accountTypeController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final middleNamesController = TextEditingController();
  final contactNumberController = TextEditingController();
  final dobController = TextEditingController();
  DateTime date = DateTime(2005, 01, 01);
  String? _dropDownValueAccType;
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

                  Container(
                    width: 300,
                    padding: EdgeInsets.only(left: 16, right: 16),
                    // color: Colors.grey,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Colors.white54),
                    child: DropdownButton(
                      hint: _dropDownValueAccType == null
                          ? Text('Account Type', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                          : Text(
                              _dropDownValueAccType!,
                              style: TextStyle(color: Colors.black, fontSize: 18,),
                            ),

                      isExpanded: true,
                      iconSize: 30.0,
                      style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold),
                      items: ['Flexi-Cash account'].map(
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
                            _dropDownValueAccType = val as String?;
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
                        color: Colors.white70),
                    child: DropdownButton(
                      hint: _dropDownValueTitle == null
                          ? Text('Title', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                          : Text(
                        _dropDownValueTitle!,
                        style: TextStyle(color: Colors.black, fontSize: 18,),
                      ),

                      isExpanded: true,
                      iconSize: 30.0,
                      style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold),
                      items: ['Mr', 'Mrs', 'Ms', 'Dr', 'Prof'].map(
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
                            _dropDownValueTitle = val as String?;
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),

                  userInput(lastNameController, 'Last name (Mukodzi)', TextInputType.text,
                      Icons.supervised_user_circle),
                  userInput(middleNamesController, 'Middle names (Optional)', TextInputType.text,
                      Icons.supervised_user_circle),
                  userInput(firstNameController, 'First name (Kudzai)',
                      TextInputType.text, Icons.supervised_user_circle),

                  userInput(contactNumberController, 'Contact number (263***)',
                      TextInputType.number, Icons.call),

                  ElevatedButton(
                    onPressed: () async {
                      DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: date,
                          firstDate: DateTime(1910),
                          lastDate: DateTime(2300));

                      //if (newDate == null) return;

                      if (newDate == null) return;

                      setState(() => date = newDate);

                      setState(() => _dobController =  newDate);
                      // setState(() => dk = formatter.format(newDate).toString());
                      setState(() => dk = "${newDate.year}-${newDate.month}-${newDate.day}");
                    },
                    child: Text(dk == null ? 'Select date of birth' : dk.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 45, vertical: 16),

                      primary: Colors.white70,
                      onPrimary: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // userInput(citizenshipController, 'Citizenship',
                  //     TextInputType.text, Icons.verified_user),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // Center(
                  //   child: AppText(
                  //     text: 'Page 1 of 4',
                  //     color: Colors.green,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 20,
                  // ),
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
                              toRequirementsButton(
                                  Colors.green, 'Sign In', Colors.white, context, widget.token),
                              toFormTwoButton(
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

  Widget toFormTwoButton(
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
          // Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
          //   return ClientFormTwo();
          // }));

          if (firstNameController.text.isEmpty) {
            submitionError(context, "Please input your first name!!");
          } else if (lastNameController.text.isEmpty) {
            submitionError(context, "Please input your surname!!");
          } else if (contactNumberController.text.isEmpty) {
            submitionError(context, "Please input your contact number!!");
          } else if (_dropDownValueTitle == null) {
            submitionError(context, "Please select your title!!");
          } else if (_dropDownValueAccType == null) {
            submitionError(context, "Please choose an account type");
          } else if (_dobController == null) {
            submitionError(context, "Please choose a date of birth");
          }else if(contactNumberController.text.length >12) {
            submitionError(context, "Your phone number has too many numbers.");
          }else if(contactNumberController.text.length <12){
            submitionError(context, "Your phone number is missing some digits. Make sure you begin with 263*********");
          }else if (contactNumberController.text.substring(0, 3) != "263"){
            submitionError(context, "Your phone number must begin with 263*********.");
    } else {

            Navigator.push(
                ctx,
                MaterialPageRoute(
                  builder: (context) => ClientFormTwo(
                    dropDownValueAccType: _dropDownValueTitle.toString(),
                    dropDownValueTitle: _dropDownValueTitle.toString(),
                    firstNameController: firstNameController.text,
                    middleNameController: middleNamesController.text,
                    lastNameController: lastNameController.text,
                    contactNumberController: contactNumberController.text,
                    dobController: _dobController.toString(),
                    token: widget.token,

                  ),
                ));
          }
        },
        child: Icon(
          Icons.keyboard_arrow_right_outlined,
          size: 40,
          color: Colors.white70,
        ),
      ),
    );
  }
}
