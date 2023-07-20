import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../functions/changer_provider.dart';
import 'body.dart';

StreamBuilder<DatabaseEvent> stremBuilder(DatabaseReference ref) {
  return StreamBuilder(
    stream: ref.onValue,
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      } else {
        if (snapshot.hasData && snapshot.data != null) {
          final data = snapshot.data!.snapshot.value as Map<dynamic, dynamic>?;
          final dataList = data!.values.toList();
          String mins = Provider.of<ChangerProvider>(context).mins;
          final indiatorData = dataList[200];
          final objName = indiatorData['NIFTY 50'];
          print(objName);

        

              List<Map<String, dynamic>> topOiValues = [];
              if (objName != null) {
                for (final objectName in objName.keys) {
                  final objectData = objName[objectName];

                  // Check if "oi" exists in the object
                  if (objectData != null && objectData.containsKey('oi')) {
                    final oiValue = objectData['oi'];
                    topOiValues.add({'name': objectName, 'oi': oiValue});
                  }
                }
              }
              topOiValues.sort((a, b) => b['oi'].compareTo(a['oi']));
              final top7OiValues = topOiValues.take(7).toList();










          final indicatorPercentage =
              objName['spot'][mins]['oscillator_percentage'];

          final oscillatorPercentage =
              objName['spot'][mins]['oscillator_percentage'];

          return body(
            indicatorPercentage,
            oscillatorPercentage,
            context,
            top7OiValues
          );
        } else {
          return const Center(
            child: Text("Someting rong"),
          );
        }
      }
    },
  );
}
