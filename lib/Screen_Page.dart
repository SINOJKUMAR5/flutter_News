import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Screen_Page extends StatefulWidget {
  final String Search_Text;
  const Screen_Page({super.key, required this.Search_Text});

  @override
  State<Screen_Page> createState() => _Screen_PageState();
}

class _Screen_PageState extends State<Screen_Page> {
  List values = [];

  void initState() {
    Fetch_Search_Api(widget.Search_Text);
    super.initState();
  }

  Fetch_Search_Api(Search_Text) async {
    await http
        .get(Uri.parse(
            'https://newsapi.org/v2/everything?q=${Search_Text}&apiKey=95b987842dec4b318e009410c627224e'))
        .then((value) {
      print(value.body);
      if (value.body != null) {
        Map result = jsonDecode(value.body);
        setState(() {
          values = result['articles'];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                color: Colors.white,
                child: Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: values.length,
                      itemBuilder: (BuildContext context, index) {
                        return Tail_View(
                            url: values[index]['url'],
                            Description:
                                values[index]['description'].toString(),
                            Image_Url: values[index]['urlToImage'],
                            Title: values[index]['title'].toString());
                      }),
                )),
          ],
        ),
      ),
    );
  }
}

class Tail_View extends StatelessWidget {
  final String Image_Url;
  final String Description;
  final String Title;
  final String url;

  Tail_View(
      {super.key,
      required this.Description,
      required this.Image_Url,
      required this.Title,
      required this.url});

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      InkWell(
        onTap: () {
          _launchUrl();
        },
        child: Padding(
          padding: EdgeInsets.all(9),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Container(
              height: 500,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                Image_Url,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
      ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(100), topRight: Radius.circular(100)),
        child: Padding(
          padding: const EdgeInsets.all(9),
          child: Container(
            color: Colors.grey.shade300.withOpacity(0.9),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                Title,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontSize: 30,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
