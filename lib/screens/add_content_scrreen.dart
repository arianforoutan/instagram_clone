import 'package:flutter/material.dart';

class Addcontent extends StatelessWidget {
  const Addcontent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            _getcustomscroll(context),
            Container(
              width: double.infinity,
              height: 75,
              decoration: BoxDecoration(
                  color: Color(0xff272B40),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 17, vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Draft',
                      style: TextStyle(
                          color: Colors.white, fontSize: 16, fontFamily: 'GB'),
                    ),
                    Text(
                      'Gallery',
                      style: TextStyle(
                          color: Colors.white, fontSize: 16, fontFamily: 'GB'),
                    ),
                    Text(
                      'Take',
                      style: TextStyle(
                          color: Colors.white, fontSize: 16, fontFamily: 'GB'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getcustomscroll(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: _getHeader(),
        ),
        SliverToBoxAdapter(
          child: _getbodycontent(context),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 17, vertical: 3),
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
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
          ),
        ),
        SliverPadding(padding: EdgeInsets.only(top: 100))
      ],
    );
  }

  Widget _getbodycontent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 17,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 375,
          width: double.infinity,
          child: Image.asset(
            'images/item4.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _getHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17, vertical: 27),
      child: Row(
        children: [
          Text(
            'Post',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontFamily: 'GB',
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Image.asset('images/icon_arrow_down.png'),
          Spacer(),
          Text(
            'Next',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontFamily: 'GB',
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Image.asset('images/icon_arrow_right_box.png'),
        ],
      ),
    );
  }
}
