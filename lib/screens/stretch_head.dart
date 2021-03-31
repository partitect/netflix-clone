import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/data/top_rated_movie_json.dart';
import 'package:netflix_clone/data/trending_movie_json.dart';
import 'package:netflix_clone/data/trending_tv_json.dart';
import 'package:netflix_clone/data/upcoming_movie_json.dart';
import 'package:sliver_stretch_header/sliver_stretch_header.dart';

class StretchHeader extends StatefulWidget {
  @override
  _StretchHeaderState createState() => _StretchHeaderState();
}

class _StretchHeaderState extends State<StretchHeader> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void displayBottomSheet(BuildContext context, name, type) {
    var posterPath = name["poster_path"];
    var titleType = "";
    type == "1" ? titleType = name["name"] : titleType = name["title"];
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (ctx) {
          return Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: HexColor("2B2B2B"),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.33,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .25,
                        height: 155,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://image.tmdb.org/t/p/original$posterPath",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * .55,
                                child: Text(
                                  titleType,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.close_rounded,
                                color: Colors.white,
                                size: 20,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                "2021",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "16+",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "1 Sezon",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .61,
                            child: Text(
                              name["overview"],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ConstrainedBox(
                        constraints:
                            BoxConstraints.tightFor(width: 200, height: 40),
                        child: ElevatedButton.icon(
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
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.download_sharp,
                            color: Colors.white,
                          ),
                          Text(
                            "İndir",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                          ),
                          Text(
                            "Özel Video",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 0),
                      padding: EdgeInsets.only(
                          top: 10, left: 5, right: 5, bottom: 5),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                              width: .5, color: Colors.white.withOpacity(.3)),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.info_rounded,
                                  color: Colors.white, size: 30),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Bölümler ve Daha Fazlası",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          Container(
                            child: Icon(Icons.chevron_right,
                                size: 30, color: Colors.white),
                          )
                        ],
                      ))
                ],
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("171717"),
      body: SafeArea(
        child: CustomScrollView(
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
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10, top: 5),
                      child: Text(
                        "Popüler Diziler",
                        style: GoogleFonts.quicksand(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    Container(
                      height: 170.0,
                      //margin: EdgeInsets.all(5),
                      child: ListView.builder(
                        cacheExtent: 1000.0,
                        scrollDirection: Axis.horizontal,
                        itemCount: trendingTvList[0]["results"].length,
                        itemBuilder: (context, index) {
                          var posterPath = trendingTvList[0]["results"][index]
                              ["poster_path"];
                          return InkWell(
                            onTap: () {
                              displayBottomSheet(context,
                                  trendingTvList[0]["results"][index], "1");
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 7),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.brown,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://image.tmdb.org/t/p/original$posterPath"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              width: MediaQuery.of(context).size.width / 3.5,
                              height: 170,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10, top: 5),
                      child: Text(
                        "Popüler Filmler",
                        style: GoogleFonts.quicksand(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    Container(
                      height: 170.0,
                      //margin: EdgeInsets.all(5),
                      child: ListView.builder(
                        cacheExtent: 1000.0,
                        scrollDirection: Axis.horizontal,
                        itemCount: trendingMovieList[0]["results"].length,
                        itemBuilder: (context, index) {
                          var posterPath = trendingMovieList[0]["results"]
                              [index]["poster_path"];
                          return InkWell(
                            onTap: () {
                              displayBottomSheet(context,
                                  trendingMovieList[0]["results"][index], "2");
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 7),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.brown,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://image.tmdb.org/t/p/original$posterPath"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              width: MediaQuery.of(context).size.width / 3.5,
                              height: 170,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10, top: 5),
                      child: Text(
                        "En İyi Filmler",
                        style: GoogleFonts.quicksand(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    Container(
                      height: 170.0,
                      //margin: EdgeInsets.all(5),
                      child: ListView.builder(
                        cacheExtent: 1000.0,
                        scrollDirection: Axis.horizontal,
                        itemCount: topRatedMovieList[0]["results"].length,
                        itemBuilder: (context, index) {
                          var posterPath = topRatedMovieList[0]["results"]
                              [index]["poster_path"];
                          return InkWell(
                            onTap: () {
                              displayBottomSheet(context,
                                  topRatedMovieList[0]["results"][index], "2");
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 7),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.brown,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://image.tmdb.org/t/p/original$posterPath"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              width: MediaQuery.of(context).size.width / 3.5,
                              height: 170,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10, top: 5),
                      child: Text(
                        "Gelecek Filmler",
                        style: GoogleFonts.quicksand(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    Container(
                      height: 170.0,
                      //margin: EdgeInsets.all(5),
                      child: ListView.builder(
                        cacheExtent: 1000.0,
                        scrollDirection: Axis.horizontal,
                        itemCount: upcomingMovieList[0]["results"].length,
                        itemBuilder: (context, index) {
                          var posterPath = upcomingMovieList[0]["results"]
                              [index]["poster_path"];
                          return InkWell(
                            onTap: () {
                              displayBottomSheet(context,
                                  upcomingMovieList[0]["results"][index], "2");
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 7),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.brown,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://image.tmdb.org/t/p/original$posterPath"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              width: MediaQuery.of(context).size.width / 3.5,
                              height: 170,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              color: Colors.grey,
            ),
            label: 'Ana Sayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.video_collection_outlined,
              color: Colors.grey,
            ),
            label: 'Çok Yakında',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.download_outlined,
              color: Colors.grey,
            ),
            label: 'İndirilenler',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedLabelStyle: TextStyle(color: Colors.red),
        onTap: _onItemTapped,
      ),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
