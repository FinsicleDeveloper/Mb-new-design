import 'package:design/design/indicators/functions/bootom_sheet_provider.dart';
import 'package:design/design/indicators/functions/timer_changer.dart';
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
          int index = Provider.of<TimeChanger>(context).docIndex;
          String name = Provider.of<SelectedTextProvider>(context).selectedText;
          final indiatorData = dataList[index];
          final String timeStamp = indiatorData['timestamp'];
          final objName = indiatorData[name];
   

        

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
            top7OiValues,
            timeStamp,

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
