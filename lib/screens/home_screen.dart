import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

var top;
var movies = [
  {
    "name": "Blacklist",
  },
  {
    "name": "Blacklist",
  },
  {
    "name": "Blacklist",
  },
  {
    "name": "Blacklist",
  },
  {
    "name": "Blacklist",
  },
  {
    "name": "Blacklist",
  }
];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          brightness: Brightness.dark,
          pinned: true,
          floating: true,
          snap: true,
          primary: true,
          expandedHeight: MediaQuery.of(context).size.height * 0.55,
          backgroundColor: Colors.black,
          toolbarHeight: 100,
          title: Title(
            color: Colors.black,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(),
                        width: 30,
                        child: SvgPicture.asset(
                          'assets/svg/logo.svg',
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                      Container(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.tv),
                            Icon(Icons.search),
                            Icon(Icons.supervised_user_circle_rounded),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      renderTitle('Series', 'Series'),
                      renderTitle('Películas', 'Películas'),
                      renderTitle('Mi-lista', 'Mi lista'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.parallax,
            background: Container(
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.network(
                      "https://karmaturkiye.com/wp-content/uploads/2020/05/Dark.jpeg",
                      fit: BoxFit.cover),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                        stops: [0.1, 0.6, 1.0],
                        colors: [
                          Colors.black54,
                          Colors.transparent,
                          Colors.black
                        ],
                      ),
                    ),
                    child: Container(
                      height: 40.0,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(bottom: 8.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 3.0,
                                    color: Color.fromRGBO(185, 3, 12, 1.0),
                                  ),
                                ),
                              ),
                              child: Text(
                                "DARK",
                                maxLines: 3,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  height: 0.65,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 30.0,
                                ),
                              ),
                            ),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text("asdsad"),
                                ),
                                Container(
                                  child: Text("asdsad"),
                                ),
                                Container(
                                  child: Text("asdsad"),
                                ),
                              ]),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                FlatButton(
                                  textColor: Colors.white,
                                  child: Column(
                                    children: <Widget>[
                                      Icon(Icons.add),
                                      Text(
                                        'Mi lista',
                                        style: TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                  onPressed: () => print('mi lista'),
                                ),
                                RaisedButton(
                                  textColor: Colors.black,
                                  color: Colors.white,
                                  child: Row(
                                    children: <Widget>[
                                      Icon(Icons.play_arrow),
                                      Text(
                                        'Reproducir',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {},
                                ),
                                FlatButton(
                                    textColor: Colors.white,
                                    child: Column(
                                      children: <Widget>[
                                        Icon(Icons.info_outline),
                                        Text(
                                          'Información',
                                          style: TextStyle(
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    ),
                                    onPressed: () {}),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Container(
              child: Text("asdasd"),
            ),
            childCount: 100,
          ),
        )
      ],
    ));
  }

  Widget renderTitle(String tag, String text) {
    return Hero(
      tag: tag,
      child: FlatButton(
        onPressed: () => print("object"),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }

  renderMainGenres() {}
}
