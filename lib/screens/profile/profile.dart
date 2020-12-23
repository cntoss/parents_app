import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:principle_app/screens/homepage/dog_tag_widget.dart';
import 'package:principle_app/simple_utils/ui_modifiers.dart';
import 'package:principle_app/template.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../const.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(children: [
          Opacity(
            opacity: 0.7,
            child: Container(
              child: Image.asset(
                "assets/gys.jpg",
                fit: BoxFit.fill,
                height: 200,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          //school_logo.png

          Positioned(
            top: 30,
            left: MediaQuery.of(context).size.width / 2.5,
            child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(
                  "assets/school_logo.png",
                )),
          ),
          Positioned(
              top: 120,
              // left: MediaQuery.of(context).size.width/20,

              child: Container(
                color: Colors.black54,
                child: Text(
                  'shree janata purbanchan madyamic bidwalaye\n                  Sallagari -6 Bhaktapur',
                  style: Constants.title
                      .copyWith(fontSize: 18, color: Colors.white60),
                ),
              )),
        ]),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('School Details',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w100,
              )
              // style:   Theme.of(context).tabBarTheme.labelStyle
              ),
        ),
        Expanded(flex: 1, child: buildDetails(context))
      ],
    ));
  }

  ListView buildDetails(BuildContext context) {
    var attributes = {
      "School's Name": "shree janata purbanchan madyamic bidwalaye",
      "Adress": "Mid-Baneshwor , Katmandu",
      "Email ": "info@janata.com.np",
    };
    var contacts = {
      "Phone": "9829326666",
    };
    var website = {"Website": "https://flutter.dev"};
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
        ...website.keys.map((e) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () async {
                  var url = '${website[e]}';
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
                                  child: Icon(Icons.web),
                                ),
                                Text(
                                  website[e],
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
