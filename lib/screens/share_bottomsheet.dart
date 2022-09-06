import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SharebottomSheet extends StatelessWidget {
  const SharebottomSheet({this.scrollController, Key? key}) : super(key: key);

  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(255, 255, 255, 0.5),
                Color.fromRGBO(255, 255, 255, 0.2)
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              child: _getGridContent(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getGridContent(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.bottomCenter, children: [
      CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  height: 5,
                  width: 67,
                  margin: EdgeInsets.only(top: 10, bottom: 22),
                  decoration: BoxDecoration(
                    color: Color(0xffF35383),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Share',
                        style: TextStyle(
                          fontFamily: 'GB',
                          color: Color(0xffF35383),
                          fontSize: 20,
                        ),
                      ),
                      Image.asset(
                        'images/icon_share_bottomsheet.png',
                        color: Color(0xffF35383),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Container(
                    height: 46,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Color.fromRGBO(255, 255, 255, 0.5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          Image.asset('images/icon_search.png'),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search User',
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return _getItemGrid(index);
            }, childCount: 9),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                mainAxisExtent: 90),
          ),
          SliverPadding(padding: EdgeInsets.only(top: 100))
        ],
      ),
      Positioned(
        bottom: 47,
        child: ElevatedButton(
          onPressed: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 45, vertical: 13),
            child: Text('Send'),
          ),
        ),
      ),
    ]);
  }

  Widget _getItemGrid(int index) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              'images/${index + 1}.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text('arian_code',
            style: TextStyle(
              fontFamily: 'GB',
              fontSize: 12,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center),
      ],
    );
  }
}
