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
      padding: const EdgeInsets.only(bottom: 8.0),
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
            _buildTitleWidget('Your Daily Read'),
            Divider(
              color: Colors.grey.shade500,
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        //*Details List
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  'Annoncing Flutter Linux Alpha with Canonical',
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Text('Chris Sells - 9 min read'),
                              Icon(Icons.more_horiz)
                            ],
                          ),
                        ),

                        //*Image
                        Image.asset('assets/images/placeholder.jpg',)
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
