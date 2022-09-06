import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: DefaultTabController(
        length: 2,
        child: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: ((context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  toolbarHeight: 40,
                  actions: [
                    Padding(
                      padding: EdgeInsets.only(right: 15, top: 18),
                      child: Icon(Icons.menu),
                    )
                  ],
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(10),
                    child: Container(
                      height: 14,
                      decoration: BoxDecoration(
                        color: Color(0xff1C1F2E),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  backgroundColor: Color(0xff1C1F2E),
                  expandedHeight: 173,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset(
                      'images/item6.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: _getHeaderProfile(),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  floating: true,
                  delegate: TabBarViewDelegate(
                    TabBar(
                      padding: EdgeInsets.symmetric(horizontal: 17),
                      indicatorColor: Color(0xffF35383),
                      tabs: [
                        Tab(
                          child: Image.asset('images/icon_tab_posts.png'),
                        ),
                        Tab(
                          child: Image.asset('images/icon_tab_bookmark.png'),
                        ),
                      ],
                    ),
                  ),
                ),
              ];
            }),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 17),
              child: TabBarView(
                children: [
                  CustomScrollView(
                    slivers: [
                      SliverPadding(padding: EdgeInsets.only(top: 20)),
                      SliverGrid(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage('images/item$index.jpg'),
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
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(2, 2),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 1),
                          ],
                        ),
                      ),
                    ],
                  ),
                  CustomScrollView(
                    slivers: [
                      SliverPadding(padding: EdgeInsets.only(top: 20)),
                      SliverGrid(
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
                          repeatPattern: QuiltedGridRepeatPattern.mirrored,
                          pattern: [
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(2, 2),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 1),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getHeaderProfile() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17, vertical: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(50),
                padding: EdgeInsets.all(4),
                color: Color(0xffF35383),
                dashPattern: [15, 3],
                strokeWidth: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(48)),
                  child: Container(
                    height: 70,
                    width: 70,
                    child: Image.asset('images/1.jpg'),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                height: 70,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ArianForoutan | flutter . kotlin',
                        style: TextStyle(
                          fontFamily: 'GB',
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'arian_code',
                        style: TextStyle(
                          fontFamily: 'GB',
                          color: Color(0xffC5C5C5),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Image.asset('images/icon_profile_edit.png')
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ' دانشجو مهندسی کامپیوتر',
                  style: TextStyle(
                    fontFamily: 'SH',
                    color: Colors.white,
                    fontSize: 11,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  '(kotlin)در مسیر یادگیری برنامه نویسی اندروید',
                  style: TextStyle(
                    fontFamily: 'SH',
                    color: Colors.white,
                    fontSize: 11,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "(flutter) و دارت ",
                  style: TextStyle(
                    fontFamily: 'SH',
                    color: Colors.white,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 17, vertical: 20),
            child: Row(
              children: [
                Text(
                  "32",
                  style: TextStyle(
                    fontFamily: 'GB',
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Posts',
                  style: TextStyle(
                    fontFamily: 'GB',
                    color: Color(0xffC5C5C5),
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "873",
                  style: TextStyle(
                    fontFamily: 'GB',
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Followers',
                  style: TextStyle(
                    fontFamily: 'GB',
                    color: Color(0xffC5C5C5),
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "137",
                  style: TextStyle(
                    fontFamily: 'GB',
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Following',
                  style: TextStyle(
                    fontFamily: 'GB',
                    color: Color(0xffC5C5C5),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TabBarViewDelegate extends SliverPersistentHeaderDelegate {
  TabBarViewDelegate(this._tabBar);

  final TabBar _tabBar;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Color(0xff1C1F2E),
      child: _tabBar,
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
