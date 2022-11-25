import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hadeth_app/screens/hadeth_screen.dart';
import 'package:hadeth_app/utils/color_app.dart';

import '../utils/text.dart';
import 'audio_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget myCard(
    Color color1,
    color2,
    String text,
    path1,
    path2,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 48),
      child: Container(
          height: 117,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(10, 10),
                    blurRadius: 40)
              ],
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                  colors: [
                    color1,
                    color2,
                  ],
                  begin: AlignmentDirectional.topEnd,
                  end: AlignmentDirectional.bottomStart)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Image.asset(path1), Text(text), SvgPicture.asset(path2)],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SvgPicture.asset(
          "assets/svg/background.svg",
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              SvgPicture.asset("assets/svg/logo.svg"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextApp.topHomeScreen,
                  TextApp.headerHomeScreen,
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return HadethScreen();
                        }));
                      },
                      child: myCard(
                          colorApp.green1,
                          colorApp.green2,
                          "الاحاديث الاربعين",
                          "assets/quran.png",
                          'assets/svg/one.svg')),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AudioScreen()));
                      },
                      child: myCard(
                          colorApp.yellow1,
                          colorApp.red2,
                          "الاستماع للاحاديث",
                          "assets/play.png",
                          'assets/svg/twoo.svg')),
                  myCard(colorApp.red1, colorApp.red2, "الاحاديث المحفوظه",
                      "assets/save-instagram.png", "assets/svg/three.svg"),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    ));
  }
}
