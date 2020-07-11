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
              child: Container(
                color: Colors.red,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) => ArticleListTile(),
                ),
              ),
            ),
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
  const ArticleListTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        child: Container(
          color: Colors.white,
          child: Row(
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
        ),
      ),
    );
  }
}
