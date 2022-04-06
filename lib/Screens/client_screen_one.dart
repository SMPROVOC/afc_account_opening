import 'package:flutter/material.dart';
import 'package:pb/widgets/text_input.dart';
import 'package:pb/widgets/responsive_button.dart';
import 'package:pb/widgets/app_text.dart';
import 'package:pb/widgets/app_large_text.dart';

class ClientScreenOne extends StatefulWidget {
  static const routeName = '/client-screen-one';
  //const ClientScreenOne({Key? key}) : super(key: key);

  final String token;

  ClientScreenOne({
    required this.token,

  });

  @override
  State<ClientScreenOne> createState() => _ClientScreenOneState();
}

class _ClientScreenOneState extends State<ClientScreenOne> {
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppLargeText(
                    text: 'Flexi-Cash Account',
                    size: 28,
                  ),
                  AppLargeText(
                    text: 'Requirements',
                    size: 28,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppLargeText(
                    text: 'Proof Of Residence',
                    size: 18,
                  ),
                  AppText(
                    text:
                    '- Proof of residencents in the name of the customer',
                    color: Colors.black,
                  ),
                  AppText(
                    text:
                    '- An affidavit from the landlord letter from the employer confirming the residence of the customer',
                    color: Colors.black,
                  ),
                  AppText(
                    text:
                    '- Letter fro employer confirming the residence of the customer',
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppLargeText(
                    text: 'National ID/Passport/Drivers licencse',
                    size: 18,
                  ),
                  AppText(
                    text:
                    '- A valid ID, passport or a drivers license.',
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppLargeText(
                    text: 'Recent Photography',
                    size: 18,
                  ),
                  AppText(
                    text:
                    '- One recent colour sized password photo (Within 3 months).',
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppLargeText(
                    text: 'Initial Deposit',
                    size: 18,
                  ),
                  AppText(
                    text:
                    '- An initial deposit of 100 Zimbabwean dollars.',
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppLargeText(
                    text: 'Non-Citizens',
                    size: 18,
                  ),
                  AppText(
                    text:
                    '- Proof of income, residency permit, copy of passport',
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  // toFormOneButton(
                  //     Colors.green, 'Sign In', Colors.white, context),

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
                              toFormOneButton(
                                  Colors.green, 'Sign In', Colors.white, context, widget.token),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
