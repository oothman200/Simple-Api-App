import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ArticleScreen extends StatefulWidget {
  static String routeName = '/ArticleScreen';
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Article'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Main article'.toUpperCase()),
            CarouselSlider.builder(
              itemCount: 3,
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height/2.3,
                aspectRatio: 2,
                viewportFraction: 1,
                enlargeCenterPage: true,
                autoPlay: true,
                onPageChanged: (index, _) {},
              ),
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                return buildMainArticleWidget();
              },
            ),

            Divider(
              color: Colors.black38,
            ),
            SizedBox(height: 10),
            Text('More articles'.toUpperCase()),
            //
            ListView.separated(
              itemCount: 3,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemBuilder: (context, index) => Container(
                height: 70,
                child: Row(
                  children: [
                    Container(
                      child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRP5sxumA8GGO_jqpERmrqiRJ-3EURjd1jvg&usqp=CAU '),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Main article article article article article ',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.justify,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Main article article article article  ',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.justify,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildMainArticleWidget() {
    return Container(
      margin: EdgeInsets.only(top: 15, bottom: 20),
      //height: MediaQuery.of(context).size.height / 2.5,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRP5sxumA8GGO_jqpERmrqiRJ-3EURjd1jvg&usqp=CAU '),
          SizedBox(height: 10),
          Text(
            'Main article article article article article article article article',
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.justify,
            maxLines: 2,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Text(
                'auother name',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 10),
              Text('Main article'.toUpperCase()),
            ],
          ),
        ],
      ),
    );
  }
}
