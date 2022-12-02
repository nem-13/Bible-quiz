
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';

import '../const/const.dart';
import 'package:path/path.dart';

Future<Database> copyDB() async{
  var dbPath = await getDatabasesPath();
  var path = join(dbPath, db_name);

  var exists = await databaseExists(path);
  if(!exists)
    {
      try{
        await Directory(dirname(path)).create(recursive: true);
      }catch(_){}
      ByteData data = await rootBundle.load(join("assets/db", db_name));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    }else
      {
        print('DB already exists');
      }
  return await openDatabase(path, readOnly: true);
}