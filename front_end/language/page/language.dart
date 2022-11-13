import 'package:flutter/material.dart';
import 'package:zhaoxiban/pages/homepage/page/HomePage.dart';
import 'package:zhaoxiban/pages/language/model/customRadio.dart';

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(125, 0, 15, 1),
          leading: MaterialButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const HomePage();
                },
              ));
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          elevation: 2.0,
          title: const Text(
            "方言设置",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 25.0,
                fontFamily: 'SHS'),
          ),
        ),
        body: new CustomRadio()
        );
  }
}
