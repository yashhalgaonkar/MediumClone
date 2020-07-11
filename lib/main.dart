import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Medium',
      theme: ThemeData(fontFamily: 'Nunito'),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Home"),
          backgroundColor: Colors.black,
          actions: <Widget>[
            Icon(
              Icons.notifications_none,
              color: Colors.grey,
            ),
            SizedBox(width: 15.0),
            Icon(
              Icons.search,
              color: Colors.grey,
            ),
            SizedBox(width: 15.0),
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              //*Header
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      CircleAvatar(),
                      Text('Yash Halgaonkar'),
                      Text('View Profile'),
                    ],
                  ),
                ),
              ),

              Expanded(
                flex: 5,
                child: Container(
                  color: Colors.grey.shade100,
                ),
              ),
            ],
          ),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  Widget _buildTitleWidget(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2.0),
      child: Text(
        'Your Daily Read',
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  final dailyDigestList = [
    DailyArticleTile(),
    DailyArticleTile(),
    DailyArticleTile(),
  ];

  final recomendadtionList = [
    RecommendArticleTile(),
    RecommendArticleTile(),
    RecommendArticleTile(),
    RecommendArticleTile(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 0.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //*title
              _buildTitleWidget('Your Daily Read'),

              //*Divider
              Divider(
                color: Colors.grey.shade500,
              ),

              //*DAILY DIGEST
              ...dailyDigestList,

              //* Divider
              Divider(
                color: Colors.grey.shade500,
              ),

              //*Tune your recommendations Widget
              RecommendationTile(
                onTap: () {},
              ),

              //* Divider
              Divider(
                color: Colors.grey.shade500,
              ),

              ...recomendadtionList,
            ],
          ),
        ),
      ),
    );
  }
}

class RecommendationTile extends StatelessWidget {
  final Function onTap;

  const RecommendationTile({
    Key key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'Tune your recommendations',
              style: TextStyle(color: Colors.teal, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              width: 15.0,
            ),
            Expanded(
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      border: Border.all(color: Colors.black, width: 1.0)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          'Done for Today',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400),
                        ),
                        Icon(
                          Icons.check_circle_outline,
                          size: 20.0,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DailyArticleTile extends StatelessWidget {
  final bool isBasesOn;
  const DailyArticleTile({
    Key key,
    this.isBasesOn = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //*Details List
            Expanded(
              child: Container(
                height: 90.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'A VIT Boy hacks GitHub and deletes all JS repos.',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text('James Bond - 9 min read'),
                    Icon(Icons.more_horiz)
                  ],
                ),
              ),
            ),

            //*
            SizedBox(
              width: 10.0,
            ),

            //*Image
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/yash_square.jpg',
                    height: 100.0,
                    width: 80.0,
                  ),
                  Positioned(
                    bottom: 0.0,
                    child: Image.asset(
                      'assets/images/placeholder.png',
                      height: 25.0,
                      width: 25.0,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RecommendArticleTile extends StatelessWidget {
  const RecommendArticleTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //*Upper tile
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('BASED ON YOUR READING HISTORY'),
                  SizedBox(
                    height: 4.0,
                  ),
                  //*List tile
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //*Details List
                        Expanded(
                          child: Container(
                            height: 120.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                //*Title
                                Text(
                                  'A VIT Boy hacks GitHub and deletes all JS repos.',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),

                                //* Summary
                                Text(
                                    'Yash Halgaonkar, 19, got so frustrated with JS that he decided to end it all.'),
                                //Icon(Icons.more_horiz)
                              ],
                            ),
                          ),
                        ),

                        //*
                        SizedBox(
                          width: 10.0,
                        ),

                        //*Image
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/images/yash_square.jpg',
                                height: 100.0,
                                width: 80.0,
                              ),
                              Positioned(
                                bottom: 0.0,
                                child: Image.asset(
                                  'assets/images/placeholder.png',
                                  height: 25.0,
                                  width: 25.0,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //*More options tile
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //Text('David Anaya in Money Heist'),
                        RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: [
                              TextSpan(
                                text: 'James Bond',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              TextSpan(
                                text: ' in ',
                                style: TextStyle(fontWeight: FontWeight.w300),
                              ),
                              TextSpan(
                                text: 'Money Heist',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                        Text('7/22/2020 - 4 min read')
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.bookmark_border,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Icon(
                          Icons.more_vert,
                          color: Colors.black87,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            SizedBox(
              height: 4.0,
            ),

            Divider(
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
