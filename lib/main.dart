import 'package:flutter/material.dart';
import 'package:principle_app/screens/internal_pages/articles/articles.dart';
import 'package:principle_app/screens/internal_pages/bus_details/bus_details.dart';
import 'package:principle_app/screens/internal_pages/due_details/due_details.dart';
import 'package:principle_app/screens/internal_pages/events/events.dart';
import 'package:principle_app/screens/internal_pages/teacher/teacher_list.dart';

import 'package:principle_app/screens/library/library.dart';
import 'package:provider/provider.dart';
import 'package:principle_app/const.dart';
import 'package:principle_app/screens/internal_pages/student/class_list.dart';
import 'package:principle_app/screens/internal_pages/class_routine/class_routine.dart';
import 'package:principle_app/screens/internal_pages/exam_routine/exam_routine.dart';
import 'package:principle_app/screens/internal_pages/results/exam_results.dart';
import 'package:principle_app/screens/internal_pages/suggestion/sgegstion.dart';
import 'package:principle_app/screens/intro/walkthrough.dart';
import 'package:principle_app/screens/login/login_manager.dart';
import 'package:principle_app/screens/login/loginwrapper.dart';
import 'package:principle_app/services/shared_prefrernces/shared_pref.dart';
import 'package:principle_app/simple_utils/ui_modifiers.dart';
import 'package:principle_app/theme/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        /*Provider(
          create: (_) => ServiceManager(),
        ),*/
        Provider(
          create: (_) => LoginManger(),
        )
      ],
      child: ScrollConfiguration(behavior: NoGlow(),child: MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (BuildContext context, ThemeProvider appProvider, Widget child) {
        return MaterialApp(
            key: appProvider.key,
            debugShowCheckedModeBanner: false,
            navigatorKey: appProvider.navigatorKey,
            title: Constants.appName,
            theme: appProvider.theme,
            darkTheme: Constants.darkTheme,
            home:
            // TestWidget()
            !LocalStorage.shouldSkipIntro
                ? Walkthrough()
                : LoginWrapper(),
        routes: {
            Student.tag: (context) => Student(),
            ClassRoutine.tag: (context) => ClassRoutine(),
            ExamRoutine.tag: (context) => ExamRoutine(),
            ExamResults.tag: (context) => ExamResults(),
            Suggestion.tag: (context) => Suggestion(),
            Articles.tag: (context) => Articles(),
            Library.tag: (context) => Library(),
            Events.tag: (context) => Events(),
            DueDetails.tag: (context) => DueDetails(),
            BusDetails.tag: (context) => BusDetails(),
            Teacher.tag: (context) => Teacher(),
          },
        );
      },
    );
  }
}