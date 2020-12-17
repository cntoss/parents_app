import 'package:principle_app/screens/homepage/home_page_tile.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:principle_app/const.dart';
import 'package:principle_app/template.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          /*  makeSlideTween(
            context: context,
            child: StudentDogTag(
              name: studentName,
              attributes: studentDogTagAttributes,
              image: studentImage,
              mini: true,
            ),
          ), */
          Padding(
            padding: Constants.padding,
            child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                width: MediaQuery.of(context).size.width,
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Principle App Dashboard',
                      style: Constants.title
                          .copyWith(fontSize: 30, color: Colors.black38),
                    ))),
          ),
          SizedBox(
            height: 10,
          ),
          GridView.count(
            padding: Constants.padding,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount:
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? 3
                    : 5,
            children: tiles.keys
                .map((e) => Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: GestureDetector(
                        onTap: () {
                          //todo implement routes
                          // Navigator.of(context).pushNamed('/$assetImage');
                        },
                        child: DashBoardTile(
                            tileTitle: e,
                            assetImage: tiles[e],
                            onTap: () {
                              print("$e");
                              Navigator.of(context).pushNamed('${tiles[e]}');
                            }),
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
