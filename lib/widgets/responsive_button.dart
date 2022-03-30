import 'package:flutter/material.dart';
import 'package:pb/Screens/client_screen_one.dart';
import 'package:pb/Screens/client_form_one.dart';
import 'package:pb/Screens/client_form_two.dart';
import 'package:pb/Screens/client_form_three.dart';
import 'package:pb/Screens/client_form_four.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;

  ResponsiveButton({Key? key, this.isResponsive = false, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(31, 20, 172, 88),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset('assets/images/arrow2.png')],
      ),
    );
  }
}

Widget authentificationButton(
    Color buttonColor, String title, Color textColor, BuildContext ctx) {
  return Container(
    height: 60,
    width: 200,
    padding: const EdgeInsets.only(top: 25, left: 24, right: 24),
    child: RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      color: buttonColor,
      onPressed: () {
        Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
          return ClientScreenOne();
        }));
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

Widget toFormOneButton(
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
        Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
          return ClientFormOne();
        }));
      },
      child: Icon(
        Icons.keyboard_arrow_right_outlined,
        size: 40,
        color: Colors.white70,
      ),
    ),
  );
}

// Widget toFormTwoButton(Color buttonColor, String title, Color textColor,
//     BuildContext ctx, String first_name) {
//   return Container(
//     height: 60,
//     width: 80,
//     // color: Colors.red,
//     padding: const EdgeInsets.only(top: 2, left: 2, right: 4),
//     child: RaisedButton(
//       elevation: 0,
//       shape: CircleBorder(),
//       color: buttonColor,
//       onPressed: () {
       
//         // Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
//         //   return ClientFormTwo();
//         // }));
//         Navigator.push(
//             ctx,
//             MaterialPageRoute(
//               builder: (context) => ClientFormTwo(),
//             ));
//       },
//       child: Icon(
//         Icons.keyboard_arrow_right_outlined,
//         size: 40,
//         color: Colors.white70,
//       ),
//     ),
//   );
// }

// Widget toFormFourButton(
//     Color buttonColor, String title, Color textColor, BuildContext ctx) {
//   return Container(
//     height: 60,
//     width: 80,
//     // color: Colors.red,
//     padding: const EdgeInsets.only(top: 2, left: 2, right: 4),
//     child: RaisedButton(
//       elevation: 0,
//       shape: CircleBorder(),
//       color: buttonColor,
//       onPressed: () {
//         Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
//           return ClientFormFour();
//         }));
//       },
//       child: Icon(
//         Icons.keyboard_arrow_right_outlined,
//         size: 40,
//         color: Colors.white70,
//       ),
//     ),
//   );
// }

// Widget toFormThreeButton(
//     Color buttonColor, String title, Color textColor, BuildContext ctx) {
//   return Container(
//     height: 60,
//     width: 80,
//     // color: Colors.red,
//     padding: const EdgeInsets.only(top: 2, left: 2, right: 4),
//     child: RaisedButton(
//       elevation: 0,
//       shape: CircleBorder(),
//       color: buttonColor,
//       onPressed: () {
//         Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
//           return ClientFormThree();
//         }));
//       },
//       child: Icon(
//         Icons.keyboard_arrow_right_outlined,
//         size: 40,
//         color: Colors.white70,
//       ),
//     ),
//   );
// }

Widget backButton(
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
        Navigator.pop(ctx);
      },
      child: Icon(
        Icons.keyboard_arrow_left_outlined,
        size: 40,
        color: Colors.white70,
      ),
    ),
  );
}

// Widget sendInfoButton(
//     Color buttonColor, String title, Color textColor, BuildContext ctx) {
//   return Container(
//     height: 60,
//     width: 80,
//     // color: Colors.red,
//     padding: const EdgeInsets.only(top: 2, left: 2, right: 4),
//     child: RaisedButton(
//       elevation: 0,
//       shape: CircleBorder(),
//       color: buttonColor,
//       onPressed: () {
//         Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
//           return ClientFormOne();
//         }));
//       },
//       child: Icon(
//         Icons.upload_file,
//         size: 40,
//         color: Colors.white70,
//       ),
//     ),
//   );
// }
