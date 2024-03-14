import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HeadLine extends StatefulWidget {
  const HeadLine({super.key});

  @override
  State<HeadLine> createState() => _HeadLineState();
}

class _HeadLineState extends State<HeadLine> {
  List values = [];

  @override
  void initState() {
    Fetch_head_Api();
    super.initState();
  }

  Fetch_head_Api() async {
    await http
        .get(Uri.parse(
            'https://newsapi.org/v2/top-headlines?country=us&apiKey=95b987842dec4b318e009410c627224'))
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
    return CarouselSlider.builder(
      itemCount: values.length,
      itemBuilder: (BuildContext context, index, realIndex) {
        return Container(
          child: Image.network(values[index]["urlToImage"]),
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(50),
          ),
        );
      },
      options: CarouselOptions(
          height: 500,
          enlargeCenterPage: true,
          autoPlay: true,
          enableInfiniteScroll: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: Duration(milliseconds: 200),
          viewportFraction: 0.5),
    );
  }
}
