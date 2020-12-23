import 'package:flutter/material.dart';
import 'package:principle_app/const.dart';
import 'package:principle_app/screens/internal_pages/teacher/teacher_detail.dart';
import '../custom_app_bar.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';

import 'teacher_tabe.dart';
class Teacher extends StatelessWidget {
  static const String tag = "teachers";

Map<dynamic, dynamic> generateClass() {
  
  var examNames = [
    "Pre-Primary",
    "Primary",
    "Secondary",
    "Staff",
   ];

var section = ['Alex Dahal', 'Kumar Sanu', 'Bikram Baniya', 'Saroj Tamang'];
  var classMap ={};
  examNames.forEach((example) {
    var classes = {};
    section.forEach((sec) {
      classes.putIfAbsent(sec, () => [sec]);
     });
     classMap..putIfAbsent(example, () => classes);
   });
  return classMap;
}


  @override
  Widget build(BuildContext context) {
        var exams = generateClass();

    return Scaffold(
     body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              tag: tag,
              title: "Teachers",
            ),
             Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: exams.length,
                itemBuilder: (BuildContext context, int index) {
                  var examNames = exams.keys.toList();
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical:6.0),
                    child: Container(
                      color: Colors.grey.withOpacity((index+1)/2*.08),
                      child: ExpansionTile(
                        expandedAlignment: Alignment.topLeft,
                        children: [
                          ...(exams[examNames[index]] as Map<dynamic, dynamic>).keys
                          .map((cls) {
                                String tag =UniqueKey().toString();
                            return
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Hero(
                                    tag:tag,
                                    child: Material(
                                      child: ListTile(
                                        onTap: () {

                                          Navigator.of(context).push(
                                              MaterialPageRoute(builder: (
                                                  BuildContext context) {
                                                return
                                                  TeacherDetails(teacher: examNames,);
                                              }));
                                        },
                                        title: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            cls,
                                            style: Constants.title
                                                .copyWith(fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                          })
                        ],
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                                child: Text(
                              examNames[index],
                              style: Constants.title.copyWith(fontSize: 16),
                            )),
                           
                          ],
                        ),
                      ),
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
 setOrientation(context)async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
if( MediaQuery.of(context).orientation!=Orientation.portrait) {
      await Future.delayed(Duration(milliseconds: 150),);
    }
  }

  resetOrientation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
    ]);
  }
  
  }
