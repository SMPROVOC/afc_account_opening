import 'package:flutter/material.dart';
import 'package:pb/widgets/popup.dart';
import 'package:pb/widgets/text_input.dart';
import 'package:pb/widgets/responsive_button.dart';
import 'package:pb/widgets/app_text.dart';
import 'package:pb/widgets/app_large_text.dart';
import 'package:pb/Screens/client_form_one.dart';
import 'package:pb/Screens/client_form_two.dart';
import 'package:pb/Screens/client_form_three.dart';
import 'package:pb/Screens/client_form_four.dart';

class ClientFormThree extends StatefulWidget {
  static const routeName = '/client-form-one';
  //const ClientFormThree({Key? key}) : super(key: key);

  final String dropDownValueAccType;
  final String firstNameController;
  final String lastNameController;
  final String middleNameController;
  final String contactNumberController;
  final String dobController;
  final String citizenshipController;
  final String gender;
  final String marritalStatus;
  final String nationalId;
  final String nextOfKeen;
  final String countryOfBirth;
  final String token;

  ClientFormThree({
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
    required this.token,
    required this.middleNameController
  });

  @override
  State<ClientFormThree> createState() => _ClientFormThreeState();
}

class _ClientFormThreeState extends State<ClientFormThree> {
  final houseNumberController = TextEditingController();
  final addressLocationController = TextEditingController();
  final cityController = TextEditingController();
  final grossIncomeController = TextEditingController();
  final emailController = TextEditingController();
  final occupationController = TextEditingController();
  final sourceOfIncomeController = TextEditingController();

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
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(left: 8, bottom: 23, right: 8, top: 5),
                child: SingleChildScrollView(
                  reverse: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Expanded(
                      //   child: Text('Demo', style: TextStyle(color: Colors.transparent),),
                      // ),

                      Container(
                        width: 300,
                        // color: Colors.grey,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Colors.grey),
                      ),
                      SizedBox(height: 20),
                      // userInput(houseNumberController, 'House number / Street',
                      //     TextInputType.text, Icons.house_outlined),
                      // userInput(addressLocationController, 'Address location',
                      //     TextInputType.text, Icons.car_rental_outlined),
                      // userInput(cityController, 'City', TextInputType.text,
                      //     Icons.location_city),
                      userInputMulti(addressLocationController, 'Address', TextInputType.multiline,
                          Icons.location_city),
                      userInput(grossIncomeController, 'Gross income',
                          TextInputType.number, Icons.monetization_on_outlined),
                      userInput(occupationController, 'Occupation', TextInputType.text,
                          Icons.work_outline),
                      userInput(sourceOfIncomeController, 'Source of income', TextInputType.text,
                          Icons.work_outline),
                      userInput(emailController, 'Description', TextInputType.text,
                          Icons.email_outlined),
                      SizedBox(
                        height: 50,
                      ),
                      //
                      // Center(
                      //   child: AppText(
                      //     text: 'Page 3 of 4',
                      //     color: Colors.green,
                      //   ),
                      // ),

                        Padding(
                          padding: EdgeInsets.only(top: 15.0),
                          child: Center(
                            child: Wrap(
                              spacing: 160,
                              children: [
                                backButton(
                                    Colors.green, 'Sign In', Colors.white, context),
                                toFormFourButton(
                                    Colors.green, 'Sign In', Colors.white, context),
                                Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),),
                              ],
                            ),
                          ),
                        ),
                      // Expanded(
                      //   child: Text('Demo', style: TextStyle(color: Colors.transparent),),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget toFormFourButton(
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
           if (addressLocationController.text.isEmpty) {
            submitionError(context, 'Please fill in your address loaction');

          } else if (grossIncomeController.text.isEmpty) {
            submitionError(context, 'Please fill in your gross income');
          } else if (sourceOfIncomeController.text.isEmpty) {
            submitionError(context, 'Please fill in your source income');
          } else {
            Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
              return ClientFormFour(
                dropDownValueAccType: widget.dropDownValueAccType.toString(),
                firstNameController: widget.firstNameController,
                  middleNameController: widget.middleNameController,
                lastNameController: widget.lastNameController,
                contactNumberController: widget.contactNumberController,
                dobController: widget.dobController.toString(),
                citizenshipController: widget.citizenshipController,
                gender: widget.gender,
                marritalStatus: widget.marritalStatus,
                nationalId: widget.nationalId,
                nextOfKeen: widget.nextOfKeen,
                countryOfBirth: widget.countryOfBirth,
                //houseNumber: houseNumberController.text,
                addressLocation: addressLocationController.text,
                //city: cityController.text,
                grossIcome: grossIncomeController.text,
                email: emailController.text,
                occupation: occupationController.text,
                sourceOfIncome: sourceOfIncomeController.text,
                token: widget.token

                //                       required this.marritalStatus,
                // required this.nationalId,
                // required this.nextOfKeen,
                // required this.countryOfBirth,
              );
            }));
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
