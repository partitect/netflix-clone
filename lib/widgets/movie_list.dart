import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

SliverToBoxAdapter horizontalMovieList(
    List<Map<String, Object>> jsonList, String movieTitle) {
  return SliverToBoxAdapter(
    child: Container(
      padding: EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10, top: 5),
            child: Text(
              movieTitle,
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
              itemCount: jsonList[0].length,
              itemBuilder: (context, index) {
                var posterPath = jsonList[index]["poster_path"];
                return InkWell(
                  onTap: () {
                    //displayBottomSheet( context,jsonList[index], "2");
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
  );
}
