import 'package:flutter/material.dart';
import 'package:pb/Screens/client_form_one.dart';

import '../Screens/additional_uploads_two_screen.dart';

submitionError(BuildContext context, String message) {
  // Create button
  Widget okButton = FlatButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Validation Check"),
    content: Text(message),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

offlinePopup(BuildContext context, String message) {
  // Create button
  Widget okButton = FlatButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Upload status"),
    content: Text(message),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}



addtionalPopup(BuildContext context, String message, String id, String token) {
  // Create button
  Widget okButton = FlatButton(
    child: const Text("Confirm"),
    onPressed: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return AdditionalUploadTwoScreen(token: token, id: id);
      }));
    },
  );
  Widget cancelButton = FlatButton(
    child: const Text("Not me"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );


  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Validation Check"),
    content: Text(message),
    actions: [
      cancelButton,
      okButton,
    ],


  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}


submitionBalance(BuildContext context, String message) {
  // Create button
  Widget okButton = FlatButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Balance response"),
    content: Text(message),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}




submitSuccessAlert(BuildContext context, String message, String token) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      // Navigator.of(context).pop();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => ClientFormOne(token: token,)
        ),
            (route) => false,
      );
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Success"),
    content: Text(message),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

uploadSuccessAlert(BuildContext context, String message, String token) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      // Navigator.of(context).pop();
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Upload successful"),
    content: Text(message),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

