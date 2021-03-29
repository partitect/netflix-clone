import 'package:flutter/material.dart';
import 'package:sliver_stretch_header/sliver_stretch_header.dart';

class StretchHeader extends StatefulWidget {
  @override
  _StretchHeaderState createState() => _StretchHeaderState();
}

class _StretchHeaderState extends State<StretchHeader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            brightness: Brightness.dark,
            pinned: true,
            backgroundColor: Colors.black.withOpacity(.5),
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
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return Container(height: 50, child: Center(child: Text("$index")));
          }, childCount: 50))
        ],
      ),
    );
  }
}
