import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:principle_app/simple_utils/ui_modifiers.dart';
import 'package:principle_app/template.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:principle_app/screens/internal_pages/student/custom_dog.dart';

import 'package:principle_app/const.dart';

class TeacherDetails extends StatefulWidget {
  final teacher;
  TeacherDetails({Key key, this.teacher}) : super(key: key);
  @override
  _TeacherDetailsState createState() => _TeacherDetailsState();
}

class _TeacherDetailsState extends State<TeacherDetails>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: DefaultTabController(
      length: 2,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 119,
            bottom: WidgetToSliverBuilder(
                child: Column(
                  children: [
                    Opacity(
                      opacity: 0.7,
                      child: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/gys.jpg"),
                                fit: BoxFit.cover)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 108.0),
                          child: CustomDOgTAg(
                            image: studentImage,
                            attributes: studentDogTagAttributes,
                            name: studentName,
                          ),
                        ),
                      ),
                    ),
                    //135

                    //48
                    TabBar(
                      tabs: [
                        Tab(
                          child: Text("Personal Details"),
                        ),
                        Tab(
                          child: Text("Managerial Details"),
                        )
                      ],
                    ),
                  ],
                ),
                width: MediaQuery.of(context).size.width),
            elevation: 0,
            pinned: true,
            expandedHeight: 305,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return false
                    ? Container()
                    : Container(
                        height: height(context),
                        child: TabBarView(
                          children: [
                            buildDetails(context),
                            Container(),
                          ],
                        ),
                      );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    ));
  }

  ListView buildDetails(BuildContext context) {
    var attributes = {
      "Father's Name": "Thokar Pratap KC",
      "Mothers's Name": " Lalita  KC",
      "Local Gudardian's Name": "Bivek  KC",
      "Class teacher'Name": "Monika Bhatta",
      "Blood Group": "B+ve",
      "Current Adress": "Mid-Baneshwor , Katmandu",
    };
    var contacts = {
      "teacher's Contact": "9824525245",
      "Gudardian's Contact\nRam kumar mishra": "9862145555",
    };
    return ListView(
      children: [
        ...attributes.keys.map((e) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 40,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Text(
                            e,
                            style: Constants.title.copyWith(fontSize: 16),
                          )),
                      Expanded(
                          flex: 1,
                          child: Text(
                            attributes[e],
                            style: Constants.title.copyWith(fontSize: 16),
                          )),
                    ],
                  ),
                ),
              ),
            )),
        ...contacts.keys.map((e) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () async {
                  var url = 'tel:+977${contacts[e]}';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: SizedBox(
                  height: 40,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text(
                              e,
                              style: Constants.title.copyWith(fontSize: 16),
                            )),
                        Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(Icons.phone),
                                ),
                                Text(
                                  contacts[e],
                                  style: Constants.title.copyWith(fontSize: 16),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            )),
      ],
    );
  }

  height(context) {
    var mq = MediaQuery.of(context);
    return mq.size.height - mq.padding.top - 60 - 55 - 205;
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
