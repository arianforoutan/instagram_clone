import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _getsearchbox(),
            ),
            SliverToBoxAdapter(
              child: _getStorylist(),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 17),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage('images/item$index.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }, childCount: 10),
                gridDelegate: SliverQuiltedGridDelegate(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  repeatPattern: QuiltedGridRepeatPattern.inverted,
                  pattern: [
                    QuiltedGridTile(2, 1),
                    QuiltedGridTile(2, 2),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getsearchbox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        height: 46,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: Color(0xff272B40),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Image.asset('images/icon_search.png'),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search User',
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              Image.asset('images/icon_scan.png'),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getStorylist() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      height: 23,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xff272B40),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                child: Text(
                  'arian $index',
                  style: TextStyle(
                      fontFamily: 'SH', fontSize: 12, color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
