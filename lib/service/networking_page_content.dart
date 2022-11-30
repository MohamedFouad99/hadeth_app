import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hadeth_app/utils/text.dart';

class NetworkingPageContent extends StatefulWidget {
  final String data;

  NetworkingPageContent({required this.data});

  @override
  _NetworkingPageContentState createState() => _NetworkingPageContentState();
}

class _NetworkingPageContentState extends State<NetworkingPageContent> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Column(
            children: [
              SizedBox(
                height: 50,
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
                height: 40,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: _convertHadith(context, widget.data),
          ),
        ],
      ),
    );
  }
}

RichText _convertHadith(BuildContext context, String text) {
  text = text.replaceAll('(', '{');
  text = text.replaceAll(')', '}');

  List<String> split = text.split(RegExp("{"));

  List<String> hadiths = split.getRange(1, split.length).fold([], (t, e) {
    var texts = e.split("}");

    if (texts.length > 1) {
      return List.from(t)
        ..addAll(
            ["{${texts.first}}", "${e.substring(texts.first.length + 1)}"]);
    }
    return List.from(t)..add("{${texts.first}");
  });

  return RichText(
    textAlign: TextAlign.right,
    text: TextSpan(
      style: TextStyle(fontSize: 20, color: Colors.brown),
      children: [TextSpan(text: split.first)]..addAll(hadiths
          .map((text) => text.contains("{")
              ? TextSpan(
                  text: text,
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold))
              : TextSpan(text: text))
          .toList()),
    ),
    textDirection: TextDirection.rtl,
  );
}
