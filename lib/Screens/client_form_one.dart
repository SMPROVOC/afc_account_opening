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

class ClientFormOne extends StatefulWidget {
  static const routeName = '/client-form-one';
  const ClientFormOne({Key? key}) : super(key: key);

  @override
  State<ClientFormOne> createState() => _ClientFormOneState();
}

class _ClientFormOneState extends State<ClientFormOne> {
  final accountTypeController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final contactNumberController = TextEditingController();
  final dobController = TextEditingController();
  final citizenshipController = TextEditingController();
  DateTime date = DateTime(2005, 01, 01);
  String? _dropDownValueAccType;
  late DateTime? _dobController;

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
          margin: EdgeInsets.all(30),
          color: Colors.transparent,
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Padding(
              padding: EdgeInsets.only(left: 8, bottom: 23, right: 8, top: 5),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 300,
                    // color: Colors.grey,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Colors.white54),
                    child: DropdownButton(
                      hint: _dropDownValueAccType == null
                          ? Text('Account Type')
                          : Text(
                              _dropDownValueAccType!,
                              style: TextStyle(color: Colors.black),
                            ),
                      isExpanded: true,
                      iconSize: 30.0,
                      style: TextStyle(color: Colors.green),
                      items: ['Zimbabwean', 'South African', 'Other'].map(
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
                  SizedBox(height: 20),
                  userInput(firstNameController, 'First name',
                      TextInputType.text, Icons.verified_user),
                  userInput(lastNameController, 'Last name', TextInputType.text,
                      Icons.verified_user),
                  userInput(contactNumberController, 'Contact number',
                      TextInputType.text, Icons.verified_user),
                  Text(
                    '${date.year}/${date.month}/${date.year}',
                  ),
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

                      setState(() => _dobController = newDate);
                    },
                    child: Text('Select date of birth'),
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 85, vertical: 16),
                      primary: Colors.white54,
                      onPrimary: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  userInput(citizenshipController, 'Citizenship',
                      TextInputType.text, Icons.verified_user),
                  SizedBox(
                    height: 20,
                  ),
                  AppText(
                    text: 'Page 1 of 4',
                    color: Colors.green,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Wrap(
                      spacing: 130,
                      children: [
                        backButton(
                            Colors.green, 'Sign In', Colors.white, context),
                        toFormTwoButton(
                            Colors.green, 'Sign In', Colors.white, context)
                      ],
                    ),
                  )
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
          } else if (citizenshipController.text.isEmpty) {
            submitionError(context, "Please input your citizenship!!");
          } else if (_dropDownValueAccType == null) {
            submitionError(context, "Please choose an account type");
          } else if (_dobController == null) {
            submitionError(context, "Please choose a date of birth");
          }else if(contactNumberController.text.length >12) {
            submitionError(context, "Your phone number has too many numbers.");
          }else if(contactNumberController.text.length <12){
    submitionError(context, "Your phone number is missing some digits.");

    } else {
            Navigator.push(
                ctx,
                MaterialPageRoute(
                  builder: (context) => ClientFormTwo(
                    dropDownValueAccType: _dropDownValueAccType.toString(),
                    firstNameController: firstNameController.text,
                    lastNameController: lastNameController.text,
                    contactNumberController: contactNumberController.text,
                    dobController: _dobController.toString(),
                    citizenshipController: citizenshipController.text,
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
