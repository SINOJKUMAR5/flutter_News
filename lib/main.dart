import 'package:flutter/material.dart';
import 'package:flutter_news/Catagories_page.dart';
import 'package:flutter_news/HeadLine_page.dart';
import 'package:flutter_news/Screen_Page.dart';

void main() {
  runApp(MyMaterialApp());
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyApp());
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Center(child: Text('Flutter_News')),
        Padding(
          padding: const EdgeInsets.only(left: 500, right: 500),
          child: Container(
            margin: EdgeInsets.all(30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60), color: Colors.grey),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: TextController,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Enter your word'),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Screen_Page(Search_Text: TextController.text);
                        },
                      ));
                    },
                    child: Icon(Icons.search))
              ],
            ),
          ),
        ),
        Catagories_page(),
        SizedBox(
          height: 50,
        ),
        HeadLine(),
      ]),
    );
  }
}
