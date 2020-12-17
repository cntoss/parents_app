import 'package:flutter/material.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart';
import 'package:principle_app/const.dart';
import 'package:principle_app/screens/internal_pages/custom_app_bar.dart';
import 'package:principle_app/simple_utils/date_formatter.dart';
import 'package:principle_app/simple_utils/widgets.dart';

class Library extends StatelessWidget {
  static const String tag = "library";

  @override
  Widget build(BuildContext context) {
    var books = generateBooks();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(tag: tag, title: "Library"),
            Expanded(
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 6),
                    child: ListTile(
                      tileColor: Constants.tilesColor,
                      leading: applyShade(
                          child: Image.asset(
                        'assets/library.png',
                        color: Colors.white,
                      )),
                      title: Text(books[books.keys.toList()[index]]['name']),
                      subtitle: Text(
                          "Issued on: ${books[books.keys.toList()[index]]['issuedOn']}"),
                    ),
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

Map<String, dynamic> generateBooks() {
  var map = {
    '2550': {
      "name": 'the laws of Thermodynamics',
      "issuedOn": NepaliDateTime.now().standard(),
    },
    '23': {
      "name": 'History of barbarians',
      "issuedOn": NepaliDateTime.now().standard(),
    },
    '45': {
      "name": 'The big bang theory',
      "issuedOn": NepaliDateTime.now().standard(),
    },
    '67': {
      "name": 'Veda-I',
      "issuedOn": NepaliDateTime.now().standard(),
    },
  };
  return map;
}
