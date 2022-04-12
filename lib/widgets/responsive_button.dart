import 'package:flutter/material.dart';
import 'package:pb/Screens/check_balance_screen.dart';
import 'package:pb/Screens/client_screen_one.dart';
import 'package:pb/Screens/client_form_one.dart';
import 'package:pb/Screens/coming_soon_screen.dart';
import 'package:pb/Screens/landing_screen.dart';
import 'package:pb/Screens/offline_upload_screen.dart';
import 'package:pb/Screens/welcome_screen.dart';
import 'package:pb/Screens/overdraft_screen_one.dart';
import 'package:pb/Screens/client_form_three.dart';
import 'package:pb/Screens/client_form_four.dart';

import '../Screens/additional_uploads_screen.dart';
import '../Screens/additional_uploads_two_screen.dart';

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
          return ClientScreenOne(token: '',);
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
    Color buttonColor, String title, Color textColor, BuildContext ctx, String token) {
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
          return ClientFormOne(token: token,);
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


Widget toRequirementsButton(
    Color buttonColor, String title, Color textColor, BuildContext ctx, String token) {
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
        Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
          return ClientScreenOne(token: token,);
        }));
      },
      child: Icon(
        Icons.keyboard_arrow_left_outlined,
        size: 40,
        color: Colors.white70,
      ),
    ),
  );
}


Widget landingButtonOpenAccount(
    Color buttonColor, String title, Color textColor, BuildContext ctx, String token) {
  return Container(
    height: 80,
    width: 100,
    // color: Colors.red,
    padding: const EdgeInsets.only(top: 2, left: 2, right: 4),
    child: RaisedButton(
      elevation: 0,
      shape: CircleBorder(),
      color: buttonColor,
      onPressed: () {
        Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
          return ClientScreenOne(token: token,);
        }));
      },
      child: Icon(
        Icons.account_balance_wallet,
        size: 60,
        color: Colors.white70,
      ),
    ),
  );
}

Widget landingButtonOverdraft(
    Color buttonColor, String title, Color textColor, BuildContext ctx, String token) {
  return Container(
    height: 80,
    width: 100,
    // color: Colors.red,
    padding: const EdgeInsets.only(top: 2, left: 2, right: 4),
    child: RaisedButton(
      elevation: 0,
      shape: CircleBorder(),
      color: buttonColor,
      onPressed: () {
        Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
          return OverDraftScreenOne(token: token,);
        }));
      },
      child: Icon(
        Icons.handshake,
        size: 60,
        color: Colors.white70,
      ),
    ),
  );
}

Widget landingButtonLoan(
    Color buttonColor, String title, Color textColor, BuildContext ctx, String token) {
  return Container(
    height: 80,
    width: 100,
    // color: Colors.red,
    padding: const EdgeInsets.only(top: 2, left: 2, right: 4),
    child: RaisedButton(
      elevation: 0,
      shape: CircleBorder(),
      color: buttonColor,
      onPressed: () {
        Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
          return ComingSoonScreen(token: token,);
        }));
      },
      child: Icon(
        Icons.money,
        size: 60,
        color: Colors.white70,
      ),
    ),
  );
}


Widget landingButtonCheckBalance(
    Color buttonColor, String title, Color textColor, BuildContext ctx, String token) {
  return Container(
    height: 80,
    width: 100,
    // color: Colors.red,
    padding: const EdgeInsets.only(top: 2, left: 2, right: 4),
    child: RaisedButton(
      elevation: 0,
      shape: CircleBorder(),
      color: buttonColor,
      onPressed: () {
        Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
          return CheckBalanceScreen(token: token,);
        }));
      },
      child: Icon(
        Icons.balance,
        size: 60,
        color: Colors.white70,
      ),
    ),
  );
}


Widget landingButtonUploadAdditionals(
    Color buttonColor, String title, Color textColor, BuildContext ctx, String token) {
  return Container(
    height: 80,
    width: 100,
    // color: Colors.red,
    padding: const EdgeInsets.only(top: 2, left: 2, right: 4),
    child: RaisedButton(
      elevation: 0,
      shape: CircleBorder(),
      color: buttonColor,
      onPressed: () {
        Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
          return AdditionalUploadScreen(token: token,);
        }));
      },
      child: Icon(
        Icons.upload,
        size: 60,
        color: Colors.white70,
      ),
    ),
  );
}

Widget landingButtonOfflineUpload(
    Color buttonColor, String title, Color textColor, BuildContext ctx, String token) {
  return Container(
    height: 80,
    width: 100,
    // color: Colors.red,
    padding: const EdgeInsets.only(top: 2, left: 2, right: 4),
    child: RaisedButton(
      elevation: 0,
      shape: CircleBorder(),
      color: buttonColor,
      onPressed: () {
        Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
          return OfflineUploadScreen(token: token,);
        }));
      },
      child: Icon(
        Icons.offline_bolt,
        size: 60,
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
Widget backToWelcomeButton(
    Color buttonColor, String title, Color textColor, BuildContext ctx, String token) {
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
        Navigator.pushAndRemoveUntil(
          ctx,
          MaterialPageRoute(
              builder: (context) => LandingScreen(token:  token,)
          ),
              (route) => false,
        );
      },
      child: Icon(
        Icons.keyboard_arrow_left_outlined,
        size: 40,
        color: Colors.white70,
      ),
    ),
  );
}

Widget backToLoginButton(
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
        Navigator.pushAndRemoveUntil(
          ctx,
          MaterialPageRoute(
              builder: (context) => WelcomeScreen()
          ),
              (route) => false,
        );
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
