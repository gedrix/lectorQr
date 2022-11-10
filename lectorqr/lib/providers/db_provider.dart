import 'package:sqflite/sqflite.dart';

class DBProvider{
  
  //no debe de ser static
  static   Database? _database; 

  static final DBProvider db = DBProvider._();

  //constructor privado
  DBProvider._();
  
  Future<Database?> get database async{
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  Future<Database?> initDB() async{

  }
}