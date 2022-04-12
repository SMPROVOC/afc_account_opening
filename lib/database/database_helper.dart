import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/utils/utils.dart';

class DatabaseHelper{

  // static final _dbName = 'myDatabase.db'; // database name
  // static final _tableName = "myTable";
  static final _dbName = 'offlineRequests.db'; // database name
  static final _dbVersion = 1; // database version
  static final _tableName = "clients";


  static final columnId = '_id';
  //static final columnName = 'name';
  static final accountType = 'accountType';
  static final title = 'title';
  static final lastName = 'lastName';
  static final firstName = 'firstName';
  static final contactNumber = 'contactNumber';
  static final dob = 'dob';
  static final gender = 'gender';
  static final marritalStatus = 'marritalStatus';
  static final nationalId = 'nationalId';
  static final citizenship = 'citizenship';
  static final countryOfBirth = 'countryOfBirth';
  static final nextOfKin = 'nextOfKin';
  static final address = 'address';
  static final grossIncome = 'grossIncome';
  static final occupation = 'occupation';
  static final sourceOfIncome = 'sourceOfIncome';
  static final description = 'description';
  static final proPic = 'proPic';
  static final passportOrId = 'passportOrId';
  static final proofOfResidence = 'proofOfResidence';
  static final signature = 'signature';



  // making singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();


  // initialize database
  static Database? _database;

  Future<Database?> get database async{

    if (_database!=null) return _database;

    _database = await _initiateDatabase();

    return _database;
  }

  _initiateDatabase() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path,_dbName);
    print(path);

    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);

  }

  // Future _onCreate(Database db, int version) async {
  //   db.execute(
  //       '''
  //         CREATE TABLE $_tableName(
  //          $columnId INTEGER PRIMARY KEY,
  //          $columnName TEXT NOT NULL )
  //       '''
  //   );
  // }

  Future _onCreate(Database db, int version) async {
    db.execute(
        '''
          CREATE TABLE $_tableName(
           $columnId INTEGER PRIMARY KEY,
           $accountType TEXT NOT NULL,
           $title TEXT NOT NULL,
           $lastName TEXT NOT NULL,
           $firstName TEXT NOT NULL,
           $contactNumber TEXT NOT NULL,
           $dob TEXT NOT NULL,
           $gender TEXT NOT NULL,
           $marritalStatus TEXT NOT NULL,
           $nationalId TEXT NOT NULL,
           $citizenship TEXT NOT NULL,
           $countryOfBirth TEXT NOT NULL,
           $nextOfKin TEXT NOT NULL,
           $address TEXT NOT NULL,
           $grossIncome TEXT NOT NULL,
           $occupation TEXT NOT NULL,
           $sourceOfIncome TEXT NOT NULL,
           $description TEXT NOT NULL,
           $proPic TEXT NOT NULL,
           $passportOrId TEXT NOT NULL,
           $proofOfResidence TEXT NOT NULL,
           $signature TEXT NOT NULL
           )
        '''
    );
  }

  Future<int> insert(Map<String, dynamic> row ) async{
    Database? db = await instance.database;

    if (db != null){
      return await db.insert(_tableName, row);
    }else{
      return 900;
    }


  }

  Future <List<Map<String, dynamic>>> queryAll() async{
    Database? db = await instance.database;

    return await db!.query(_tableName);
  }

  Future <int> update (Map<String, dynamic> row) async{
    Database? db = await instance.database;
    int id = row[columnId];
    return await db!.update(_tableName, row, where:'$columnId = ?', whereArgs: [id]);
  }

  Future <int> delete (int id) async{
    Database? db = await instance.database;
    return await db!.delete(_tableName,where:'$columnId = ?', whereArgs: [id]);
  }

  Future <int?> recordCount () async{
    Database? db = await instance.database;
    int? count = Sqflite.firstIntValue(await db!.rawQuery('SELECT COUNT(*) FROM $_tableName'));
    return count;
  }

  Future <List<Map<String, dynamic>>> topRecord() async{
    Database? db = await instance.database;

    return await db!.rawQuery('select * from $_tableName limit 1 ');
  }


  Future<void> deleteFile(File file) async {
    try {
      if (await file.exists()) {
        await file.delete();
      }
    } catch (e) {
      // Error in getting access to the file.
    }
  }


}
