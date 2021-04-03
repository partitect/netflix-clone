import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:netflix_clone/data/top_rated_movie_json.dart';
import 'package:netflix_clone/data/trending_movie_json.dart';
import 'package:netflix_clone/data/trending_tv_json.dart';
import 'package:netflix_clone/data/upcoming_movie_json.dart';
import 'package:netflix_clone/partials/bottomNavigation.dart';
import 'package:netflix_clone/utils/hexColor.dart';
import 'package:netflix_clone/widgets/movie_list.dart';
import 'package:sliver_stretch_header/sliver_stretch_header.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("171717"),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              toolbarHeight: 40,
              brightness: Brightness.dark,
              pinned: false,
              primary: true,
              backgroundColor: Colors.black.withOpacity(0),
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(left: 20, right: 20, top: 10),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/logo.svg',
                      height: 40.0,
                      width: 40.0,
                      color: Colors.red,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        SvgPicture.asset(
                          'assets/svg/avatar.svg',
                          height: 30.0,
                          width: 30.0,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SliverAppBar(
              brightness: Brightness.dark,
              toolbarHeight: 30,
              pinned: true,
              backgroundColor: Colors.black.withOpacity(0),
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(bottom: 0),
                centerTitle: true,
                title: Container(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Diziler"),
                      Text("Filmler"),
                      Text("Listem"),
                    ],
                  ),
                ),
              ),
            ),
            SliverStretchHeader(
              minBlankExtent: 450,
              background: Stack(
                children: [
                  ShaderMask(
                    shaderCallback: (rect) {
                      return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(.5),
                          Colors.black.withOpacity(.5),
                          Colors.black.withOpacity(.5),
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(.3),
                          Colors.black.withOpacity(1),
                        ],
                      ).createShader(
                          Rect.fromLTRB(0, -140, rect.width, rect.height - 20));
                    },
                    blendMode: BlendMode.darken,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://images-na.ssl-images-amazon.com/images/I/81xi4hVhR8L._SL1500_.jpg",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              child: Container(
                  height: 100,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Sert Gerçekçi",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Tehditkar",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Drama",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Aksiyon",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Heyecanlı",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 55),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Listem",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            ElevatedButton.icon(
                              label: Text(
                                'Oynat',
                                style: TextStyle(color: Colors.black),
                              ),
                              icon: Icon(
                                Icons.play_arrow,
                                color: Colors.black,
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white, // background
                                onPrimary: Colors.white, // foreground
                              ),
                              onPressed: () {
                                print('Pressed');
                              },
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.info_outline_rounded,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Bilgi",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
            horizontalMovieList(
              trendingMovieList[0]["results"],
              "Popüler Filmler",
            ),
            horizontalMovieList(
              trendingTvList[0]["results"],
              "Popüler Diziler",
            ),
            horizontalMovieList(
              topRatedMovieList[0]["results"],
              "En İyi Filmler",
            ),
            horizontalMovieList(
              upcomingMovieList[0]["results"],
              "Gelecek Filmler",
            ),
          ],
        ),
        bottomNavigationBar: BottomBarNavigation());
  }
}
