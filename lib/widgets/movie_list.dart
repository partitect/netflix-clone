import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:netflix_clone/utils/hexColor.dart';

SliverToBoxAdapter horizontalMovieList(
    List<Map<String, Object>> jsonList, String movieTitle) {
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
                    displayBottomSheet(context, jsonList[index], "2");
                  },
                  child: CachedNetworkImage(
                    imageUrl: "https://image.tmdb.org/t/p/original$posterPath",
                    imageBuilder: (context, imageProvider) => Container(
                      margin: EdgeInsets.only(right: 7),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                      width: MediaQuery.of(context).size.width / 3.5,
                      height: 170,
                    ),
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
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
