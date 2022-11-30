import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hadeth_app/database/my_data.dart';
import 'package:hadeth_app/model/hadeth.dart';
import 'package:hadeth_app/screens/bottom_bar.dart';
import 'package:hadeth_app/utils/color_app.dart';
import 'package:hadeth_app/utils/text.dart';
import 'package:path_provider/path_provider.dart';

class HadethScreen extends StatefulWidget {
  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            "assets/svg/background.svg",
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .14,
                        ),
                        SvgPicture.asset(
                          "assets/svg/logo.svg",
                        ),
                        IconButton(
                            onPressed: (() => Navigator.pop(context)),
                            icon: Icon(
                              Icons.arrow_forward,
                              size: 25,
                            )),
                        // InkWell(
                        //   onTap: (() => Navigator.pop(context)),
                        // child: Padding(
                        //   padding: EdgeInsets.only(left: 12),
                        //   child: Transform.rotate(
                        //     angle: 9.43,
                        //     child: SvgPicture.asset(
                        //       "assets/svg/arrow-right.svg",
                        //     ),
                        //   ),
                        // ),
                        //),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextApp.bookOneScreen,
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    // SvgPicture.asset(
                    //   "assets/svg/background.svg",
                    //   fit: BoxFit.fill,
                    // ),
                    FutureBuilder(

                        //we call the method, which is in the folder db file database.dart
                        future: Mydata.getAlldata(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return GridView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                Hadith item = snapshot.data[index];
                                //delete one register for id
                                return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  HomeHadith(hadith: item))));
                                    },
                                    child:
                                        hadethImage(item.key, item.nameHadith));
                              },
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 300,
                                childAspectRatio: 3 / 3.5,
                              ),
                            );
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        }),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget hadethImage(String? key, name) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          "assets/img.png",
        ),
        SvgPicture.asset(
          "assets/svg/grey.svg",
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              key ?? '',
              style: TextStyle(fontSize: 14, color: colorApp.yellow1),
            ),
            Text(
              name,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: colorApp.yellow1),
              textScaleFactor: .5,
            ),
          ],
        )
      ],
    );
  }
}
