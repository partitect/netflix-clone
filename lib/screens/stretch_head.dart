import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/data/top_rated_movie_json.dart';
import 'package:netflix_clone/data/trending_movie_json.dart';
import 'package:netflix_clone/data/trending_tv_json.dart';
import 'package:sliver_stretch_header/sliver_stretch_header.dart';

class StretchHeader extends StatefulWidget {
  @override
  _StretchHeaderState createState() => _StretchHeaderState();
}

class _StretchHeaderState extends State<StretchHeader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            brightness: Brightness.dark,
            pinned: true,
            backgroundColor: Colors.black.withOpacity(.7),
            title: Container(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Diziler"),
                  Text("Filmler"),
                  Text("Listem"),
                ],
              ),
            ),
          ),
          SliverStretchHeader(
            minBlankExtent: 550,
            background: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://images-na.ssl-images-amazon.com/images/I/81xi4hVhR8L._SL1500_.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.red.withOpacity(.5),
                    BlendMode.darken,
                  ),
                ),
              ),
            ),
            child: Container(
              color: Colors.green.withOpacity(.5),
              height: 60,
              child: Center(child: Text("Child Widget")),
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
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Popular Tv Shows on Netflix",
                      style: GoogleFonts.quicksand(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  Container(
                    height: 200.0,
                    //margin: EdgeInsets.all(5),
                    child: ListView.builder(
                      cacheExtent: 1000.0,
                      scrollDirection: Axis.horizontal,
                      itemCount: trendingTvList[0]["results"].length,
                      itemBuilder: (context, index) {
                        var posterPath = trendingTvList[0]["results"][index]
                            ["backdrop_path"];
                        return Container(
                          margin: EdgeInsets.only(right: 7),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.brown,
                            borderRadius: BorderRadius.all(
                              Radius.circular(2),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://image.tmdb.org/t/p/original$posterPath"),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                Colors.red.withOpacity(.5),
                                BlendMode.darken,
                              ),
                            ),
                          ),
                          width: MediaQuery.of(context).size.width / 3,
                          height: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                trendingTvList[0]["results"][index]["name"] ??
                                    "No Name",
                                style: GoogleFonts.quicksand(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                            ],
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
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Popular Movie on Netflix",
                      style: GoogleFonts.quicksand(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  Container(
                    height: 200.0,
                    //margin: EdgeInsets.all(5),
                    child: ListView.builder(
                      cacheExtent: 1000.0,
                      scrollDirection: Axis.horizontal,
                      itemCount: trendingMovieList[0]["results"].length,
                      itemBuilder: (context, index) {
                        var posterPath = trendingMovieList[0]["results"][index]
                            ["backdrop_path"];
                        return Container(
                          margin: EdgeInsets.only(right: 7),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.brown,
                            borderRadius: BorderRadius.all(
                              Radius.circular(2),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://image.tmdb.org/t/p/original$posterPath"),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                Colors.red.withOpacity(.5),
                                BlendMode.darken,
                              ),
                            ),
                          ),
                          width: MediaQuery.of(context).size.width / 3,
                          height: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                trendingMovieList[0]["results"][index]
                                        ["title"] ??
                                    "No Name",
                                style: GoogleFonts.quicksand(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                            ],
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
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Top Rated Films on Netflix",
                      style: GoogleFonts.quicksand(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  Container(
                    height: 200.0,
                    //margin: EdgeInsets.all(5),
                    child: ListView.builder(
                      cacheExtent: 1000.0,
                      scrollDirection: Axis.horizontal,
                      itemCount: topRatedMovieList[0]["results"].length,
                      itemBuilder: (context, index) {
                        var posterPath = topRatedMovieList[0]["results"][index]
                            ["backdrop_path"];
                        return Container(
                          margin: EdgeInsets.only(right: 7),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.brown,
                            borderRadius: BorderRadius.all(
                              Radius.circular(2),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://image.tmdb.org/t/p/original$posterPath"),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                Colors.red.withOpacity(.5),
                                BlendMode.darken,
                              ),
                            ),
                          ),
                          width: MediaQuery.of(context).size.width / 3,
                          height: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                topRatedMovieList[0]["results"][index]
                                        ["title"] ??
                                    "No Name",
                                style: GoogleFonts.quicksand(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                            ],
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
    );
  }
}
