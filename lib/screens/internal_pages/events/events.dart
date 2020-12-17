import 'package:flutter/material.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart';
import 'package:principle_app/screens/internal_pages/custom_app_bar.dart';
import 'package:principle_app/screens/navigation_wrapper/material_notification.dart';
import 'package:principle_app/simple_utils/date_formatter.dart';

class Events extends StatelessWidget {
  static const String tag = "events";

  @override
  Widget build(BuildContext context) {
    var events = generateEvents();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(tag: tag, title: 'Events'),
            Expanded(
              child: ListView.builder(
                itemCount: events.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 6),
                    child: MaterialNotification(
                        compact: true,
                        id: NepaliDateTime.now().add(Duration(days: 5)),
                        title: events[events.keys.toList()[index]]['name'],
                        content: events[events.keys.toList()[index]]['date']),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

Map<String, dynamic> generateEvents() {
  return {
    'sdsd': {
      "name": 'Dashai holiday',
      'date':
          '${NepaliDateTime.now().standard()} to ${NepaliDateTime.now().add(Duration(days: 5)).standard()}'
    },
    'sdssdd': {
      "name": 'That holiday',
      'date': NepaliDateTime.now().add(Duration(days: 5)).standard(),
    },
    'sd': {
      "name": 'This holiday',
      'date': NepaliDateTime.now().standard(),
    },
  };
}
