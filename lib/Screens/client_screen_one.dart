import 'package:flutter/material.dart';
import 'package:pb/widgets/text_input.dart';
import 'package:pb/widgets/responsive_button.dart';
import 'package:pb/widgets/app_text.dart';
import 'package:pb/widgets/app_large_text.dart';

class ClientScreenOne extends StatefulWidget {
  static const routeName = '/client-screen-one';
  const ClientScreenOne({Key? key}) : super(key: key);

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
          margin: EdgeInsets.all(30),
          color: Colors.transparent,
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Padding(
              padding: EdgeInsets.only(left: 8, bottom: 23, right: 8, top: 5),
              child: Column(
                children: [
                  AppLargeText(
                    text: 'Flexi-Cash Requirements',
                    size: 28,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppText(
                    text:
                        'jkfvkjbjhfd  fjgfbhg fgvbuhbf fghufgbf gfsghufgfu rfhfgvufh',
                    color: Colors.white70,
                  ),
                  toFormOneButton(
                      Colors.green, 'Sign In', Colors.white, context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
