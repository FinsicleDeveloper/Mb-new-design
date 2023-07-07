import 'dart:async';
import 'dart:developer';

import 'package:design/db/contants/database_contants.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongodataBaseFunctions {
  // ignore: prefer_typing_uninitialized_variables
  static var db, usercollection;

  static connect() async {
    // db = await Db.create(mongoConnectionUrl);
    db = await Db.create(DatabaseConstants.mongoConnectionUrl);
    await db.open();
    inspect(db);
    usercollection = db.collection(DatabaseConstants.userConnectionUrl);
  }

  // static Future<List<Map<String, dynamic>>> getData() async {
  //   final arrData = await usercollection.find().limit(10).toList();
  //   return arrData;
  // }

  static Stream<List<Map<String, dynamic>>> streamData() {
    final controller = StreamController<List<Map<String, dynamic>>>();

    Timer.periodic(const Duration(seconds: 1), (timer) async {
     final newData = await usercollection.find().take(5).toList();
      controller.add(newData);
    });

    return controller.stream;
  }
}
