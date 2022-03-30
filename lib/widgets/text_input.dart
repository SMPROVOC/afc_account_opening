import 'package:flutter/material.dart';

Widget userInput(TextEditingController userInput, String hintTitle,
    TextInputType keyboardType, pid) {
  return Container(
    width: 300,
    height: 50,
    margin: EdgeInsets.only(bottom: 18),
    decoration: BoxDecoration(
        // color: Color.fromARGB(255, 29, 211, 126),
        // color: Color.fromARGB(255, 29, 211, 126),
        color: Color(0xFFFFFF).withOpacity(0.6),
        borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
      child: TextField(
        style: TextStyle(fontStyle: FontStyle.normal),
        cursorColor: Colors.green,
        controller: userInput,
        decoration: InputDecoration(
          hintText: hintTitle,
          prefixIcon: Icon(
            pid,
            size: 20,
            color: Colors.green,
          ),
          filled: true,
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.green)),
          hintStyle: TextStyle(
              fontSize: 18, color: Colors.black, fontStyle: FontStyle.italic),
        ),
        keyboardType: keyboardType,
      ),
    ),
  );
}
