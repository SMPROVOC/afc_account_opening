import 'package:flutter/material.dart';
import 'package:pb/widgets/popup.dart';
import 'package:pb/widgets/text_input.dart';
import 'package:pb/widgets/responsive_button.dart';
import 'package:pb/widgets/app_text.dart';
import 'package:pb/widgets/app_large_text.dart';
import 'package:pb/widgets/app_large_text.dart';
import 'package:pb/Screens/client_form_one.dart';
import 'package:pb/Screens/client_form_two.dart';
import 'package:pb/Screens/client_form_three.dart';
import 'package:pb/Screens/client_form_four.dart';
import 'package:intl/intl.dart';

class ClientFormTwo extends StatefulWidget {
  static const routeName = '/client-form-one';
  //const ClientFormTwo({Key? key, text}) : super(key: key);

  final String dropDownValueAccType;
  final String dropDownValueTitle;
  final String firstNameController;
  final String lastNameController;
  final String middleNameController;
  final String contactNumberController;
  final String dobController;
  final String token;

  ClientFormTwo({
    required this.dropDownValueAccType,
    required this.dropDownValueTitle,
    required this.firstNameController,
    required this.lastNameController,
    required this.contactNumberController,
    required this.dobController,
    required this.token,
    required this.middleNameController,
  });

  @override
  State<ClientFormTwo> createState() => _ClientFormTwoState();
}

class _ClientFormTwoState extends State<ClientFormTwo> {
  final marritalStatusController = TextEditingController();
  final nationalIdController = TextEditingController();
  final nextOfKeenController = TextEditingController();
  final countryOfBirthController = TextEditingController();
  final citizenshipController = TextEditingController();
  String? _dropDownValueMerritalStatus;
  String? _dropDownValueGender;
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
          margin: EdgeInsets.fromLTRB(10, 50, 10, 30),
          color: Colors.white70,
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            // color: Colors.amber,
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
                        color: Colors.white70),
                    child: DropdownButton(
                      hint: _dropDownValueGender == null
                          ? Text('Gender')
                          : Text(
                              _dropDownValueGender!,
                              style:  TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                      isExpanded: true,
                      iconSize: 30.0,
                      style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold),
                      items: ['Male', 'Female'].map(
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
                            _dropDownValueGender = val as String?;
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 300,
                    padding: EdgeInsets.only(left: 16, right: 16),
                    // color: Colors.grey,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Colors.white70),
                    child: DropdownButton(
                      hint: _dropDownValueMerritalStatus == null
                          ? Text('Marrital status')
                          : Text(
                              _dropDownValueMerritalStatus!,
                              style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                      isExpanded: true,
                      iconSize: 30.0,
                      style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold),
                      items: ['Married', 'Single', 'Divorced'].map(
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
                            _dropDownValueMerritalStatus = val as String?;
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  userInput(nationalIdController, 'National ID (1234567A89)',
                      TextInputType.text, Icons.numbers_outlined),
                  userInput(citizenshipController, 'citizenship',
                      TextInputType.text, Icons.person),
                  userInput(countryOfBirthController, 'country of birth',
                      TextInputType.text, Icons.house_outlined),
                  userInput(nextOfKeenController, 'Next of kin',
                      TextInputType.text, Icons.child_care_outlined),


                  SizedBox(
                    height: 20,
                  ),
                  //
                  // dropDownValueAccType,
                  // dropDownValueTitle,
                  // firstNameController,
                  // lastNameController,
                  // contactNumberController,
                  // dobController,
                  Center(
                    child: AppText(
                      text: 'Page 2 of 3',
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),


                  Expanded(

                    child: Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Center(
                        child: Wrap(
                          spacing: 150,
                          children: [
                            backButton(
                                Colors.green, 'Sign In', Colors.white, context),
                            toFormThreeButton(
                                Colors.green, 'Sign In', Colors.white, context)
                          ],
                        ),
                      ),
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

  Widget toFormThreeButton(
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

          String check = 'ok';

          try {
            if (_dropDownValueGender == null) {
              submitionError(context, 'Please select a gender!');
              check = 'null';
            }
          } on Exception catch (exception) {
            check = 'null';
            // only executed if error is of type Exception
            submitionError(context, 'Please select a gender!');
          } catch (error) {
            check = 'null';
            // executed for errors of all types other than Exception
            submitionError(context, 'Please select a gender!');
          }

          try {
            if (_dropDownValueMerritalStatus == null) {
              submitionError(context, 'Please select your marrital status');
              check = 'null';
            }
          } on Exception catch (exception) {
            check = 'null';
            // only executed if error is of type Exception
            submitionError(context, 'Please select your marrital status');
          } catch (error) {
            check = 'null';
            // executed for errors of all types other than Exception
            submitionError(context, 'Please select your marrital status');
          }

          if (check == 'ok') {
            if (nationalIdController.text.isEmpty) {
              submitionError(context, 'Please input your national ID');
            } else if (nextOfKeenController.text.isEmpty) {
              submitionError(context, 'Please input your next of keen');
            } else if (countryOfBirthController.text.isEmpty) {
              submitionError(context, 'Please input your country of birth');
            } else {
              Navigator.push(
                  ctx,
                  MaterialPageRoute(
                    builder: (context) => ClientFormThree(
                      dropDownValueAccType:
                          widget.dropDownValueAccType.toString(),
                      firstNameController: widget.firstNameController,
                      middleNameController: widget.middleNameController,
                      lastNameController: widget.lastNameController,
                      contactNumberController: widget.contactNumberController,
                      dobController: widget.dobController.toString(),
                      citizenshipController: citizenshipController.text,
                      gender: _dropDownValueGender.toString(),
                      marritalStatus: _dropDownValueMerritalStatus.toString(),
                      nationalId: nationalIdController.text,
                      nextOfKeen: nextOfKeenController.text,
                      countryOfBirth: countryOfBirthController.text,
                      token: widget.token,
                    ),
                  ));
            }
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
