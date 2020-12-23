import 'package:flutter/material.dart';
import 'package:principle_app/screens/internal_pages/student/class_list.dart';
import 'package:principle_app/screens/internal_pages/class_routine/class_routine.dart';
import 'package:principle_app/screens/internal_pages/exam_routine/exam_routine.dart';
import 'package:principle_app/screens/internal_pages/results/exam_results.dart';
import 'package:principle_app/screens/internal_pages/teacher/teacher_list.dart';

import 'const.dart';

const schoolName = "Shree Janata Purbanchal Madhyamik Bidhalaya";
const schoolLocationx = "Sallahghari-6, Bthaktapur";
const studentName = "Thomas Shelby";
const studentImage = "assets/user.png";
const schoolLogo = "assets/dofo.png";
const studentDogTagAttributes = {
// "DOB": "Jan 27, 2008",
  "Class": "SIxteen",
  "Section": "Stone Cold",
  "Rank": "12",
};
const tiles = {
  "Student": Student.tag,
  "Teacher": Teacher.tag,
  "Class Routine": ClassRoutine.tag,
  "Exam Routine": ExamRoutine.tag,
  "Results": ExamResults.tag,
  "Subjects": "subjects",
  "Library": "library",
  "Articles": "article",
  "Events": "events",
  "Due Details": "due",
  "Suggestions": "suggestions",
  "Language ": "language",
  "Bus Details ": "bus",
};

const grades = {
  "Nursary": "nursary",
  "LKG": "lkg",
  "UKG": "ukg",
  "Grade 1 ": "grade1",
  "Grade 2 ": "grade2",
  "Grade 3 ": "grade3",
  "Grade 4 ": "grade4",
  "Grade 5 ": "grade5",
  "Grade 6 ": "grade6",
  "Grade 7 ": "grade7",
  "Grade 8 ": "grade8",
  "Grade 9 ": "grade9",
  "Grade 10 ": "grade10",
  "Grade XI ": "gradexi",
  "Grade XII ": "gradexii",
};

noNotifications(context, {bool inDrawer = false}) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/emptyNotification.png",
          height: MediaQuery.of(context).size.height * .3,
        ),
        Text(
          inDrawer
              ? "You'll see recent notifications here!"
              : "It's all quiet here!",
          style:
              Constants.title.copyWith(fontSize: 24, color: Colors.grey[400]),
          textAlign: TextAlign.center,
        )
      ],
    );
