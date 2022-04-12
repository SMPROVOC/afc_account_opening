import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pb/database/database_helper.dart';
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

class OfflineUploadScreen extends StatefulWidget {
  static const routeName = '/client-form-one';
  //const OverDraftScreenOne({Key? key}) : super(key: key);

  final String token;

  OfflineUploadScreen({
    required this.token,

  });

  @override
  State<OfflineUploadScreen> createState() => _OfflineUploadScreenState();
}

class _OfflineUploadScreenState extends State<OfflineUploadScreen> {
  bool isLoading = false;
  final loan_amount = TextEditingController();
  final loan_tenure = TextEditingController();
  final account_number = TextEditingController();
  PickedFile? _imageSignaturePic;
  final _picker = ImagePicker();

  DateTime date = DateTime(2005, 01, 01);
  String? _dropDownValueTenure;
  String? _dropDownValueTitle;
  late DateTime? _dobController;
  String? dk;
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  static const recordSentMsg = SnackBar(
      content: Text('A just record uploaded successfully...'));


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
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    // FlatButton(onPressed:() async{
                    //  int i = await  DatabaseHelper.instance.insert({
                    //    DatabaseHelper.accountType : 'Flexi',
                    //    DatabaseHelper.title : 'Mr',
                    //    DatabaseHelper.lastName : 'Mambazo',
                    //    DatabaseHelper.firstName : 'Takunda',
                    //    DatabaseHelper.contactNumber : '263345676444',
                    //    DatabaseHelper.dob : '29/04/12',
                    //    DatabaseHelper.gender : 'female',
                    //    DatabaseHelper.marritalStatus : 'Married',
                    //    DatabaseHelper.nationalId : '232343434f32',
                    //    DatabaseHelper.citizenship : 'SA',
                    //    DatabaseHelper.countryOfBirth : 'SA',
                    //    DatabaseHelper.nextOfKin : 'Husband',
                    //    DatabaseHelper.address : 'house number 2, location number 2',
                    //    DatabaseHelper.grossIncome : '40000',
                    //    DatabaseHelper.occupation : 'artist',
                    //    DatabaseHelper.sourceOfIncome : 'artist',
                    //    DatabaseHelper.description : 'I love painting',
                    //    DatabaseHelper.proPic : 'pic1.jpg',
                    //    DatabaseHelper.passportOrId : 'pic2.jpg',
                    //    DatabaseHelper.proofOfResidence : 'pic3.jpg',
                    //    DatabaseHelper.signature : 'pic4.jpg',
                    //
                    //   });
                    //  print('The inserted id is $i');
                    // }, child: Text('Insert'),color: Colors.amber,),
                    // FlatButton(onPressed:() async{
                    //   List<Map<String, dynamic>> queryRows = await DatabaseHelper.instance.queryAll();
                    //   print(queryRows);
                    // }, child: Text('query'),color: Colors.green,),
                    // FlatButton(onPressed:() async{
                    //   int updatedId = await  DatabaseHelper.instance.update({
                    //     DatabaseHelper.columnId: 2,
                    //     DatabaseHelper.firstName : 'Luke'
                    //       });
                    //   print('Row(s) affected: $updatedId');
                    // }, child: Text('update'),color: Colors.grey,),
                    // FlatButton(onPressed:() async{
                    //   int rowsAffected = await DatabaseHelper.instance.delete(4);
                    //   print('Row(s) affected: $rowsAffected');
                    // }, child: Text('delete'),color: Colors.red,),
                    FlatButton(onPressed:() async{
                      int? recordCount = await DatabaseHelper.instance.recordCount();
                      //print('Records: $recordCount');
                     offlinePopup(context, 'You have $recordCount offline record(s)');
                    }, child: Text('Show all records'),color: Colors.green,),
                    SizedBox(height: 10,),
                    // FlatButton(onPressed:() async{
                    //   List<Map<String, dynamic>> queryRows = await DatabaseHelper.instance.topRecord();
                    //   print(queryRows);
                    // }, child: Text('top record'),color: Colors.pink,),
                    // FlatButton(onPressed:() async{
                    //   print('nyc 1');
                    // }, child: Text('Push offline records'),color: Colors.cyan,),
                    sendOfflineDataButton(Colors.cyan, 'title', Colors.black, context),
                    SizedBox(height: 10,),
                    backToWelcomeButton(
                        Colors.green, 'Sign In', Colors.white, context, widget.token),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget sendOfflineDataButton(
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

          pushDatatoFlexiDoc();

        },
        child: isLoading
            ? CircularProgressIndicator(
            color: Colors.white
        ) : Icon(
          Icons.upload_file,
          size: 40,
          color: Colors.white70,
        ),
      ),
    );
  }

  pushDatatoFlexiDoc()async {

    bool reader = true;

    setState(() {
      isLoading = true;
    });

    int upCount = 0;



    try{


    // Image? imgProPic = Image.file(File('$path/$proPic'));
    // Image? imgPassportOrId = Image.file(File('$path/$passportOrId'));
    // Image? imgProofOfResidence = Image.file(File('$path/$proofOfResidence'));
    // Image? imgSignature = Image.file(File('$path/$signature'));


      while(reader) {

        List<Map<String, dynamic>> queryRows = await DatabaseHelper.instance.topRecord();

        //print(queryRows[0]['proPic']);

        int id = queryRows[0]['_id'];
        String accountType= queryRows[0]['accountType'];
        String title = queryRows[0]['lastName'];
        String lastName = queryRows[0]['lastName'];
        String firstName = queryRows[0]['firstName'];
        String contactNumber = queryRows[0]['contactNumber'];
        String dob = queryRows[0]['dob'];
        String gender = queryRows[0]['gender'];
        String marritalStatus = queryRows[0]['marritalStatus'];
        String nationalId = queryRows[0]['nationalId'];
        String citizenship = queryRows[0]['citizenship'];
        String countryOfBirth = queryRows[0]['countryOfBirth'];
        String nextOfKin = queryRows[0]['nextOfKin'];
        String address = queryRows[0]['address'];
        String grossIncome = queryRows[0]['grossIncome'];
        String occupation = queryRows[0]['occupation'];
        String sourceOfIncome = queryRows[0]['sourceOfIncome'];
        String description = queryRows[0]['description'];
        String proPic = queryRows[0]['proPic'];
        String passportOrId = queryRows[0]['passportOrId'];
        String proofOfResidence = queryRows[0]['proofOfResidence'];
        String signature= queryRows[0]['signature'];


        Directory directory = await getApplicationDocumentsDirectory();
        String path = directory.path;

        var postUri = Uri.parse("https://payments.agribank.co.zw/api/customers");

        http.MultipartRequest request = new http.MultipartRequest("POST", postUri);

        request.headers['Accept'] = 'application/json';
        request.headers['Authorization'] = 'Bearer ' + widget.token;


        request.fields["title"] = title;
        request.fields["first_name"] = firstName;
        //request.fields["middle_name"] = middle_name;
        request.fields["source_of_funds"] = sourceOfIncome;
        request.fields["last_name"] = lastName;
        request.fields["gender"] = gender;
        request.fields["marital_status"] = marritalStatus;
        request.fields["full_address"] = address;
        request.fields["date_of_birth"] = dob;
        request.fields["msisdn"] = contactNumber;
        request.fields["country_of_birth"] = countryOfBirth;
        request.fields["citizenship"] = citizenship;
        request.fields["ocupation"] = occupation;
        request.fields["gross_income"] = grossIncome;
        request.fields["contact_person"] = nextOfKin;
        request.fields["legal"] = nationalId;
        request.fields["description"] = description;
        request.fields["branch_code"] = 'ZW000040';

        request.files.addAll([
          http.MultipartFile.fromBytes(
            'profile_photo',
            File('$path/$proPic').readAsBytesSync(),
            filename: 'profile_pic',
          ),
          http.MultipartFile.fromBytes(
            'scanned_id_or_passport',
            File('$path/$passportOrId').readAsBytesSync(),
            filename: 'passportOrId',
          ),

          http.MultipartFile.fromBytes(
            'proof_of_residence',
            File('$path/$proofOfResidence').readAsBytesSync(),
            filename: 'proofOfResidence',
          ),
          http.MultipartFile.fromBytes(
            'signature',
            File('$path/$signature').readAsBytesSync(),
            filename: 'signature',
          ),
          // http.MultipartFile.fromBytes(
          //   'additional_document',
          //   File(additionalDocPath).readAsBytesSync(),
          //   filename: additionalDocPath,
          // ),
        ]);

        var streamedResponse = await request.send().timeout(const Duration(seconds: 59));

        var response = await http.Response.fromStream(streamedResponse);

        print(response.statusCode);
        print(response.body);

        var responseData = json.decode(response.body);

        print(responseData);
        //Creating a list to store input data;


        print(responseData['message']);


        var res = responseData['message'];

        if (res == "Successfully Posted") { // Successfully Posted

          // setState(() {
          //   isLoading = false;
          //
          // });



          int rowsAffected = await DatabaseHelper.instance.delete(id);

          upCount = upCount + rowsAffected;



          await DatabaseHelper.instance.deleteFile(File('$path/$proPic'));
          await DatabaseHelper.instance.deleteFile(File('$path/$passportOrId'));
          await DatabaseHelper.instance.deleteFile(File('$path/$proofOfResidence'));
          await DatabaseHelper.instance.deleteFile(File('$path/$signature'));

          // setState(() {
          //   reader = false;
          // });

          ScaffoldMessenger.of(context).showSnackBar(recordSentMsg);


        }else if (res == "Failed to Upload Customer KYC Details, Possible Duplicate"){
          submitionError(context, 'Possible Duplication of record in system. Verify if this record does not already exist with AFC.');
          // setState(() {
          //   isLoading = false;
          // });
          int rowsAffected = await DatabaseHelper.instance.delete(id);

          upCount = upCount + rowsAffected;

          await DatabaseHelper.instance.deleteFile(File('$path/$proPic'));
          await DatabaseHelper.instance.deleteFile(File('$path/$passportOrId'));
          await DatabaseHelper.instance.deleteFile(File('$path/$proofOfResidence'));
          await DatabaseHelper.instance.deleteFile(File('$path/$signature'));

          // setState(() {
          //   reader = false;
          // });
          ScaffoldMessenger.of(context).showSnackBar(recordSentMsg);

        }else{
          submitionError(context, res);
          setState(() {
            isLoading = false;
            reader = false;
          });
        }


      }

      int? recordCount = await DatabaseHelper.instance.recordCount();

      offlinePopup(context, "Records uploaded: $upCount\n"
          "Records remaining: $recordCount");


    }on Exception catch (exception) {
        submitionError(context, exception.toString());
        setState(() {
          reader = false;
          isLoading = false;
        });
    }catch (error) {

      if (error.toString() == 'Null check operator used on a null value'){
        submitionError(context, "You do not have any offline record(s) to upload!");
      }else{
        submitionError(context, error.toString());
      }

      setState(() {
        reader = false;
        isLoading = false;
      });
    }








  }


}

