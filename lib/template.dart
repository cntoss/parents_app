import 'package:flutter/material.dart';
import 'package:principle_app/screens/internal_pages/attendance/attendance.dart';
import 'package:principle_app/screens/internal_pages/class_routine/class_routine.dart';
import 'package:principle_app/screens/internal_pages/exam_routine/exam_routine.dart';
import 'package:principle_app/screens/internal_pages/results/exam_results.dart';



import 'const.dart';

const schoolName ="Shree Janata Purbanchal Madhyamik Bidhalaya";
const schoolLocationx ="Sallahghari-6, Bthaktapur";
const studentName = "Thomas Shelby";
const studentImage = "assets/user.png";
const schoolLogo= "assets/dofo.png";
const studentDogTagAttributes =  {
  "DOB": "Jan 27, 2008",
  "Class": "SIxteen",
  "Section": "Stone Cold",
  "Rank": "12",
};
const tiles = {
  "Attendance": Attendance.tag,
  "Class Routine": ClassRoutine.tag,
  "Exam Routine": ExamRoutine.tag,
  "Daily Homework": "homework",
  "Results": ExamResults.tag,
  "Project Work": "project",
  "Library": "library",
  "Suggestions": "suggestions",
  "School Details": "about",
  "Language ": "language",
  "Due Dates": "due",
  "Subjects": "subjects",
  "Events": "events",
  "Articles": "article",
};

noNotifications(context, {bool inDrawer=false})=>    Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Image.asset("assets/emptyNotification.png",height:  MediaQuery.of(context).size.height*.3,),
    Text( inDrawer ?"You'll see recent notifications here!" : "It's all quiet here!",style: Constants.title.copyWith(fontSize: 24,color: Colors.grey[400]),textAlign: TextAlign.center,)
  ],
);