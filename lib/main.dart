import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
          leading: Icon(Icons.menu),
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
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  Widget _buildTitleWidget(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
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

            //*ListView
            Container(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) => ArticleListTile(),
              ),
            ),

            //* Divider
            Divider(
              color: Colors.grey.shade500,
            ),

            //*Tune your recommendations Widget
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'Tune your recommendations',
                      style: TextStyle(
                          color: Colors.teal, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(6.0)),
                            border:
                                Border.all(color: Colors.black, width: 1.0)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                    )
                  ],
                ),
              ),
            ),

            //* Divider
            Divider(
              color: Colors.grey.shade500,
            ),
          ],
        ),
      ),
    );
  }
}

class ArticleListTile extends StatelessWidget {
  final bool isBasesOn;
  const ArticleListTile({
    Key key,
    this.isBasesOn = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            isBasesOn ? Text('BASED ON YOUR READING HISTORY') : Container(),
            isBasesOn
                ? SizedBox(
                    height: 8.0,
                  )
                : Container(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //*Details List
                Expanded(
                  child: Container(
                    height: 100.0,
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
                        Text('Chris Sells - 9 min read'),
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
                        width: 100.0,
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
          ],
        ),
      ),
    );
  }
}
