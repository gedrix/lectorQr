import 'dart:io';

import 'package:lectorqr/models/scan_model.dart';
export 'package:lectorqr/models/scan_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
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
      //path de donde se va almacenar la bd

      Directory documentsDirectory = await getApplicationDocumentsDirectory();

      final path = join( documentsDirectory.path, 'ScansDB.db');

      print(path);

      return await openDatabase(
        path,
        version: 3,
        onOpen: (db)  {},
        onCreate: (Database db, int version)  async {

            await db.execute('''
              CREATE TABLE Scans(
                id INTEGER PRIMARY KEY,
                tipo TEXT,
                valor TEXT
              )
            ''');

          },
        );

  }


  //* forma 1 de realizar un insert
  Future<int?>nuevoScanRaw(ScanModel nuevoScan)async {

    final id    = nuevoScan.id;
    final tipo  = nuevoScan.tipo;
    final valor = nuevoScan.valor;

    //verificar la base de datos si existe
    final db = await database;
    
    final res = await db?.rawInsert('''
      INSERT INTO Scans(id, tipo, valor) VALUES ($id, '$tipo','$valor')
    ''');

    return res;
  }

  //* forma 2 de realizar un insert usa el toJson defnido en el modelo 
  Future<int?>nuevoScan(ScanModel nuevoScan) async{

    final db  = await database;
    final res = await db!.insert('Scans', nuevoScan.toJson());

    print(res);
    return res;
  }
}