import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DbHelper{
  DbHelper._privateConstructor();
  static final DbHelper instance = DbHelper._privateConstructor();

  static Database? _db;

  Future<Database> get db async => _db ?? await _initDb();

  Future<Database> _initDb() async{
    Directory documentsDir = await getApplicationDocumentsDirectory();
    String path = join(documentsDir.path,"rigelStore.db");
    return await openDatabase(path,version: 1,onCreate: _onCreateDb);
  }


  Future _onCreateDb(Database db, int version) async{
    await db.execute(
      '''
        CREATE TABLE productCategories(
          id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
          name VARCHAR(70) NOT NULL,
          iconName VARCHAR(50);
        );

        CREATE TABLE products(
          id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
          categoryId INTEGER NOT NULL,
          price FLOAT NOT NULL,
          ranking INTEGER NOT NULL DEFAULT 0,
          title VARCHAR(100) NOT NULL,
          description VARCHAR(255) NOT NULL,
          calories FLOAT NOT NULL,
          additives FLOAT NOT NULL,
          vitamins FLOAT NOT NULL,
          CONSTRAINT fk_category FOREIGN KEY(categoryId) REFERENCES productCategories(id); 
        );

        INSERT INTO productCategories VALUES(DEFAULT,'Nuts',NULL);
        INSERT INTO productCategories VALUES(DEFAULT,'Dried friut',NULL);
      '''
    );
  }
}