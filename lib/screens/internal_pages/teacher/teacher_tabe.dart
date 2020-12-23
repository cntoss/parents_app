import 'package:flutter/material.dart';
import 'package:principle_app/screens/internal_pages/custom_app_bar.dart';
import 'package:principle_app/screens/internal_pages/exam_routine/heading.dart';
import 'package:principle_app/screens/internal_pages/student/student_json.dart';
import 'package:principle_app/const.dart';
import 'package:principle_app/screens/internal_pages/student/student_detail.dart';

class ExamDetails extends StatelessWidget {
  const ExamDetails({
    Key key,
    @required this.exams,
    @required this.section,
    this.index,
    this.cls,
    this.tag,
  }) : super(key: key);

  final Map exams;
  final String cls;
  final int index;
  final String section;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              tag: tag,
              title: "Class $cls",
              customAsset: 'exam',
            ),
            Expanded(
              child: SingleChildScrollView(
                child: DataTable(
                  showCheckboxColumn: false, // <-- this is important
                  headingTextStyle: Constants.title.copyWith(fontSize: 20),
                  columns: const <DataColumn>[
                    DataColumn(label: Text('Rank')),
                    DataColumn(
                        label: Text(
                      'Name',
                    )),
                    DataColumn(
                        label: Text(
                      'Location',
                    )),
                  ],
                  rows: students
                      .map((e) => DataRow(
                            cells: [
                              DataCell(Text(e['rank'].toString())),
                              DataCell(
                                  Text('${e['first_name']} ${e['last_name']}')),
                              DataCell(Text(e['location'].toString())),
                            ],
                            onSelectChanged: (newValue) {
                              // print("${e['rank'].toString()}" ' row 1 pressed');
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return StudentDetails(student: e);
                              }));
                            },
                          ))
                      .toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
