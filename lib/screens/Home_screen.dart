import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'share_bottomsheet.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              width: 24,
              height: 24,
              child: Image.asset('images/icon_direct.png'),
            ),
          )
        ],
        elevation: 0,
        backgroundColor: Color(0xff1C1F2E),
        title: Container(
          width: 128,
          height: 24,
          child: Image.asset('images/moodinger_logo.png'),
        ),
      ),
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _getStorylist()),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Column(children: [_getListPost()]);
              }, childCount: 4),
            )
          ],
        ),
      ),
    );
  }

  Widget _getStorylist() {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return index == 0
              ? _getAddStorysBox()
              : _getStoryListBox(
                  index,
                );
        },
      ),
    );
  }

  Widget _getListPost() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 1,
      itemBuilder: (context, index) {
        return Column(
          children: [
            SizedBox(
              height: 20,
            ),
            _getHeaderPost(),
            SizedBox(
              height: 24,
            ),
            _getPostContent(),
          ],
        );
      },
    );
  }

  Widget _getPostContent() {
    return Container(
      height: 400,
      width: 394,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Positioned(
              top: 0,
              child: SizedBox(
                height: 355,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'images/item11.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 15,
              right: 15,
              child: Image.asset('images/icon_video.png'),
            ),
            Positioned(
              bottom: 20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Container(
                    height: 46,
                    width: 340,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color.fromRGBO(255, 255, 255, 0.5),
                          Color.fromRGBO(255, 255, 255, 0.2)
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset('images/icon_hart.png'),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                '2.6 k',
                                style: TextStyle(
                                  fontFamily: 'GB',
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Image.asset('images/icon_comments.png'),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                '1.6 k',
                                style: TextStyle(
                                  fontFamily: 'GB',
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  barrierColor: Colors.transparent,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom),
                                      child: DraggableScrollableSheet(
                                        initialChildSize: 0.4,
                                        maxChildSize: 0.7,
                                        minChildSize: 0.3,
                                        builder: ((context, scrollController) {
                                          return SharebottomSheet(
                                            scrollController: scrollController,
                                          );
                                        }),
                                      ),
                                    );
                                  });
                            },
                            child: Image.asset('images/icon_share.png'),
                          ),
                          Image.asset('images/icon_save.png'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getHeaderPost() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          _getStoryBox(),
          Padding(
            padding: EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'arian_code',
                  style: TextStyle(
                    fontFamily: 'GB',
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                Text(
                  'آرین فروتن برنامه نویس موبایل',
                  style: TextStyle(
                    fontFamily: 'SH',
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Image.asset('images/icon_menu.png')
        ],
      ),
    );
  }

  Widget _getStoryBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        children: [
          DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(17),
            padding: EdgeInsets.all(4),
            color: Color(0xffF35383),
            dashPattern: [15, 5],
            strokeWidth: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Container(
                height: 40,
                width: 40,
                child: Image.asset('images/1.jpg'),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _getStoryListBox(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        children: [
          DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(17),
            padding: EdgeInsets.all(4),
            color: Color(0xffF35383),
            dashPattern: [6, 3],
            strokeWidth: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Container(
                height: 58,
                width: 58,
                child: Image.asset(
                  'images/$index.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            name[index - 1],
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }

  Widget _getAddStorysBox() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          height: 64,
          width: 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.all(2.0),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xff1C1F2E),
              ),
              child: Image.asset('images/icon_plus.png'),
            ),
          ),
        ),
        Text(
          'your story',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  List<String> name = [
    'arian_code',
    'Alex',
    'emma',
    'Danielle',
    'programmer',
    'mark22',
    'rose1996',
    'Ali.python',
    'm_r_A_real'
  ];
}
