import 'package:flutter/material.dart';
import '../model/hadeth.dart';
import './networking_page_content.dart';

class NetworkingPage extends StatelessWidget {
  final Hadith hadith;
  final String data;
  NetworkingPage({required this.hadith, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          NetworkingPageContent(
            data: data,
          ),
        ],
      ),
    );
  }
}
